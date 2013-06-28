
disableserialization;
private ["_unit","_isBow","_weapon","_newItems","_newMuzzleAcc","_newMagazine", "_magazines"];

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

_unit = player;	
_newItems = primaryWeaponItems _unit;
_newMuzzleAcc = _newItems select 0;

_newMagazine = primaryWeaponMagazine _unit;
_newMagazine = if (count _newMagazine == 0) then {""} else {_newMagazine select 0};

// fixme: remove hardcoded values
if (_newMagazine != "") then {
	_magazines = magazines _unit;
	_weapon = currentWeapon _unit;
	_unit removeWeapon _weapon;
	{ _unit removeMagazines _x; } forEach _magazines;
	
	if (_newMuzzleAcc == "FLAY_point_Explosive") then {
		_unit addMagazine "FLAY_1Rnd_ExplosiveArrow";
	};
	if (_newMuzzleAcc == "FLAY_point_Broadhead") then {
		_unit addMagazine "FLAY_1Rnd_BroadheadArrow";
	};
	if (_newMuzzleAcc == "FLAY_point_Precision") then {
		_unit addMagazine "FLAY_1Rnd_PrecisionArrow";
	};
	if (_newMuzzleAcc == "") then {
		_unit addMagazine "FLAY_1Rnd_Arrow";
	};
	
	_loadedWeapon =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "loaded");
	_unit addWeapon _loadedWeapon;
	{ _unit addMagazine _x; } forEach _magazines;
	{ if (_x != "") then { _unit addPrimaryWeaponItem _x; }; } forEach _newItems;
	_unit selectWeapon "ArrowMuzzle";
};

if (_newMagazine == "") then {
	["empty", false] call FLAY_fnc_SetBowState;
};

