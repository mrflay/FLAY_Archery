_unit = _this select 0;
if (_unit == player) then {
	// Adding fired eventhandler using script, since when adding it by
	// config results in 6:th argument (projectile) being string rather
	// than object.
	_unit addEventHandler ["fired", "_this call FLAY_EH_BowFired"];
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
};