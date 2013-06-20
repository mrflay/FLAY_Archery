disableserialization;

_key = (_this select 1);
_shift = (_this select 2);
_reloadKeys = actionKeys "ReloadMagazine";
_switchWeaponKeys = actionKeys "SwitchWeapon";
_handled=false;

// don't trigger when (any) dialog is shown.
if (dialog) exitWith { false };

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

_bowState = getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
if (_bowState == "empty") then {
	if (_key in _reloadKeys) then {
		_handled=true;
		_canReload = [] call FLAY_fnc_CanReloadBow;
		if (not _canReload) exitWith { true; };
		["next"] call FLAY_fnc_SetBowState;
	};
};

if (_bowState == "loaded") then {
	if (not _shift and _key in _reloadKeys) then {
		_handled = true;
		["next"] call FLAY_fnc_SetBowState;
	};
	if (_shift and _key in _reloadKeys) then {
		_handled = true;
		["prev"] call FLAY_fnc_SetBowState;
	};	
};

if (_bowState == "drawn") then {
	if (_key in _reloadKeys) then {
		_handled = true;
		["prev"] call FLAY_fnc_SetBowState;
	};
};

_handled;