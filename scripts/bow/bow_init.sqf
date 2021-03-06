FLAY_EH_MouseButtonDown = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_mousebuttondown.sqf";
FLAY_EH_MouseButtonUp = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_mousebuttonup.sqf";
FLAY_EH_MouseScroll = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_mousescroll.sqf";
FLAY_EH_KeyDown = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_KeyDown.sqf";
FLAY_EH_KeyUp = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_KeyUp.sqf";

FLAY_EH_BowFired = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_BowFired.sqf";

FLAY_fnc_CanReloadBow = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_canreloadbow.sqf";
FLAY_fnc_ReloadBow = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_reloadbow.sqf";
FLAY_fnc_UnloadBow = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_unloadbow.sqf";
FLAY_fnc_SetBowState = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_setbowstate.sqf";
FLAY_fnc_SetBowQuiverState = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_setbowquiverstate.sqf";
FLAY_fnc_SetBackQuiverState = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_setbackquiverstate.sqf";
FLAY_fnc_FilterMagazines = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_filtermagazines.sqf";
FLAY_fnc_ApplyInventoryState = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\fn_applyinventorystate.sqf";

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "_this call FLAY_EH_MouseButtonDown;"];
(findDisplay 46) displayAddEventHandler ["MouseButtonUp", "_this call FLAY_EH_MouseButtonUp;"];
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call FLAY_EH_KeyDown;"];
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call FLAY_EH_KeyUp;"];
(findDisplay 46) displayAddEventHandler ["MouseZChanged", "_this call FLAY_EH_MouseScroll;"];

player addEventHandler ["fired", "_this call FLAY_EH_BowFired;"];

_this execVM "flay\flay_archery\scripts\target\target_score.sqf";
_this spawn {
	waitUntil { alive player };
	while { alive player } do {
		sleep 1;
		_arrows = (position player) nearObjects ["FLAY_Arrow", 4];
		if (count _arrows > 0) then {
			_actionId = player getVariable ["flay.archery.state.takeArrowsId", -1];
			if (_actionId < 0) then {
				_actionId = player addAction ["Take Arrow(s)", "flay\flay_archery\scripts\bow\fn_takearrows.sqf", [], -1000, true, true];
				player setVariable ["flay.archery.state.takeArrowsId", _actionId];
			};
		} else {
			_actionId = player getVariable ["flay.archery.state.takeArrowsId", -1];
			if (_actionId != -1) then {
				player removeAction _actionId;
				player setVariable ["flay.archery.state.takeArrowsId", -1];
			};
		};
	};
};