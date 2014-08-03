/* fn_moduleStealth.sqf
 */

private ["_logic", "_units", "_activated"];
 
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

missionNamespace setVariable ["flay.archery.module", _logic];

FLAY_stealth_IsStealthKillCallback = {

	private ["_target", "_selection", "_damage","_unit","_projectile","_stealthKilled"];

	_target = _this select 0;
	_selection = _this select 1;
	_damage = _this select 2;
	_unit = _this select 3;
	_projectile = _this select 4;

	// handle function being called multiple times per shot (ie. once for every selection)
	_stealthKilled = _target getVariable ["flay.stealth.killed", false];
	if (_stealthKilled) exitWith { true };
	
	// determine weather the shot was stealthy and fatal
	if (_damage < 1) exitWith { false };
	
	// TODO: add weapon / ammo check

	_target setVariable ["flay.stealth.killed", true];	
};

FLAY_stealth_InLineOfSight = {

	// quite messy because i'm not sure how to do a proper line of sight test in sqf.
	
	private ["_unit", "_target", "_range", "_fov", "_inView", "_inSight", "_inRange", "_detected"];

	_unit = [_this,0] call BIS_fnc_param; 
	_target = [_this,1] call BIS_fnc_param; 
	_range = [_this,2,100,[0]] call BIS_fnc_param; 
	_fov = [_this,3,130,[0]] call BIS_fnc_param; 
	_debug = [_this,4,false,[false]] call BIS_fnc_param;
	
	_viewDirX = (eyeDirection _unit) select 0;
	_viewDirY = (eyeDirection _unit) select 1;
	_viewDir = _viewDirX atan2 _viewDirY;

	_detected = false;
	_inRange = (_unit distance _target) < _range;
	if (_inRange) then {
		_inView = [position _unit, _viewDir, _fov, position _target] call BIS_fnc_inAngleSector; 
		_occluded = terrainIntersectASL [eyePos _unit, eyePos _target];
		_objects = lineIntersectsWith [eyePos _unit, eyePos _target, _unit, _target];
		_blocked = count _objects;
		
		// the weapon blocks the line of sight, so ignore it...
		{ if (_x isKindOf "WeaponHolder") then {_blocked = _blocked - 1};
		} forEach _objects;
		
		_inSight = _blocked == 0;
		_detected = _inView && _inSight && not _occluded;
		if (_debug) then {
			player globalchat format ["unit:%4 target:%5 view:%1 sight:%2 occ:%3", _inView, _inSight, _occluded, _unit, _target];
		};
	};
	_detected;
};

FLAY_stealth_OnDeadBodyDetected = {
	private ["_deadbody","_unit","_killer","_groupx","_mode","_behaviour","_waypoint"];

    _deadbody = _this select 0;
    _unit = _this select 1; // unit who detected the dead body
    _killer = _this select 2; // unit who killed the dead body

    //player globalchat format ["body %1 detected by %2 killer is %3", _deadbody, _unit, _killer];

    _groupx = group _unit;
    _groupx reveal [_killer, 1];
	_unit reveal [_killer, 1];
    _mode = combatMode _unit;
    _behaviour = behaviour _unit;

    //if (_mode in ["RED"]) exitWith {};
   	if (_behaviour in ["COMBAT","STEALTH"]) exitWith {};

    _waypoint = _groupx addWaypoint [position _deadbody, 0];
    _waypoint setWaypointType "SAD";
    _waypoint setWaypointBehaviour "COMBAT";
    _waypoint setWaypointCombatMode "RED";
    _groupx setCurrentWaypoint _waypoint;

    _killer addRating 1000; // TODO: add proper rating    
	_killer setCaptive false;
};

FLAY_stealth_DeadBodyHandler = {
	private ["_x","_detected","_deadbody","_killer", "_units","_xlos","_deadbodySide","_onDeadBodyDetected","_module","_maxBodyDetectRange","_maxBodyDetectFov"];
	_detected = false;
	_deadbody = _this select 0;
	_killer = _this select 3;
	_deadbodySide = _deadbody getVariable ["flay.stealth.side", civilian]; // dead bodies become civs after a while
	_onDeadBodyDetected = missionNamespace getVariable ["flay.stealth.onDeadBodyDetected", FLAY_stealth_OnDeadBodyDetected];
	_posASL = getPosASL _deadbody;
	// TODO: likelihood of detection should depend of weather, timeofday, and how long the body has been dead.
	_module = missionNamespace getVariable "flay.archery.module";
	_maxBodyDetectRange = _module getVariable ["MaxBodyDetectRange", 50];
	_maxBodyDetectFov = _module getVariable ["MaxBodyDetectFov", 130];
	while { not _detected } do {
		_units = (position _deadbody) nearEntities ["Man", _maxBodyDetectRange]; 
		{
    		if (alive _x && (side _x == _deadbodySide)) then {
				// TODO: base fov on distance.
    			_xlos = [_x, _deadbody, _maxBodyDetectRange, _maxBodyDetectFov] call FLAY_stealth_InLineOfSight;
    			if (_xlos) then {
    				[_deadbody, _x, _killer] call _onDeadBodyDetected;
    				_detected = true;
    			};
    		};
    	} forEach _units;
    	sleep 1;		
	};
};

FLAY_stealth_Detected = {
	private ["_detected", "_unit"];
	_unit = _this select 0;
	_detected = 0;
	{
		if (side _x != side _unit and side _x != civilian) then {
			_detected = _detected max (_x knowsAbout _unit);
		};
	} forEach allUnits;
	_detected;
};

FLAY_stealth_DamageEventHandler = {

	private ["_target", "_damage","_unit","_projectile", "_isStealthKillCallback","_isStealthKill"];

	// assume it was a stealth kill, revert later if it turns out it wasn't.
	(_this select 3) setCaptive true;
	
	_target = _this select 0;
	_damage = _this select 2;
	_unit = _this select 3;
	
	_newRating = -1000;
	_oldRating = rating _unit;
	if (_oldRating < 0) then {
		_newRating = 0;
	};
	
	_unit addRating _newRating;
	
	// if it wasn't a stealth kill, then revert to default damage
	_isStealthKillCallback = missionNamespace getVariable ["flay.stealth.isStealthKillCallback", FLAY_stealth_IsStealthKillCallback];
	_isStealthKill = _this call _isStealthKillCallback;
	if (not _isStealthKill) exitWith {
		//_unit addRating (_oldRating - _newRating);
		//_unit setCaptive false;
		if (not isNull _unit) then {
			FLAY_stealth_kills set [count FLAY_stealth_kills, _this];
		};
		_damage;
	};
	
	// FIXME: this part is run more than needed (ie. once for every selection with damage > 1)
	
	 // dead bodies becomes civilian, remember target's side for handling detection later
	_target setVariable ["flay.stealth.side", side _target];

	// how can _unit even be null?!!!
	if (not isNull _unit) then {
		FLAY_stealth_kills set [count FLAY_stealth_kills, _this];
	};
	1; // fatal damage
};

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then {

	_this spawn {

		private ["_logic","_debug","_event","_unit","_handler"];
		
		_logic = [_this,0,objNull,[objNull]] call bis_fnc_param;
		_debug = _logic getVariable ["Debug", false];
		if (_debug) then {
			[player] call FLAY_fnc_moduleStealthDebug;
		};
		
		waitUntil { !isNil { BIS_fnc_init } };
		
		// add custom damage event handler to all units
		{ _handler = _x addEventHandler ["HandleDamage", "_this call FLAY_stealth_DamageEventHandler"];
		  _x setVariable ["flay.stealth.handler", _handler];
		} forEach allUnits;
		
		FLAY_stealth_kills = [];
		
		while { true } do {
			waitUntil { count FLAY_stealth_kills > 0 };
			_event = [FLAY_stealth_kills] call bis_fnc_arrayshift;
			_target = _event select 0;
			_unit = _event select 3;
			if (not alive _target) then {
				_event spawn FLAY_stealth_DeadBodyHandler;
			} else {
				_target reveal [_unit, 1];
			};
			sleep 5; // arbitrary delay to prevent detection when setting captive to false
			_unit setCaptive false;
		};
	};
};

