disableserialization;

_ctrl = _this select 0;
_button = _this select 1;
_handled = false;

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

// only run next part if not in inventory dialog
if (dialog) exitWith { false };

_bowState =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
if (_bowState == "loaded") then {
	if (_button == 0) then {
		_timeout = time + 0.25;
		player setVariable ["flay.archery.state.fireOnRelease", _timeout];
		_handled = true;
		["next"] call FLAY_fnc_SetBowState;
	};
};

if (_bowState == "empty") then {
	if (_button == 0) then {
		_handled = true;
		["next"] call FLAY_fnc_SetBowState;
	};
};

_handled;