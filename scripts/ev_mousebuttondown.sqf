
_ctrl = _this select 0;
_button = _this select 1;

_weapon = currentWeapon player;
if (not (_weapon in ["FLAY_CompoundBow", "FLAY_RecurveBow"])) exitWith { false; };


// only run if inventory dialog is shown
if (dialog) then {
	// track which magazine and muzzle attachment is active so we know whether to
	// switch the muzzleItem or magazine when button is released.
	_magazine = currentMagazine player;
	_muzzleItem = (player weaponAccessories _weapon) select 0;
	player setVariable ["FLAY.archery.state._inv_magazineBefore", _magazine];
	player setVariable ["FLAY.archery.state._inv_muzzleItemBefore", _muzzleItem];
};


// only run next part if not in inventory dialog
if (dialog) exitWith { false };

if (_button == 0) then {
	
	_muzzle = (weaponState player) select 1;
	_ammoCount = (weaponState player) select 4;
	
	// abort if the bow is not drawn (ready to fire)
	if (_muzzle in ["DummyReloadBackQuiverMuzzle","DummyReloadBowQuiverMuzzle","DummyReloadBeltQuiverMuzzle","DummyReloadArrowMuzzle"]) exitWith { false };
	if (_ammoCount == 0) exitWith { false };
	
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
	
	if (not _isDrawn) exitWith { false };
	
	// find the weapon/muzzle index for the "useweapon" action.
	_unit = player;
	_veh = vehicle _unit;
	_wepIdx = 0;
	_unit action ["SWITCHWEAPON", _veh, _veh, _wepIdx];
	while{(currentWeapon _unit) != _weapon} do {_wepIdx = _wepIdx + 1; _unit action ["SWITCHWEAPON", _veh, _veh, _wepIdx];};
	_wepIdx = _wepIdx;
	_mzlIdx = 0;
	
	
	// terminate the reload animation to enable the weapon to be fired.
	player playActionNow "GestureReset";
	//player playActionNow "GestureReloadArrow2";
	player selectWeapon "ArrowMuzzle";
	
	
	// fire the weapon
	gameLogic action ["useweapon", _unit, _unit, _wepIdx + _mzlIdx];

	// workaround for fixing the bow being stuck in its reload animation after resetting the reload animation.
	// i.e. remove and re-add the weapon to player (keeping all attachments, except the muzzle/arrowpoint).
	_items = primaryWeaponItems player;
	_items = [_items select 1, _items select 2]; // don't re-add the points, i.e treat arrow points as consumables
	[_items] call FLAY_fnc_ResetWeaponAnimHack;
	
	_reloadMuzzle = player getVariable ["FLAY.archery.state.ReloadMuzzle", "DummyReloadBackQuiverMuzzle"];
	_reloadMagazine = player getVariable ["FLAY.archery.state.ReloadMagazine", "FLAY_1Rnd_DummyArrow1"];
	player addmagazine _reloadMagazine;
	player selectWeapon _reloadMuzzle;
	
};
_handled;