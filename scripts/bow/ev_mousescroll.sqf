disableserialization;

_ctrl = _this select 0;
_button = _this select 1;

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false };

// don't trigger when (any) dialog is shown.
if (dialog) exitWith { false };

_reload = _button < 0;
_unload = _button > 0;

_bowState =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
if (_bowState == "empty" and _unload) then {
	_muzzle = currentMuzzle player;
	if (_muzzle == "ArrowMuzzle") then {
		// don't allow switching if no quiver is attached.
		_items = primaryWeaponItems player;
		_quiver = _items select 1;
		if (_quiver != "") then {
			_isQuiver = isClass (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo");
			if (_isQuiver) then {
				_quiverCount = getNumber (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "count");
				if (_quiverCount > 0) then {
					player selectWeapon "QuiverMuzzle";
				};
			};
		};
	} else {
		player selectWeapon "ArrowMuzzle";
	};
} else {
	if (_reload or _unload) then {
		_action = if (_reload) then {"reload"} else {"unload"};
		_handled = [_action] call FLAY_fnc_ReloadBow;
	};
};

_muzzle = currentMuzzle player;
player selectWeapon _muzzle;

_handled = true; // override scroll menu when using bow
_handled;