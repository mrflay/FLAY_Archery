disableserialization;
private ["_state","_unit","_weapon","_items","_muzzleAcc","_sideAcc","_opticAcc","_magazine"];

player globalchat "fn_storeinventorystate.sqf";

_unit = player;
_weapon = currentWeapon _unit;
_items = primaryWeaponItems _unit;
_muzzleAcc = _items select 0;
_sideAcc = _items select 1;
_opticAcc = _items select 2;

_magazine = currentMagazine _unit;
//_magazine = primaryWeaponMagazine _unit;
//_magazine = if (count _magazine == 0) then {""} else {_magazine select 0};
	
_state = [_weapon, _muzzleAcc, _sideAcc, _opticAcc, _magazine];
player setVariable ["flay.archery.inventory.state", _state];
