private ["_magazines", "_weapon", "_muzzle", "_compatibleMagazines", "_result"];

_magazines = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;

_compatibleMagazines =  getArray (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "magazines");
_result = [];
_result1 = [];

{ if (_x in _compatibleMagazines) then { _result = _result + [_x]; } else { _result1 = _result1 + [_x]; }; } forEach _magazines;

[_result, _result1];