disableserialization;
_key = (_this select 1);
_shift = (_this select 2);
_dik_r = actionKeys "ReloadMagazine";
_dik_f = actionKeys "SwitchWeapon";
_dik_space = [0x39];
_handled=false;

if (dialog) exitWith { false };

_weapon = currentWeapon player;
if (not (_weapon in ["FLAY_CompoundBow", "FLAY_RecurveBow"])) exitWith { hint "ev_keydown.sqf: not a bow"; false; };

if (_key in _dik_r) then {
	// fixme: handle race conditions better
	_reloadMutex = player getVariable ["FLAY.archery.state.ReloadMutex", 0];
	if (_reloadMutex == 0) then {
		player setVariable ["FLAY.archery.state.ReloadMutex", 1];
		[] call FLAY_fnc_ReloadBow;
	};
};

if (_key in _dik_f) then {
	_handled=true;
	// fixme: handle race conditions better
	_cycleMuzzleMutex = player getVariable ["FLAY.archery.state.CycleMuzzleMutex", 0];
	if (_cycleMuzzleMutex == 0) then {
		player setVariable ["FLAY.archery.state.CycleMuzzleMutex", 1];
		[] call FLAY_fnc_CycleQuiver;
	};
};

_handled;