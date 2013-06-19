
_ctrl = _this select 0;
_button = _this select 1;

// only run if inventory  dialog is shown
if (not dialog) exitWith { false };

_weapon = currentWeapon player;
if (not (_weapon in ["FLAY_CompoundBow", "FLAY_RecurveBow"])) exitWith { false; };

_magazineBefore = player getVariable ["FLAY.archery.state._inv_magazineBefore", ""];
_muzzleItemBefore = player getVariable ["FLAY.archery.state._inv_muzzleItemBefore", ""];

_magazineAfter = currentMagazine player;
_muzzleItemAfter = (player weaponAccessories _weapon) select 0;


_isDrawn = true;
_isLoaded = false;
_isEmpty = false;

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

// magazine changed
if (_magazineAfter != _magazineBefore) then {
	if (_magazineAfter == "FLAY_1Rnd_ExplosiveArrow") then {
		player addPrimaryWeaponItem "FLAY_point_Explosive";
	};
	if (_magazineAfter == "FLAY_1Rnd_BroadheadArrow") then {
		player addPrimaryWeaponItem "FLAY_point_Broadhead";
	};
	if (_magazineAfter == "FLAY_1Rnd_PrecisionArrow") then {
		player addPrimaryWeaponItem "FLAY_point_Precision";
	};
	if (_magazineAfter == "FLAY_1Rnd_RegularArrow") then {
		player removePrimaryWeaponItem _muzzleItemAfter;
	};
	if (_magazineAfter == "") then {
		player removePrimaryWeaponItem _muzzleItemAfter;
	};
	if (_muzzleItemBefore != "") then {
		player addItem _muzzleItemBefore;
	};
};

// muzzle changed
if (_muzzleItemAfter != _muzzleItemBefore) then {
	
	[] call FLAY_fnc_ResetWeaponAnimHack;
	player addMagazine "FLAY_1Rnd_DummyArrow2";
	if (_magazineBefore != "") then {

		if (_muzzleItemAfter == "FLAY_point_Explosive") then {
			player addMagazine "FLAY_1Rnd_ExplosiveArrow";
		};
		if (_muzzleItemAfter == "FLAY_point_Broadhead") then {
			player addMagazine "FLAY_1Rnd_BroadheadArrow";
		};
		if (_muzzleItemAfter == "FLAY_point_Precision") then {
			player addMagazine "FLAY_1Rnd_PrecisionArrow";
		};
		if (_muzzleItemAfter == "") then {
			player addMagazine "FLAY_1Rnd_RegularArrow";
		};
	};
	player selectWeapon "ArrowMuzzle";
};
