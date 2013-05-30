/* FLAY_fnc_clearTrajectory */

_lastid = player getVariable ["FLAY.trajectory.sequence", 0];
 
{ deleteVehicle _x; } forEach (player nearObjects ["FLAY_Segment", 100000]);

{ 
	_marker = _x getVariable "FLAY.trajectory.begin";
	_visible = _marker setVariable ["FLAY.trajectory.visible", false];
	_timestamp = _marker getVariable "FLAY.trajectory.starttime";
	if (_timestamp < time - 60) then {
		_marker2 = _marker getVariable "FLAY.trajectory.end";
		deleteVehicle _marker;
		deleteVehicle _marker2;
	};
} forEach (player nearObjects ["FLAY_ArrowPlaceholder", 100000]);
