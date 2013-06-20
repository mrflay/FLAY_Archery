_weapon = currentWeapon player;
_muzzle = currentMuzzle player;
_magazines = magazines player;
_compatibleMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "magazines");
_canReload = false;

// add timeout to prevent reloading while reload is in progress
_timeout = player getVariable ["flay.archery.state.reloadTimeout", 0];
if (time < _timeout) exitWith { false; };

_timeout = time + 1; // todo: make timeout configurable
player setVariable ["flay.archery.state.reloadTimeout", _timeout];

// if no quiver is mounted

{ if (_x in _compatibleMagazines) then { _canReload = true; }; } forEach _magazines;

// if quiver is mounted

if (_muzzle == "QuiverMuzzle") then {
	
	_items = primaryWeaponItems player;
	_quiver = _items select 1;
	if (_quiver == "") exitWith {
		_canReload;
	};

	_isQuiver = isClass (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo");
	if (not _isQuiver) exitWith {
		_canReload;
	};

	_quiverCount = getNumber (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "count");
	_canReload = _quiverCount > 0;

};

_canReload;