
_ctrl = _this select 0;
_button = _this select 1;

if (dialog) exitWith { false };

player globalchat str button;

_weapon = currentWeapon player;
if (not (_weapon in ["FLAY_CompoundBow", "FLAY_RecurveBow"])) exitWith { hint "fn_drawbow.sqf: not a bow"; false; };

if (_button == 0) then {
	
	_weapon = (weaponState player) select 0;
	_muzzle = (weaponState player) select 1;
	_ammoCount = (weaponState player) select 4;
	
	// abort if the bow is not drawn (ready to fire)
	if (_muzzle in ["DummyReloadBackQuiverMuzzle","DummyReloadBowQuiverMuzzle","DummyReloadBeltQuiverMuzzle","DummyReloadArrowMuzzle"]) exitWith { false };
	if (_ammoCount == 0) exitWith { false };
	
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
	player selectWeapon _muzzle;
	
	if (_muzzle == "ExplosiveArrowMuzzle") then {
		_mzlIdx = 2;
	};
	if (_muzzle == "BroadheadArrowMuzzle") then {
		_mzlIdx = 1;
	};
	if (_muzzle == "RegularArrowMuzzle") then {
		_mzlIdx = 0;
	};
	
	// fire the weapon
	gameLogic action ["useweapon", _unit, _unit, _wepIdx + _mzlIdx];

	// workaround for fixing the bow being stuck in its reload animation after resetting the reload animation.
	// i.e. remove and re-add the weapon to player (keeping all attachments, except the muzzle/arrowpoint).
	_items = primaryWeaponItems player;
	_items = [_items select 1, _items select 2]; // don't re-add the points, i.e treat arrow points as consumables
	player removeWeapon _weapon;
	player addWeapon _weapon;
	{ player addPrimaryWeaponItem _x; } forEach _items;

	// switch to the dummy reload muzzle 
	player setVehicleAmmo 0;
	_reloadMuzzle = player getVariable ["FLAY.archery.state.ReloadMuzzle", "DummyReloadBackQuiverMuzzle"];
	_reloadMagazine = player getVariable ["FLAY.archery.state.ReloadMagazine", "FLAY_1Rnd_DummyArrow1"];
	player addmagazine _reloadMagazine;
	player selectWeapon _reloadMuzzle;
	
};
_handled;