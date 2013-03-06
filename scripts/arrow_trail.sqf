BIS_fnc_vectorFromXToY=compile preprocessFile "\ca\modules\Functions\vectors\fn_vectorFromXToY.sqf";
BIS_fnc_unitVector=compile preprocessFile "\ca\modules\Functions\vectors\fn_unitVector.sqf";
BIS_fnc_magnitude=compile preprocessFile "\ca\modules\Functions\vectors\fn_magnitude.sqf";
BIS_fnc_magnitudeSqr=compile preprocessFile "\ca\modules\Functions\vectors\fn_magnitudeSqr.sqf";
BIS_fnc_rotateVector2D=compile preprocessFile "\ca\modules\Functions\vectors\fn_rotateVector2D.sqf";
BIS_fnc_vectorDiff=compile preprocessFile "\ca\modules\Functions\vectors\fn_vectorDiff.sqf";
BIS_fnc_vectorAdd=compile preprocessFile "\ca\modules\Functions\vectors\fn_vectorAdd.sqf";
_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
_mode = _this select 3;
_ammo = _this select 4;
_magazine = _this select 5;
_projectile = _this select 6;
_trail1 = "#particlesource" createVehicleLocal getpos _projectile;
//_trail1 attachto [_projectile,[0,0,0]];
//_trail1 setParticleRandom [0.2, [0.05, 0.05, 0.05], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];
_interval = 0.0025;
_intensity = 1;
_trail1 setdropinterval _interval;
_trail1 setParticleParams [
["\ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 13, 3, 0], "", //type
"Billboard", // type
1, // timerper
2*_intensity, // lifetime
[0,0,0], // pos
[0,0,0], // movevelocity
0, // rotationvel
1.0, // weight
0.79,  //volume
0.18, // rubbing
[0.25, 0.05], // scale
[[1, 1, 1, 0.04*_intensity], //color
[1, 1, 1, 0.14*_intensity],
[1, 1, 1, 0.05*_intensity], 
[1, 1, 1, 0]], 
[1000], // animation speed
100, // randdir period
0.01, // randdirintensity
"", // ontimerscript
"", // destroyscript
_projectile, // follow
360]; // lifetimevar

if (_weapon == "FLAY_CompoundBow") then {
	_p = aimPos _unit;
	_d = _unit weaponDirection _weapon;
	while {alive _projectile} do {
		_q = getpos _projectile;
		_v = abs(velocity _projectile select 0)+abs(velocity _projectile select 1)+abs(velocity _projectile select 2);
		if (_v < 5) then {
			// arrow hit static object or ground (case when it hits a unit/vehicle is handled in bow_hitpart.sqf)
			if (isNull (_projectile getVariable ["target", objNull])) then {
				_arrow = "FLAY_Arrow" createVehicle _q;
				_arrow setPos _q;
				_arrow setVectorUp [0,0,1];
				_arrow setVectorDir _d;
				_arrow setDir ((getDir _arrow) + 180);
				_pitch = (_d select 2) atan2 sqrt ((_d select 0) * (_d select 0) + (_d select 1) * (_d select 1));
				nul = [_arrow, -_pitch, 0] call BIS_fnc_setPitchBank;
			};
			deleteVehicle _projectile;
			deleteVehicle _trail;
			if (_ammo == "FlameArrow") then {
				nul = [_arrow,4,time,false,true] spawn BIS_Effects_Burn;
				_list = _q nearEntities [["Man","Air","Car","Motorcycle","Tank"], 4];
				{[_x,1,time,false,true] spawn BIS_Effects_Burn;} forEach _list;
			};
			
		} else {
			_r = (velocity _projectile) call BIS_fnc_unitVector;
			_v = abs(velocity _projectile select 0)+abs(velocity _projectile select 1)+abs(velocity _projectile select 2);
			if (_v >= 5) then {
				hint str _d;
				_d = _r;
			};
			_p = _q;
		};
		sleep 0.01;
	};
};