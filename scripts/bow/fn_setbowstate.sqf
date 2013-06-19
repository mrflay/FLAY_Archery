
_unit = player;
_next = _this select 0;

_magazines = magazines _unit;
_magazine = currentMagazine _unit;
_weapon = currentWeapon _unit;
_muzzle = currentMuzzle _unit;
_items = primaryWeaponItems _unit;

_currentState = getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
_nextWeapon =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> _next);
_autoLoadMagazine = getNumber (configFile >> "CfgWeapons" >> _nextWeapon >> "FLAY_BowInfo" >> "load") > 0;

_unit removeWeapon _weapon;
{ _unit removeMagazines _x; } forEach _magazines; // ensures that weapon is not auto loaded

// Adding mags before weapon ensures that the weapon
// will be auto loaded with a magazine.
if (_autoLoadMagazine) then {
	{ _unit addMagazine _x; } forEach _magazines;
};

_unit addWeapon _nextWeapon;
_unit selectWeapon _muzzle;

// Adding mags after the weapon ensures that the magazine
// will NOT be auto loaded.
if (not _autoLoadMagazine) then {
	{ _unit addMagazine _x; } forEach _magazines;
};

// Currently loaded magazine is not included in magazines command,
// so add it manually if needed.
if (_currentState == "drawn" and _next == "prev") then {
	_unit addMagazine _magazine;
};

if (_currentState == "drawn" and _next == "empty") then {
	_items = [_items select 0, _items select 1]; // drop the arrow point when fired
};

{ if (_x != "") then { player addPrimaryWeaponItem _x; }; } forEach _items;