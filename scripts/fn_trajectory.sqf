/*  fn_trajectory.sqf
 *
 * Usage: [unit,color] call FLAY_fnc_trajectory;
 */
 
private ["_unit","_hid","_color"];
FLAY_Muskets_EH_trajectory2 = compile preprocessFile "ev_trajectory.sqf";
 
_unit = _this select 0;
_hid = _unit addEventHandler ["fired",{_this call FLAY_Muskets_EH_trajectory2;}];
_unit setVariable ["FLAY.muskets.trajectory.hid",_hid];

if (count _this > 1) then {
	_color = _this select 1;
	_unit setVariable ["FLAY.muskets.trajectory.color", _color];
};
