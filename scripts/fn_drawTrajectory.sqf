/* FLAY_fnc_drawTrajectory */
 
 { 
	_marker = _x getVariable "FLAY.trajectory.begin";
	_visible = _marker getVariable ["FLAY.trajectory.visible", false];
	if (not _visible) then {
		_marker setVariable ["FLAY.trajectory.visible", true];
		_trajectory = _marker getVariable ["FLAY.trajectory", []];
		{
			_pos = _x select 0;
			_theta = _x select 1;
			_dir = _x select 2;
			_rgba = _x select 3;
			_len = _x select 4;
				
			_r = "FLAY_Segment" createVehicleLocal _pos;
			_r setObjectTexture [0, _rgba];
			_r setPosASL _pos;
			_r setVectorUp [0,0,1];
			_r animate ["L0",_len];
			_r animate ["R0",_theta];
			_r setDir _dir;
				
		} forEach _trajectory;
	};
 } forEach (player nearObjects ["FLAY_ArrowPlaceholder", 50]);
