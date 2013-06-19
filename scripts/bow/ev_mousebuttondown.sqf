disableserialization;

_ctrl = _this select 0;
_button = _this select 1;
_handled = false;

// only run next part if not in inventory dialog
if (dialog) exitWith { false };

_weapon = currentWeapon player;
_muzzle = currentMuzzle player;
_magazines = magazines player;
if (_weapon in ["FLAY_CompoundBowLoaded"]) then {
	if (_button == 0) then {
		player setVariable ["flay.archery.state.fireOnRelease", true];
		_handled = true;
		[_magazines] spawn {
			sleep 0.05;
			player PlayActionNow "GestureReset"; 
			player PlayActionNow "GestureReloadArrow";
			_weapon = currentWeapon player;
			_muzzle = currentMuzzle player;
			_magazines = _this select 0;
			player removeWeapon _weapon;
			{ player removeMagazines _x; } forEach _magazines;
			{ player addMagazine _x; } forEach _magazines;
			player addWeapon "FLAY_CompoundBowDrawn";
			player selectWeapon _muzzle;
		};
	};
};

_handled;