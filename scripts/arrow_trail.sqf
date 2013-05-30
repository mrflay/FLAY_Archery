_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
_mode = _this select 3;
_ammo = _this select 4;
_magazine = _this select 5;
_projectile = _this select 6;

if (_weapon in ["FLAY_CompoundBow","FLAY_RecurveBow"]) then {
	if (_ammo == "G_ExplosiveArrow") then {
		_smokeEmitter = "FLAY_SmokeEmitter" createVehicle (position _projectile);
		_smokeEmitter attachTo [_projectile, [0,0,0]];
	};
	_p = aimPos _unit;
	_q = getpos _projectile;
	_d = _unit weaponDirection _weapon;
	_v = velocity _projectile;
	_placeholder = "FLAY_ArrowPlaceholder" createVehicle _p;
	_placeholder setPos _p;
	_placeholder setVariable ["unit", _unit];
	while { alive _projectile } do {
		_p = getpos _projectile;
		_v = velocity _projectile;
		_s = abs(_v select 0)+abs(_v select 1)+abs(_v select 2);
		if (_s > 5) then {
			_d = _v;
		};
		_placeholder setPos _p;
		_placeholder setVariable ["velocity", _d];
		sleep 0.01;
	};
	sleep 0.1;
	// arrow hit static object or ground (case when it hits a unit/vehicle is handled in bow_hitpart.sqf)
	_handled = _placeholder getVariable ["handled", false];
	if (not _handled) then {
		_d = _d call BIS_fnc_unitVector;
		_arrow = "FLAY_Arrow" createVehicle _p;
		_arrow setPos _p;
		_arrow setVectorUp [0,0,1];
		_arrow setVectorDir _d;
		_arrow setDir ((getDir _arrow) + 180);
		_pitch = (_d select 2) atan2 sqrt ((_d select 0) * (_d select 0) + (_d select 1) * (_d select 1));
		nul = [_arrow, -_pitch, 0] call BIS_fnc_setPitchBank;
	};
	deleteVehicle _projectile;
	deleteVehicle _placeholder;
};