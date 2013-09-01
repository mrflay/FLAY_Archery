private ["_center", "_group", "_logic"];

if (isServer) then {

	// Dummy unit used as source for the "UseWeapon" action. This action
	// is executed on mouseButtonUp event when Far Cry style shooting is
	// enabled (i.e. the default).
	
	// _logic action ["UseWeapon", player, player, _muzzleIdx];

	_center = createCenter sideLogic;
	_group = createGroup _center;
	_logic = _group createUnit ["LOGIC", [0,0,0], [], 0, "NONE"];
	
	missionNamespace setVariable ["flay.archery.mission.gamelogic", _logic];
	
	_group createUnit ["FLAY_ModuleArchery", [0,0,0], [], 0, "NONE"];
};