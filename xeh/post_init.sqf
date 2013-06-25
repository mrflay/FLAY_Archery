private ["_center", "_group", "_logic"];

if (isDedicated) exitWith {};

waitUntil {!(IsNull (findDisplay 46))};

FLAY_EH_MouseButtonDown = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_mousebuttondown.sqf";
FLAY_EH_MouseButtonUp = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_mousebuttonup.sqf";
FLAY_EH_MouseScroll = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_mousescroll.sqf";
FLAY_EH_KeyDown = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_KeyDown.sqf";
FLAY_EH_KeyUp = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_KeyUp.sqf";

["MouseButtonDown", "_this call FLAY_EH_MouseButtonDown"] call CBA_fnc_addDisplayHandler;
["MouseButtonUp", "_this call FLAY_EH_MouseButtonUp"] call CBA_fnc_addDisplayHandler;
["KeyDown", "_this call FLAY_EH_KeyDown"] call CBA_fnc_addDisplayHandler;
["KeyUp", "_this call FLAY_EH_KeyUp"] call CBA_fnc_addDisplayHandler;
["MouseZChanged", "_this call FLAY_EH_MouseScroll"] call CBA_fnc_addDisplayHandler;
