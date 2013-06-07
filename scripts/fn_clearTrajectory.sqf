/* FLAY_fnc_clearTrajectory */

_lastid = player getVariable ["FLAY.trajectory.sequence", 0];
 
{
	// keep last 3 trajectories
	_id = _x getVariable ["FLAY.trajectory.sequence", -1];
	if (_id < _lastid - 2) then {
		deleteVehicle _x; 
	};
} forEach (player nearObjects ["FLAY_Segment", 1000]);

{ 
	_marker = _x getVariable "FLAY.trajectory.begin";
	_visible = _marker setVariable ["FLAY.trajectory.visible", false];
	_timestamp = _marker getVariable "FLAY.trajectory.starttime";
	if (_timestamp < time - 60) then {
		_marker2 = _marker getVariable "FLAY.trajectory.end";
		deleteVehicle _marker;
		deleteVehicle _marker2;
	};
} forEach (player nearObjects ["FLAY_ArrowPlaceholder", 1000]);
