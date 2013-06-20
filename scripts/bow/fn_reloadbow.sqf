_reload = (_this select 0) == "reload"; 
_unload = (_this select 0) == "unload";
_reloadEndsDraw = false; // true if reload also should release drawn bow, otherwise false
_handled = false;

if (count _this > 1) then {
	_reloadEndsDraw = (_this select 1);
};

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

_bowState = getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
if (_bowState == "empty") then {
	if (_reload) then {
		_handled=true;
		_canReload = [] call FLAY_fnc_CanReloadBow;
		if (not _canReload) exitWith { true; };
		["next"] call FLAY_fnc_SetBowState;
	};
};

if (_bowState == "loaded") then {
	if (_reload) then {
		_handled = true;
		["next"] call FLAY_fnc_SetBowState;
	};
	if (_unload) then {
		_handled = true;
		["prev"] call FLAY_fnc_SetBowState;
	};	
};

if (_bowState == "drawn") then {
	if (_unload or (_reload and _reloadEndsDraw)) then {
		_handled = true;
		["prev"] call FLAY_fnc_SetBowState;
	};
};

_handled;