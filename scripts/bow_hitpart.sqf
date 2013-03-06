_part1 = _this select 0;
_target = _part1 select 0;
_shooter = _part1 select 1;
_projectile = _part1 select 2;
_position = _part1 select 3;
_velocity = _part1 select 4;
_selection = _part1 select 5;
_ammo = _part1 select 6;
_direction = _part1 select 7;
_radius = _part1 select 8;
_surface = _part1 select 9;
_direct = _part1 select 10;

if (not (_ammo in ["RegularArrow","FastArrow","FlameArrow"])) exitWith {hint "skipped bow_hitpart";};

// don't handle this arrow in arrow_trail.sqf
_projectile setVariable ["target",_target];

_marker = "Sign_sphere25cm_EP1" createVehicle _position;
_marker attachTo [_target,[0,0,0.5],"Neck"];

_mpos = _target worldToModel _position;
_npos = _target selectionPosition "Neck";
_mpos = [_mpos,[0,0,-(getPosASL _target select 2)]] call BIS_fnc_vectorAdd; // workaround for bug in worldToModel not returning correct z-value.

_offs = [_npos,_mpos] call BIS_fnc_vectorDiff;

_arrow = "FLAY_Arrow" createVehicle _position;
_arrow setVectorUp [0,0,1];

_d = _velocity call BIS_fnc_unitVector;
_x = _d select 0;
_y = _d select 1;
_z = _d select 2;
_dir = _y atan2 _x;

_arrow attachTo [_target,_offs,"Neck"];

_pitch = _z atan2 sqrt (_x * _x + _y * _y);
nul = [_arrow, -_pitch, 0] call BIS_fnc_setPitchBank;

_targetDir = getDir _target;
_arrow setDir (-_targetDir - _dir - 90); // _dir is in global space while setDir works in model local space.


_blood = "FLAY_Blood" createVehicle _position;
_blood attachTo [_target,_offs,"Neck"];
_blood setDir (-_targetDir - _dir - 90); // _dir is in global space while setDir works in model local space.

