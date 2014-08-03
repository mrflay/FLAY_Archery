private ["_unit", "_animate", "_next", "_magazines", "_magazines", "_muzzle", "_weapon", "_items"];
private ["_state", "_nextWeapon", "_nextState", "_autoLoadMagazine", "_reloadAction", "_unloadAction"];

_unit = player;
_next = _this select 0;
_animate = true;

if (count _this > 1) then {
	_animate = _this select 1;
};

_weapon = currentWeapon _unit;
_muzzle = currentMuzzle _unit;
_items = primaryWeaponItems _unit;
_magazines = backpackItems  _unit;
_magazines = [_magazines, _weapon, _muzzle] call FLAY_fnc_filterMagazines;

_magazine = primaryWeaponMagazine _unit;
_magazine = if (count _magazine == 0) then {""} else {_magazine select 0};

_state = getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
_nextWeapon =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> _next);
_nextState =  getText (configFile >> "CfgWeapons" >> _nextWeapon >> "FLAY_BowInfo" >> "state");

// transition animations
_reloadAction =  getText (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "FLAY_reloadAction");
_unloadAction =  getText (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "FLAY_unloadAction");

if (_next == "next" and _animate) then {
	_unit playActionNow _reloadAction;
};

if (_next == "prev" and _animate) then {
	_unit playActionNow _unloadAction;
};

if (_state == "empty" and _nextState == "loaded" and _animate) then {
	sleep 0.5; // play animation for 0.5 seconds and then continue
};

_unit removeWeapon _weapon;
{ _unit removeItemFromBackpack _x; } forEach _magazines; // ensures that weapon is not auto loaded

if (_nextState == "empty") then {
	// add weapon first
	_unit addWeapon _nextWeapon;
	_unit selectWeapon _muzzle;
	// add magazines
	{ _unit addItemToBackpack _x; } forEach _magazines;
	if (_state == "loaded" and (not dialog)) then {
		if (_magazine != "") then {
			_unit addItemToBackpack _magazine;
		};
	};
};

if (_nextState == "loaded") then {
	
	// reload
	if (_state == "empty") then {
		// fixme: perhaps add a special state when loading from inventory?
		// add loaded magazine first (special case when working with inventory)
		//if (_magazine != "") then {
		//	_unit addItemToBackpack _magazine;
		//} else {
		//	{ _unit addItemToBackpack _x; } forEach _magazines;
		//};
		
		// add weapon
		_unit addWeapon _nextWeapon;
		_unit selectWeapon _muzzle;
		// add remaining magazines	(special case when working with inventory)
		//if (_magazine != "") then {
			{ _unit addItemToBackpack _x; } forEach _magazines;
		//};
	};
		
	// unload
	if (_state == "drawn") then {
		// add loaded magazine first
		//_unit addItemToBackpack _magazine;
		// add weapon
		_unit addWeapon _nextWeapon;
		_unit selectWeapon _muzzle;	
		// add remaining magazines
		//{ _unit addItemToBackpack _x; } forEach _magazines;
	};
	if (_magazine != "") then {
		_unit addItemToBackpack _magazine;
	};
};

if (_nextState == "drawn") then {
	// add the currently loaded magazine first
	if (_magazine != "") then {
		_unit addItemToBackpack _magazine;
	};
	// add weapon
	_unit addWeapon _nextWeapon;
	_unit selectWeapon _muzzle;
	// add remaining magazines
	{ _unit addItemToBackpack _x; } forEach _magazines;
};

// drop the arrow point when bow is fired
if (_nextState == "empty") then {
	if (_state == "drawn") then {
		_items = [_items select 1, _items select 2];
	};
};

// add all attachments
{ if (_x != "") then { player addPrimaryWeaponItem _x; }; } forEach _items;

// let the bow stay drawn for a short period before returning to empty bow state.
if (_state == "drawn" and _next == "empty" and _animate) then {
	sleep 0.25; // temporary for testing
	_unit playActionNow _reloadAction; // when drawn reloadAction is the fire animation
};	