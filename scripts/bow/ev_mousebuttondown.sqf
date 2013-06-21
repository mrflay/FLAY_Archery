disableserialization;

_ctrl = _this select 0;
_button = _this select 1;
_handled = false;

player globalchat "ev_mousebuttondown.sqf";

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

if (dialog) then {
	// remember inventory state to see if anything changed,
	// when mousebutton is released.
	[] call FLAY_fnc_StoreInventoryState;
};

// only run next part if not in inventory dialog
if (dialog) exitWith { false };

_bowState =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
if (_bowState == "loaded") then {
	if (_button == 0) then {
		player setVariable ["flay.archery.state.fireOnRelease", true];
		_handled = true;
		["next"] call FLAY_fnc_SetBowState;
	};
};

_handled;