disableserialization;

_key = (_this select 1);
_shift = (_this select 2);
_reloadKeys = actionKeys "ReloadMagazine";
_switchWeaponKeys = actionKeys "NextWeapon";
_handled=false;
_unit = player;

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

// don't trigger when (any) dialog is shown.
if (dialog) exitWith { false };

_reload = false;
_unload = false;

_bowState =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
if (_key in _reloadKeys) then {
	if (_bowState == "empty") then {
		_reload = true;
	} else {
		_unload = true;
	};
};

if (_reload or _unload) then {
	_action = if (_reload) then {"reload"} else {"unload"};
	_handled = [_action, true] call FLAY_fnc_ReloadBow;
};

if (_key in _switchWeaponKeys) then {
	
	// only allow switching muzzle when bow is empty
	_state = getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
	if (_state == "empty") then {
		// don't allow switching if no quiver is attached.
		_muzzle = currentMuzzle player;
		_items = primaryWeaponItems player;
		_quiver = _items select 1;
		if (_muzzle == "ArrowMuzzle") then {
			_isQuiver = isClass (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo");
			if (_isQuiver) then {
				_quiverCount = getNumber (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "count");
				_handled = (_quiverCount == 0);
				//if (_quiverCount > 0) then {
				//	_quiverMagazine = getText (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "magazine");
				//	_unit addMagazine _quiverMagazine;
				//};
			} else {
				_handled = true;
			};
		} else {
			//_isQuiver = isClass (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo");
			//if (_isQuiver) then {
			//	_quiverMagazine = getText (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "magazine");
			//	_unit removeMagazine _quiverMagazine;
			//};
		};
	} else {
		_handled = true;
	};
};

_handled;