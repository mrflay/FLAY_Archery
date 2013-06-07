player playActionNow "GestureReset";
_weapon = primaryWeapon player;
_items = primaryWeaponItems player;
player removeweapon _weapon;
player setVehicleAmmo 0;
//player removeMagazine "FLAY_1Rnd_RegularArrow";
//player removeMagazine "FLAY_1Rnd_RegularArrow";
//player removeMagazine "FLAY_1Rnd_BroadheadArrow";
//player removeMagazine "FLAY_1Rnd_PrecisionArrow";
//player removeMagazine "FLAY_1Rnd_PrecisionArrow";
//player removeMagazine "FLAY_1Rnd_BroadheadArrow";
//player removeMagazine "FLAY_1Rnd_ExplosiveArrow";
//player removeMagazine "FLAY_1Rnd_ExplosiveArrow";
//player removemagazine "FLAY_1Rnd_DummyArrow2";
//player removemagazine "FLAY_1Rnd_DummyArrow2";
//player removemagazine "FLAY_1Rnd_DummyArrow1";
//player removemagazine "FLAY_1Rnd_DummyArrow1";
player addweapon _weapon;
{ if (_x != "") then { player addPrimaryWeaponItem _x; }; } forEach _items;

// does not seem to be anyway to turn on flashlight in script.

//_headlightsOn = player getVariable ["FLAY.archery.state.headlight.on", false];
//if (_headlightsOn) then {
//	gameLogic action ["lightOn", player];
//} else {
//	gameLogic action ["lightOff", player];
//};