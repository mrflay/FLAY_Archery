_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
_mode = _this select 3;
_ammo = _this select 4;
_magazine = _this select 5;
_projectile = _this select 6;
_handled = false;

if (_weapon in ["FLAY_CompoundBowDrawn"]) then {
	 _this execVM "\FLAY\FLAY_Archery\scripts\arrow_trail.sqf";
	_handled=true;
};
_handled;