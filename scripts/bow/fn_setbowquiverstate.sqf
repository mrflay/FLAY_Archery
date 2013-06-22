private ["_unit", "_animate", "_next", "_magazines", "_magazine", "_muzzle", "_weapon", "_items"];
private ["_state", "_nextWeapon", "_autoLoadMagazine", "_reloadAction", "_unloadAction"];
private ["_quiver", "_quiverCount", "_nextQuiver", "_prevQuiver"];
private ["_filteredMagazines", "_filteredMagazines"];

_unit = player;
_next = _this select 0;
_animate = true;

if (count _this > 1) then {
	_animate = _this select 1;
};

_magazines = magazines _unit;
_magazine = currentMagazine _unit;
_weapon = currentWeapon _unit;
_muzzle = currentMuzzle _unit;
_items = primaryWeaponItems _unit;

// ensure this is only called when quiver is active
if (_muzzle != "QuiverMuzzle") exitWith {
	player globalChat format ["fn_setbowquiverstate: '%1' not 'QuiverMuzzle'", _muzzle];
	false;
};

// ensure a quiver is mounted
_quiver = _items select 1;
if (_quiver == "") exitWith {
	player globalChat "fn_setbowquiverstate: no quiver mounted";
	false;
};

// ensure a quiver is mounted
_isQuiver = isClass (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo");
if (not _isQuiver) exitWith {
	player globalChat ["fn_setbowquiverstate: '%1' is not a quiver", _quiver];
	false;
};

_quiverMagazine = getText (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "magazine");
_quiverCount = getNumber (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "count");
_quiverPoint = getText (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "point");
_nextQuiver =  getText (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "next");
_prevQuiver =  getText (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "prev");

_state = getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
_nextWeapon =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> _next);
_nextState =  getText (configFile >> "CfgWeapons" >> _nextWeapon >> "FLAY_BowInfo" >> "state");

// transition animations
_reloadAction =  getText (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "reloadAction");
_unloadAction =  getText (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "unloadAction");

if (_next == "next" and _animate) then {
	_unit playActionNow _reloadAction;
};

if (_next == "prev" and _animate) then {
	_unit playActionNow _unloadAction;
};

// loading bow, removing arrow from quiver
if (_state == "empty" and _next == "next") then {
	_unit removeItemFromPrimaryWeapon _quiver;
	_unit addPrimaryWeaponItem _prevQuiver;
	_unit addMagazine _quiverMagazine;
	// handle arrow point
	_arrowPoint = _items select 0;
	if (_arrowPoint != "") then {
		_unit removeItemFromPrimaryWeapon _arrowPoint;
		//_unit addItem _arrowPoint;
	};
	if (_quiverPoint != "") then {
		_unit addPrimaryWeaponItem _quiverPoint;
	};
	if (_animate) then {
		sleep 0.5;
	};
};

// unloading bow, putting arrow back in quiver
if (_state == "loaded" and _next == "prev") then {
	_unit removeItemFromPrimaryWeapon _quiver;
	_unit addPrimaryWeaponItem _nextQuiver;
	_unit removeMagazine _quiverMagazine;
	// handle arrow point
	_arrowPoint = _items select 0;
	if (_arrowPoint != "") then {
		_unit removeItemFromPrimaryWeapon _point;
		//_unit addItem _point;
	};	
};

// update _items as quiver may have changed
_items = primaryWeaponItems _unit;
_magazines =  magazines _unit;

// returns two element array with magazines for current muzzle in first entry
// and all other magazines in second entry.
_filteredMagazines = [_magazines, _weapon, _muzzle] call FLAY_fnc_FilterMagazines;

_unit removeWeapon _weapon;
{ _unit removeMagazines _x; } forEach _magazines; // ensures that weapon is not auto loaded

if (_nextState == "empty") then {
	// add weapon first
	_unit addWeapon _nextWeapon;
	_unit selectWeapon _muzzle;
	// add magazines
	{ _unit addMagazine _x; } forEach _magazines;
	//if (_magazine != "") then {
	//	_unit addMagazine _magazine;
	//};
};

if (_nextState == "loaded") then {
	
	// reload
	if (_state == "empty") then {
		{ _unit addMagazine _x; } forEach (_filteredMagazines select 0);
		// add weapon
		_unit addWeapon _nextWeapon;
		_unit selectWeapon _muzzle;
		// add magazines for other weapon / muzzles after weapon to prevent
		// auto-loading them (which will make them disappear when switching state).
		{ _unit addMagazine _x; } forEach (_filteredMagazines select 1);
	};
	
	// unload
	if (_state == "drawn") then {
		// add loaded magazine first
		_unit addMagazine _magazine;
		// add weapon
		_unit addWeapon _nextWeapon;
		_unit selectWeapon _muzzle;	
		// add remaining magazines
		{ _unit addMagazine _x; } forEach _magazines;
	};
	
	// ensure the arrow point is updated according to loaded magazine
	_magazine = currentMagazine _unit;
	_magazineHasPoint = isText (configFile >> "CfgMagazines" >> _magazine >> "FLAY_Point");
	if (_magazineHasPoint) then {
		_magazinePoint = getText (configFile >> "CfgMagazines" >> _magazine >> "FLAY_Point");
		if (_magazinePoint != "") then {
			_unit addPrimaryWeaponItem _magazinePoint;
		} else {
			_currentPoint = _items select 0;
			_unit removeItemFromPrimaryWeapon _currentPoint;
		};
		//_currentPoint = _items select 0;
		//if (_currentPoint == "") then {
		//	_unit addItem _magazinePoint;
		//};	
	};
};

if (_nextState == "drawn") then {
	// add the currently loaded magazine first
	if (_magazine != "") then {
		_unit addMagazine _magazine;
	};
	// add weapon
	_unit addWeapon _nextWeapon;
	_unit selectWeapon _muzzle;
	// add remaining magazines
	{ _unit addMagazine _x; } forEach _magazines;
};


// drop the arrow point when bow is fired
if (_nextState == "empty") then {
	_items = [_items select 1, _items select 2];
};

// add all attachments
{ if (_x != "") then { player addPrimaryWeaponItem _x; }; } forEach _items;

// let the bow stay drawn for a short period before returning to empty bow state.
if (_state == "drawn" and _next == "empty" and _animate) then {
	sleep 0.25; // temporary for testing
	_unit playActionNow _reloadAction; // when drawn reloadAction is the fire animation
};	