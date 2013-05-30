disableserialization;
_key = (_this select 1);
_shift = (_this select 2);
_dik_r = [0x13];

_handled=false;
hint "foobar";

if (_key in _dik_r) then {
	_handled = true;
	_currentMuzzle = player currentMuzzle;
	if (_currentMuzzle == "DummyReloadMuzzle1") exitWith {
		player selectWeapon "ExplosiveArrowMuzzle";
		player addMagazine "FLAY_1Rnd_ExplosiveArrow";
	};
	if (_currentMuzzle != "DummyReloadMuzzle2") exitWith {
		player selectWeapon "ExplosiveArrowMuzzle";
	};
};

_handled;