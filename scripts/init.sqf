

FLAY_EH_MouseButtonDown = compile preprocessFile "ev_mousebuttondown.sqf";
FLAY_EH_MouseButtonUp = compile preprocessFile "ev_mousebuttonup.sqf";
FLAY_EH_MouseScroll = compile preprocessFile "ev_mousescroll.sqf";
FLAY_EH_KeyDown = compile preprocessFile "ev_KeyDown.sqf";
FLAY_EH_KeyUp = compile preprocessFile "ev_KeyUp.sqf";

FLAY_fnc_ReloadBow = compile preprocessFile "fn_reload.sqf";
FLAY_fnc_UnloadBow = compile preprocessFile "fn_unload.sqf";
FLAY_fnc_ResetWeaponAnimHack = compile preprocessFile "fn_resetanimhack.sqf";
FLAY_fnc_CycleQuiver = compile preprocessFile "fn_cyclequiver.sqf";

//FLAY_Effects_EH_Fired=compile preprocessFile "scripts\bow_fired.sqf";
//FLAY_Effects_EH_Killed=compile preprocessFile "scripts\bow_killed.sqf";
//FLAY_EH_Hit=compile preprocessFile "scripts\bow_hit.sqf";
//FLAY_EH_HandleDamage=compile preprocessFile "scripts\bow_handledamage.sqf";
//FLAY_EH_HitPart=compile preprocessFile "scripts\bow_hitpart.sqf";

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "_this call FLAY_EH_MouseButtonDown;"];
(findDisplay 46) displayAddEventHandler ["MouseButtonUp", "_this call FLAY_EH_MouseButtonUp;"];
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call FLAY_EH_KeyDown;"];
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call FLAY_EH_KeyUp;"];
(findDisplay 46) displayAddEventHandler ["MouseZChanged", "_this call FLAY_EH_MouseScroll;"];

//player addEventHandler ["fired", { _this call FLAY_Effects_EH_Fired; }];
//player addEventHandler ["killed", { _this call FLAY_Effects_EH_Killed; }];
//player addEventHandler ["handledamage", { _this call FLAY_EH_HandleDamage; }];
//player addEventHandler ["hitpart", { _this call FLAY_EH_HitPart; }];
	