/* FLAY_EH_trajectory
 *
 *
 */
 
#define COLOR_RED		"#(argb,8,8,3)color(1,0.1,0.1,1,CA)"
#define COLOR_GREEN		"#(argb,8,8,3)color(0.1,1,0.1,1,CA)"
#define COLOR_BLUE		"#(argb,8,8,3)color(0.1,0.1,1,1,CA)"
#define COLOR_YELLOW	"#(argb,8,8,3)color(1,1,0.5,1,CA)"
#define COLOR_WHITE		"#(argb,8,8,3)color(1,1,1,1,CA)"
#define COLOR_BLACK		"#(argb,8,8,3)color(0,0,0,1,CA)"
#define COLOR(r,g,b,a)  (format ["#(argb,8,8,3)color(%1,%2,%3,%4,CA)",r,g,b,a])

_unit = _this select 0;
_ammo = _this select 4;
_magazine = _this select 5;
_projectile = _this select 6;

if (isNull _projectile) then { 
	_projectile = nearestObject [_this select 0,_this select 4];
};

[_unit, _ammo, _magazine, _projectile] spawn {
	
	private ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_obj","_p","_q","_len","_dir","_dx","_dz","_dy","_r"];
	private ["_maxSpeed","_color","_rgba"];

	_unit = _this select 0;
	_ammo = _this select 1;
	_magazine = _this select 2;
	_projectile = _this select 3;
	
	_color = _unit getVariable ["FLAY.trajectory.color", COLOR_YELLOW];
	_rgba = _color;
	_timeout = 0;
	_p = getPosASL _projectile;
	_q = _p;
	
	_maxSpeed = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");

	switch (_color) do {
		case "RED":    {_rgba = COLOR_RED};
		case "GREEN":  {_rgba = COLOR_GREEN};
		case "BLUE":   {_rgba = COLOR_BLUE};
		case "YELLOW": {_rgba = COLOR_YELLOW};
		case "WHITE":  {_rgba = COLOR_WHITE};
		case "BLACK":  {_rgba = COLOR_BLACK};
	};
	
	_trajectory = [];
	_visible = player getVariable ["FLAY.trajectory.visible", false];
	_starttime = time;
	
	while { alive _projectile } do {
		
		if (_color == "VELOCITY") then {
			
			_v = velocity _projectile;
			_vx = _v select 0;
			_vy = _v select 1;
			_vz = _v select 2;
			_vv = sqrt(_vx^2+_vy^2+_vz^2);
					
			_t = _vv / (_maxSpeed+1); // +1 to account for moving when firing
			_R = 1.0;
			_G = 1.0;
			_B = 1.0;
			
			if (_t < 0.25) then {
				_x = _t / 0.25;
				_R = (1 - _x) * 0.0 + _x * 0.0;
				_G = (1 - _x) * 0.0 + _x * 1.0;
				_B = (1 - _x) * 1.0 + _x * 1.0;
			};
			if (_t >= 0.25 and _t < 0.5) then {
				_x = (_t - 0.25) / 0.25;
				_R = (1 - _x) * 0.0 + _x * 0.0;
				_G = (1 - _x) * 1.0 + _x * 1.0;
				_B = (1 - _x) * 1.0 + _x * 0.0;
			};
			if (_t >= 0.5 and _t < 0.75) then {
				_x = (_t - 0.5) / 0.25;
				_R = (1 - _x) * 0.0 + _x * 1.0;
				_G = (1 - _x) * 1.0 + _x * 1.0;
				_B = (1 - _x) * 0.0 + _x * 0.0;
			};
			if (_t >= 0.75) then {
				_x = (_t - 0.75) / 0.25;
				_R = (1 - _x) * 1.0 + _x * 1.0;
				_G = (1 - _x) * 1.0 + _x * 0.0;
				_B = (1 - _x) * 0.0 + _x * 0.0;
			};

			_rgba = COLOR(_R, _G, _B, 1.0);
		};
		
		if (time > _timeout) then {
		
			_timeout = time + 0.2;
			_p = getPosASL _projectile;
			
			_dx = (_p select 0) - (_q select 0);
			_dy = (_p select 1) - (_q select 1);
			_dz = (_p select 2) - (_q select 2);
				
			_len = sqrt(_dx^2 + _dy^2 + _dz^2);
			
			if (_len > 0 and _len <= 50) then {	
				_theta = _dz atan2 sqrt (_dx^2+_dy^2);
				_dir = [_q, _p] call BIS_fnc_dirTo;
				if (_visible) then {
					_r = "FLAY_Segment" createVehicleLocal _q;
					_r setObjectTexture [0, _rgba];
					_r setPosASL _q;
					_r setVectorUp [0,0,1];
					_r animate ["L0",_len];
					_r animate ["R0",_theta];
					_r setDir _dir;
				};
				_trajectory = _trajectory + [[_q,_theta,_dir,_rgba,_len]];
			};
			
			_q = _p;
		};
	};
	
	_endtime = time;
	_p = getPosASL _projectile;
	
	_dx = (_p select 0) - (_q select 0);
	_dy = (_p select 1) - (_q select 1);
	_dz = (_p select 2) - (_q select 2);
		
	_len = sqrt(_dx^2 + _dy^2 + _dz^2);
	
	if (_len > 0 and _len <= 50) then {	
		_theta = _dz atan2 sqrt (_dx^2+_dy^2);
		_dir = [_q, _p] call BIS_fnc_dirTo;
		_trajectory = _trajectory + [[_q,_theta,_dir,_rgba,_len]];
	};

	_id = player getVariable ["FLAY.trajectory.sequence", 0];
	_id = _id + 1;
	
	_startMarker = "FLAY_ArrowPlaceholder" createVehicleLocal _p;
	_startMarker setPosASL (getPosASL _unit);
	_startMarker setVariable ["FLAY.trajectory", _trajectory];
	//_endMarker addAction ["delete marker"];
	
	_endMarker = "FLAY_ArrowPlaceholder" createVehicleLocal _p;
	_endMarker setPosASL _p;
	//_endMarker addAction ["delete marker"];

	_endMarker setVariable ["FLAY.trajectory.begin", _startMarker];
	_endMarker setVariable ["FLAY.trajectory.end", _endMarker];
	
	_startMarker setVariable ["FLAY.trajectory.begin", _startMarker];
	_startMarker setVariable ["FLAY.trajectory.end", _endMarker];
	_startMarker setVariable ["FLAY.trajectory.visible", _visible];
	_startMarker setVariable ["FLAY.trajectory.starttime", _starttime];
	_startMarker setVariable ["FLAY.trajectory.endtime", _endtime];
	_startMarker setVariable ["FLAY.trajectory.id", _id];
	player setVariable ["FLAY.trajectory.sequence", _id];
	
};

