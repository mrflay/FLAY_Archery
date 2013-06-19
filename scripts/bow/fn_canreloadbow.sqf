_weapon = currentWeapon player;
_muzzle = currentMuzzle player;
_magazines = magazines player;
_compatibleMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "magazines");
_canReload = false;
{ if (_x in _compatibleMagazines) then { _canReload = true; }; } forEach _magazines;
_canReload;