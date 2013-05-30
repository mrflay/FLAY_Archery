
_reloadMuzzleIndex = 0;
_reloadMuzzles = ["DummyReloadBackQuiverMuzzle","DummyReloadBowQuiverMuzzle"];
_reloadMagazines = ["FLAY_1Rnd_DummyArrow1","FLAY_1Rnd_DummyArrow3"];
_quiver = (primaryWeaponItems player) select 1;
if (_quiver != "") then {
	_reloadMuzzleIndex = player getVariable ["FLAY.archery.state.ReloadMuzzleIndex", 0];
};
//_reloadMuzzles = ["DummyReloadBackQuiverMuzzle","DummyReloadBowQuiverMuzzle","DummyReloadBeltQuiverMuzzle"];
//_reloadMagazines = ["FLAY_1Rnd_DummyArrow1","FLAY_1Rnd_DummyArrow3","FLAY_1Rnd_DummyArrow4"];		
_reloadMuzzle = (_reloadMuzzles select _reloadMuzzleIndex);
_reloadMagazine = (_reloadMagazines select _reloadMuzzleIndex);

// fixme: clear possible locked weapon anim (necessary?)
//_items = primaryWeaponItems player;
//_weapon = currentWeapon player;
//player removeWeapon _weapon;
//player setVehicleAmmo 0;
//player addWeapon _weapon;
//{ player addPrimaryWeaponItem _x; } forEach _items;
if (not (_reloadMagazine in magazines player)) then {
	player addmagazine _reloadMagazine;
};
player selectWeapon _reloadMuzzle;
player setVariable ["FLAY.archery.state.ReloadMuzzle", _reloadMuzzle];
player setVariable ["FLAY.archery.state.ReloadMagazine", _reloadMagazine];
player setVariable ["FLAY.archery.state.ReloadMuzzleIndex", (_reloadMuzzleIndex + 1) % (count _reloadMuzzles)];
