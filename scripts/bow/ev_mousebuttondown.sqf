disableserialization;

_ctrl = _this select 0;
_button = _this select 1;
_handled = false;

// only run next part if not in inventory dialog
if (dialog) exitWith { false };

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

_bowState =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
if (_bowState == "loaded") then {
	if (_button == 0) then {
		player setVariable ["flay.archery.state.fireOnRelease", true];
		_handled = true;
		[] spawn {
			sleep 0.05;
			player PlayActionNow "GestureReset"; 
			player PlayActionNow "GestureReloadArrow";
			["next"] call FLAY_fnc_SetBowState;
		};
	};
};

_handled;