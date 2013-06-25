FLAY_fnc_CanReloadBow = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_canreloadbow.sqf";
FLAY_fnc_ReloadBow = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_reloadbow.sqf";
FLAY_fnc_UnloadBow = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_unloadbow.sqf";
FLAY_fnc_SetBowState = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_setbowstate.sqf";
FLAY_fnc_SetBowQuiverState = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_setbowquiverstate.sqf";
FLAY_fnc_SetBackQuiverState = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_setbackquiverstate.sqf";
FLAY_fnc_FilterMagazines = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_filtermagazines.sqf";
FLAY_fnc_StoreInventoryState = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_storeinventorystate.sqf";
FLAY_fnc_ApplyInventoryState = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_applyinventorystate.sqf";

FLAY_EH_BowFired = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_BowFired.sqf";

if (isServer) then {

	// Dummy unit used as source for the "UseWeapon" action. This action
	// is executed on mouseButtonUp event when Far Cry style shooting is
	// enabled (i.e. the default).
	
	// _logic action ["UseWeapon", player, player, _muzzleIdx];

	_center = createCenter sideLogic;
	_group = createGroup _center;
	_logic = _group createUnit ["LOGIC", [0,0,0], [], 0, "NONE"];

	missionNamespace setVariable ["flay.archery.mission.gamelogic", _logic];
};