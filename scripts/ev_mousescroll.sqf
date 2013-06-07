
_ctrl = _this select 0;
_button = _this select 1;

_isReloading = player getVariable ["FLAY.archery.state.reloading", false];
if (_isReloading) exitWith {};

_isDrawn = true;
_isLoaded = false;
_isEmpty = false;

if (dialog) exitWith { false };

_magazines = magazines player;
if ("FLAY_1Rnd_DummyArrow3" in _magazines) then {
	_isDrawn = false;
	_isLoaded = false;
	_isEmpty = true;
};
if ("FLAY_1Rnd_DummyArrow1" in _magazines) then {
	_isDrawn = false;
	_isLoaded = false;
	_isEmpty = true;
};
if ("FLAY_1Rnd_DummyArrow2" in _magazines) then {
	_isDrawn = false;
	_isLoaded = true;
	_isEmpty = false;
};

_currentMagazine = currentMagazine player;
if (_currentMagazine == "" and count _magazines == 0) then {
	_isEmpty = true;
	_isLoaded = false;
	_isDrawn = false;
	player addMagazine "FLAY_1Rnd_DummyArrow1";
};

if (_button < 0) then {
	[] call FLAY_fnc_ReloadBow;
} else {
	if (_isLoaded) then {
		[] call FLAY_fnc_ResetWeaponAnimHack;
		_reloadMuzzle = player getVariable ["FLAY.archery.state.ReloadMuzzle", "DummyReloadBackQuiverMuzzle"];
		_reloadMagazine = player getVariable ["FLAY.archery.state.ReloadMagazine", "FLAY_1Rnd_DummyArrow1"];
		if (_reloadMuzzle == "DummyReloadBackQuiverMuzzle") then {
			player playActionNow "GestureReloadBackQuiver";
		};
		if (_reloadMuzzle == "DummyReloadBowQuiverMuzzle") then {
			player playActionNow "GestureReloadBowQuiver";
			[] call FLAY_fnc_UnloadBow;
		};
		player addmagazine _reloadMagazine;
		player selectweapon _reloadMuzzle;
		_weapon = primaryWeapon player;
		_muzzleItem = (player weaponAccessories _weapon) select 0;
		if (_muzzleItem != "") then {
			player removeItemFromPrimaryWeapon _muzzleItem;
		};
	};
	if (_isEmpty) then {
		[] call FLAY_fnc_CycleQuiver;
	};
	if (_isDrawn) then {
		_magazine = currentMagazine player;
		_muzzle = currentMuzzle player;
		[] call FLAY_fnc_ResetWeaponAnimHack;
		player addmagazine _magazine;
		[_muzzle, _magazine] spawn {
			_timeout = time + 0.2;
			while {time < _timeout} do {
				sleep 0.05;
				[] call FLAY_fnc_ResetWeaponAnimHack;
				player addmagazine (_this select 1);
				player addmagazine "FLAY_1Rnd_DummyArrow2";
				player selectweapon (_this select 0);
			};
		};
	};
};

true;