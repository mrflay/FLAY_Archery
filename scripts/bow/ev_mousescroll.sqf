disableserialization;

_ctrl = _this select 0;
_button = _this select 1;
_handled = false;

// don't trigger when (any) dialog is shown.
if (dialog) exitWith { false };

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

_bowState = getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
if (_bowState == "empty") then {
	if (_button < 0) then {
		_canReload = [] call FLAY_fnc_CanReloadBow;
		if (not _canReload) exitWith { true; };
		_handled=true;
		[] spawn {
			player playActionNow "GestureReloadBackQuiver";
			sleep 0.5;
			["next"] call FLAY_fnc_SetBowState;
		};
	};
};

if (_bowState == "loaded") then {
	if (_button < 0) then {
		_handled = true;
		player PlayActionNow "GestureReset"; 
		player PlayActionNow "GestureReloadArrow";
		["next"] call FLAY_fnc_SetBowState;
	};
	if (_button > 0) then {
		_handled = true;
		player playActionNow "GestureReloadBackQuiver";
		["prev"] call FLAY_fnc_SetBowState;
	};
};

if (_bowState == "drawn") then {
	if (_button > 0) then {
		_handled = true;
		player playActionNow "GestureReset";
		["prev"] call FLAY_fnc_SetBowState;
	};
};

_handled;