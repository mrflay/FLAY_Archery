disableserialization;

// Abort if weapon is not a bow.
_unit = player;
_weapon = currentWeapon _unit;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { 
	player globalchat "fn_setbowstate: weapon is not a bow";
	false; 
};

_animate = true;

if (count _this > 1) then {
	_animate = _this select 1;
};

if (_animate) then {
	_this spawn {
		_unit = player;
		_muzzle = currentMuzzle _unit;
		if (_muzzle == "ArrowMuzzle") then {
			_this call FLAY_fnc_SetBackQuiverState;
		};
		if (_muzzle == "QuiverMuzzle") then {
			_this call FLAY_fnc_SetBowQuiverState;
		};
	};
} else {
	_muzzle = currentMuzzle _unit;
	if (_muzzle == "ArrowMuzzle") then {
		_this call FLAY_fnc_SetBackQuiverState;
	};
	if (_muzzle == "QuiverMuzzle") then {
		_this call FLAY_fnc_SetBowQuiverState;
	};
}
