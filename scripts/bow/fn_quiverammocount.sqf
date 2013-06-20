private ["_quiver", "_ammoCount"];

_quiver = _this;
_ammoCount = 0;
if (_quiver != "") then {
	_ammoCount = getNumber (configFile >> "CfgWeapons" >> _quiver >> "FLAY_QuiverInfo" >> "count");
};
_ammoCount;