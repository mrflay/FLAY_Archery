
_ctrl = _this select 0;
_button = _this select 1;

_isDrawn = true;
_isLoaded = false;
_isEmpty = false;

if (dialog) exitWith { false };

_magazines = magazines player;
if ("FLAY_1Rnd_DummyArrow3" in _magazines) then {
	_isDrawn = false;
	_isEmpty = true;
};
if ("FLAY_1Rnd_DummyArrow1" in _magazines) then {
	_isDrawn = false;
	_isEmpty = true;
};
if ("FLAY_1Rnd_DummyArrow2" in _magazines) then {
	_isDrawn = false;
	_isLoaded = true;
};

if (_button < 0) then {
	[] call FLAY_fnc_ReloadBow;
} else {
	if (_isLoaded) then {
		[] call FLAY_fnc_ResetWeaponAnimHack;
		player playActionNow "GestureReloadBackQuiver";
		player addmagazine "FLAY_1Rnd_DummyArrow1";
	};
	if (_isEmpty) then {
		[] call FLAY_fnc_CycleQuiver;
	};
	if (_isDrawn) then {
		// terminate the reload animation to enable the weapon to be fired.
		_magazine = currentMagazine player;
		_muzzle = currentMuzzle player;
		[] call FLAY_fnc_ResetWeaponAnimHack;
		player addmagazine _magazine;
		[_muzzle, _magazine] spawn {
			sleep 0.15;
			[] call FLAY_fnc_ResetWeaponAnimHack;
			player addmagazine (_this select 1);
			player addmagazine "FLAY_1Rnd_DummyArrow2";
			player selectweapon (_this select 0);
		};
	};
	
};

true;