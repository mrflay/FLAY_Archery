disableserialization;

_ctrl = _this select 0;
_button = _this select 1;

// only run next part if not in inventory dialog
if (dialog) exitWith { false };

_weapon = currentWeapon player;
_muzzle = currentMuzzle player;
_magazines = magazines player;
_magazine = currentMagazine player;
if (_weapon in ["FLAY_CompoundBowDrawn"]) then {
	if (_button == 0) then {
		_fireOnRelease = player getVariable ["flay.archery.state.fireOnRelease", false];
		if (_fireOnRelease) then {
			_muzzleIndex = 23;
			gameLogic action ["useweapon", player, player, _muzzleIndex];
		};
		player PlayActionNow "GestureReset";
		player removeWeapon _weapon;
		{ player removeMagazines _x; } forEach _magazines;
		player addWeapon "FLAY_CompoundBowEmpty";
		player selectWeapon _muzzle;
		{ player addMagazine _x; } forEach _magazines;
		//player addMagazine _magazine;
		player setVariable ["flay.archery.state.fireOnRelease", false];
	};
};
