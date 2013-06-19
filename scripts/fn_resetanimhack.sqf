
player playActionNow "GestureReset";
_weapon = primaryWeapon player;
_items = primaryWeaponItems player;
player removeweapon _weapon;
player setVehicleAmmo 0;
player addweapon _weapon;

if (count _this > 0) then {
	_items = _this select 0;
};

{ if (_x != "") then { player addPrimaryWeaponItem _x; }; } forEach _items;

// does not seem to be anyway to turn on flashlight in script.

//_headlightsOn = player getVariable ["FLAY.archery.state.headlight.on", false];
//if (_headlightsOn) then {
//	gameLogic action ["lightOn", player];
//} else {
//	gameLogic action ["lightOff", player];
//};