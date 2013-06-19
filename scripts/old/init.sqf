FLAY_EH_MouseButtonDown = compile preprocessFile "\FLAY\FLAY_Archery\scripts\ev_mousebuttondown.sqf";
FLAY_EH_MouseButtonUp = compile preprocessFile "\FLAY\FLAY_Archery\scripts\ev_mousebuttonup.sqf";
FLAY_EH_MouseScroll = compile preprocessFile "\FLAY\FLAY_Archery\scripts\ev_mousescroll.sqf";
FLAY_EH_KeyDown = compile preprocessFile "\FLAY\FLAY_Archery\scripts\ev_KeyDown.sqf";
FLAY_EH_KeyUp = compile preprocessFile "\FLAY\FLAY_Archery\scripts\ev_KeyUp.sqf";

FLAY_fnc_ReloadBow = compile preprocessFile "\FLAY\FLAY_Archery\scripts\fn_reload.sqf";
FLAY_fnc_UnloadBow = compile preprocessFile "\FLAY\FLAY_Archery\scripts\fn_unload.sqf";
FLAY_fnc_ResetWeaponAnimHack = compile preprocessFile "\FLAY\FLAY_Archery\scripts\fn_resetanimhack.sqf";
FLAY_fnc_CycleQuiver = compile preprocessFile "\FLAY\FLAY_Archery\scripts\fn_cyclequiver.sqf";

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "_this call FLAY_EH_MouseButtonDown;"];
(findDisplay 46) displayAddEventHandler ["MouseButtonUp", "_this call FLAY_EH_MouseButtonUp;"];
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call FLAY_EH_KeyDown;"];
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call FLAY_EH_KeyUp;"];
(findDisplay 46) displayAddEventHandler ["MouseZChanged", "_this call FLAY_EH_MouseScroll;"];
