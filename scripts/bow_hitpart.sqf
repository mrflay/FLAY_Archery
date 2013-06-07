_part1 = _this select 0;
_target = _part1 select 0;
_shooter = _part1 select 1;
_projectile = _part1 select 2;
_position = ASLtoATL (_part1 select 3);
_velocity = _part1 select 4;
_selection = _part1 select 5;
_ammo = (_part1 select 6) select 4;
_direction = _part1 select 7;
_radius = _part1 select 8;
_surface = _part1 select 9;
_direct = _part1 select 10;


if (not (_ammo in ["B_RegularArrow","B_BroadheadArrow","B_PrecisionArrow","F_FlameArrow"])) exitWith {};

_placeholders = nearestObjects [_position, ["FLAY_ArrowPlaceholder"], 1];
if (count _placeholders != 1) exitWith {
	// player globalchat format ["count _placeholders == %1", count _placeholders];
};

_placeholder = _placeholders select 0;
_placeholder setVariable ["handled", true];
_shooter2 = _placeholder getVariable "unit";
if (_shooter != _shooter2) then {
	// player globalchat format ["wrong unit: %1 != %2", _shooter, _shooter2];
};

_arrow = "FLAY_Arrow" createVehicle _position;
_arrow setVectorUp [0,0,1];

_d = _velocity call BIS_fnc_unitVector;
_x = _d select 0;
_y = _d select 1;
_z = _d select 2;
_dir = _y atan2 _x;

_mpos = _target worldToModel _position;
//_mpos = [_mpos,[0,0,-(getPosASL _target select 2)]] call BIS_fnc_vectorAdd; // workaround for bug in worldToModel not returning correct z-value.

if (_target isKindOf "Man") then {
	_npos = _target selectionPosition "Neck";	
	_offs = [_npos, _mpos] call BIS_fnc_vectorDiff;
	_arrow attachTo [_target, [0,0,0], "Pelvis"];
} else {
	// player globalchat format ["tg:%1, pl:%2, pg:%3", str (getpos _target), str _mpos, str _position];
	_arrow attachTo [_target, _mpos];
};

_pitch = _z atan2 sqrt (_x * _x + _y * _y);
nul = [_arrow, -_pitch, 0] call BIS_fnc_setPitchBank;

_targetDir = getDir _target;
_arrow setDir (-_targetDir - _dir - 90); // _dir is in global space while setDir works in model local space.

//_blood = "FLAY_Blood" createVehicle _position;
//_blood attachTo [_target,_offs,"Neck"];
//_blood setDir (-_targetDir - _dir - 90); // _dir is in global space while setDir works in model local space.
