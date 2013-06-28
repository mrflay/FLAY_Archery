disableserialization;

private ["_ctrl", "_button", "_weapon", "_isBow", "_bowState", "_fireOnRelease", "_muzzleIndex"];

_ctrl = _this select 0;
_button = _this select 1;

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

if (dialog) then {
	// fixme: only trigger if inventory dialog is open.
};

// only run next part if not in inventory dialog
if (dialog) exitWith { false };

_bowState =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
if (_bowState == "drawn") then {
	if (_button == 0) then {
		_fireOnRelease = player getVariable ["flay.archery.state.fireOnRelease", 0];
		if (_fireOnRelease > 0) then {
			player setVariable ["flay.archery.state.fireOnRelease", 0];
			if (time > _fireOnRelease) then {
				
				_muzzleIndex = 0;
				_weaponIndex = 0;
				player action ["SwitchWeapon", vehicle player, vehicle player, _weaponIndex];
				while {(currentWeapon player) != _weapon} do {
					_weaponIndex = _weaponIndex + 1;
					player action ["SwitchWeapon", player, player, _weaponIndex];
				};
				
				if (_muzzle == "QuiverMuzzle") then {
					_muzzleIndex = 1;
				};
				
				_gameLogic = missionNamespace getVariable "flay.archery.mission.gamelogic";
				_gameLogic action ["UseWeapon", player, player, _weaponIndex + _muzzleIndex];
				["empty"] call FLAY_fnc_SetBowState;
			} else {
				player playActionNow "ResetGesture";
				["loaded"] call FLAY_fnc_SetBowState;
			}
		} else {
			["empty"] call FLAY_fnc_SetBowState;
		};
	};
};

