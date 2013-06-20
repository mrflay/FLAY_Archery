private ["_unit", "_next", "_magazines", "_magazine", "_muzzle", "_weapon", "_items"];
private ["_currentState", "_nextWeapon", "_autoLoadMagazine", "_reloadAction", "_unloadAction"];
private ["_quiver", "_quiverCount", "_nextQuiver", "_prevQuiver"];
private ["_filteredMagazines", "_filteredMagazines"];

_unit = player;
_next = _this select 0;

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

_currentState = getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
_nextWeapon =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> _next);
_autoLoadMagazine = getNumber (configFile >> "CfgWeapons" >> _nextWeapon >> "FLAY_BowInfo" >> "load") > 0;

// transition animations
_reloadAction =  getText (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "reloadAction");
_unloadAction =  getText (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "unloadAction");

if (_next == "next") then {
	_unit playActionNow _reloadAction;
};

if (_next == "prev") then {
	_unit playActionNow _unloadAction;
};

// loading bow, removing arrow from quiver
if (_currentState == "empty" and _next == "next") then {
	_unit removePrimaryWeaponItem _quiver;
	_unit addPrimaryWeaponItem _prevQuiver;
	_unit addMagazine _quiverMagazine;
	// handle arrow point
	_arrowPoint = _items select 0;
	if (_arrowPoint != "") then {
		_unit removePrimaryWeaponItem _arrowPoint;
		//_unit addItem _arrowPoint;
	};
	if (_quiverPoint != "") then {
		_unit addPrimaryWeaponItem _quiverPoint;
	};
	sleep 0.5;
};

// unloading bow, putting arrow back in quiver
if (_currentState == "loaded" and _next == "prev") then {
	_unit removePrimaryWeaponItem _quiver;
	_unit addPrimaryWeaponItem _nextQuiver;
	_unit removeMagazine _quiverMagazine;
	// handle arrow point
	_arrowPoint = _items select 0;
	if (_arrowPoint != "") then {
		_unit removePrimaryWeaponItem _point;
		//_unit addItem _point;
	};	
};

// update _items as quiver may have changed
_items = primaryWeaponItems _unit;
_magazines =  magazines _unit;
_filteredMagazines = [_magazines, _weapon, _muzzle] call FLAY_fnc_FilterMagazines;

_unit removeWeapon _weapon;
{ _unit removeMagazines _x; } forEach _magazines; // ensures that weapon is not auto loaded

// Adding mags before weapon ensures that the weapon
// will be auto loaded with a magazine.
if (_autoLoadMagazine) then {
	_filteredMagazine = (_filteredMagazines select 0) select 0;
	_unit addMagazine _filteredMagazine;
};

_unit addWeapon _nextWeapon;
_unit selectWeapon _muzzle;

// Adding mags after the weapon ensures that the magazine
// will NOT be auto loaded.
if (not _autoLoadMagazine) then {
	_filteredMagazine = (_filteredMagazines select 0) select 0;
	_unit addMagazine _filteredMagazine;
};

// add all other magazines
{ _unit addMagazine _x; } forEach (_filteredMagazines select 1);

if (_currentState == "drawn" and _next == "prev") then {
	_unit addMagazine _magazine;
};

if (_currentState == "drawn" and _next == "empty") then {
	_items = [_items select 1, _items select 2]; // drop the arrow point when fired
};

{ if (_x != "") then { player addPrimaryWeaponItem _x; }; } forEach _items;

if (_currentState == "drawn" and _next == "empty") then {
	sleep 0.5; // temporary for testing
	_unit playActionNow _reloadAction; // when drawn reloadAction is the fire animation
};	