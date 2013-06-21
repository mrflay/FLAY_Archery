disableserialization;

private ["_ctrl", "_button", "_weapon", "_isBow", "_bowState", "_fireOnRelease", "_muzzleIndex"];

player globalchat "ev_mousebuttonup.sqf";

_ctrl = _this select 0;
_button = _this select 1;

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

if (dialog) then {
	[] call FLAY_fnc_ApplyInventoryState;
};

// only run next part if not in inventory dialog
if (dialog) exitWith { false };

_bowState =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
if (_bowState == "drawn") then {
	if (_button == 0) then {
		_fireOnRelease = player getVariable ["flay.archery.state.fireOnRelease", false];
		if (_fireOnRelease) then {
			_muzzleIndex = 23;
			gameLogic action ["useweapon", player, player, _muzzleIndex];
		};
		["empty"] call FLAY_fnc_SetBowState;
		player setVariable ["flay.archery.state.fireOnRelease", false];
	};
};

