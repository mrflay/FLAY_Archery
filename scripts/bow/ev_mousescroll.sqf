disableserialization;

_ctrl = _this select 0;
_button = _this select 1;
_handled = false;

// don't trigger when (any) dialog is shown.
if (dialog) exitWith { false };

_weapon = currentWeapon player;
_muzzle = currentMuzzle player;
_magazines = magazines player;
_magazine = currentMagazine player;
if (_weapon in ["FLAY_CompoundBowEmpty"]) then {
	if (_button < 0) then {
		_compatibleMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "magazines");
		_canReload = false;
		{ if (_x in _compatibleMagazines) then { _canReload = true; }; } forEach _magazines;
		if (not _canReload) exitWith { true; };	
		_handled=true;
		[_magazines] spawn {
			player playActionNow "GestureReloadBackQuiver";
			sleep 0.5;
			// _magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "ArrowMuzzle" >> "magazines");
			_magazines = _this select 0;
			_weapon = currentWeapon player;
			_muzzle = currentMuzzle player;
			player removeWeapon _weapon;
			{ player removeMagazines _x; } forEach _magazines;
			player addWeapon "FLAY_CompoundBowLoaded";
			player selectWeapon _muzzle;
			{ player addMagazine _x; } forEach _magazines;
		};		
	};
};

if (_weapon in ["FLAY_CompoundBowLoaded"]) then {
	if (_button < 0) then {
		_handled = true;
		player PlayActionNow "GestureReset"; 
		player PlayActionNow "GestureReloadArrow";
		player removeWeapon _weapon;
		{ player removeMagazines _x; } forEach _magazines;
		{ player addMagazine _x; } forEach _magazines;
		player addWeapon "FLAY_CompoundBowDrawn";
		player selectWeapon _muzzle;
	};
	if (_button > 0) then {
		player playActionNow "GestureReloadBackQuiver";
		player removeWeapon _weapon;
		{ player removeMagazines _x; } forEach _magazines;
		player addWeapon "FLAY_CompoundBowEmpty";
		player selectWeapon _muzzle;
		{ player addMagazine _x; } forEach _magazines;
	};
};

if (_weapon in ["FLAY_CompoundBowDrawn"]) then {
	if (_button > 0) then {
		player playActionNow "GestureReset";
		player removeWeapon _weapon;
		{ player removeMagazines _x; } forEach _magazines;
		player addWeapon "FLAY_CompoundBowLoaded";
		player selectWeapon _muzzle;
		{ player addMagazine _x; } forEach _magazines;
		player addMagazine _magazine;
	};
};

_handled;