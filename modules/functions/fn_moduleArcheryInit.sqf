if (isDedicated) exitWith {};

waitUntil {!(IsNull (findDisplay 46))};

FLAY_EH_MouseButtonDown = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_mousebuttondown.sqf";
FLAY_EH_MouseButtonUp = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_mousebuttonup.sqf";
FLAY_EH_MouseScroll = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_mousescroll.sqf";
FLAY_EH_KeyDown = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_KeyDown.sqf";
FLAY_EH_KeyUp = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_KeyUp.sqf";
FLAY_EH_BowFired = compile preprocessFile "\FLAY\FLAY_Archery\scripts\bow\ev_BowFired.sqf";

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "_this call FLAY_EH_MouseButtonDown"];
(findDisplay 46) displayAddEventHandler ["MouseButtonUp", "_this call FLAY_EH_MouseButtonUp"];
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call FLAY_EH_KeyDown"];
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call FLAY_EH_KeyUp"];
(findDisplay 46) displayAddEventHandler ["MouseZChanged", "_this call FLAY_EH_MouseScroll"];

// Adding fired eventhandler using script, since when adding it by
// config results in 6:th argument (projectile) being string rather
// than object.
player addEventHandler ["fired", "_this call FLAY_EH_BowFired"];
_this execVM "flay\flay_archery\scripts\target\target_score.sqf";
_this spawn {
	while { alive player } do {
		sleep 1;
		_arrows = (position player) nearObjects ["FLAY_Arrow", 4];
		if (count _arrows > 0) then {
			_actionId = player getVariable ["flay.archery.state.takeArrowsId", -1];
			if (_actionId < 0) then {
				_actionId = player addAction ["Take Arrow(s)", "flay\flay_archery\scripts\bow\fn_takearrows.sqf", [], 6, true, true];
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
