disableserialization;
_key = (_this select 1);
_shift = (_this select 2);
_dik_r = actionKeys "ReloadMagazine";
_dik_f = actionKeys "SwitchWeapon";
_dik_space = [0x39];
_handled=false;

if (dialog) exitWith { false };
_weapon = currentWeapon player;
if (not (_weapon in ["FLAY_CompoundBow", "FLAY_RecurveBow"])) exitWith { false; };

if (_key in _dik_r) then {
	player setVariable ["FLAY.archery.state.ReloadMutex", 0];
};

if (_key in _dik_f) then {
	player setVariable ["FLAY.archery.state.CycleMuzzleMutex", 0];
};
if (_key in _dik_space) then {
	_visible = player getVariable ["FLAY.trajectory.visible", false];
	if (_visible) then {
		_visible = player setVariable ["FLAY.trajectory.visible", false];
		[] execVM "fn_clearTrajectory.sqf";
	} else {
		_visible = player setVariable ["FLAY.trajectory.visible", true];
		[] execVM "fn_drawTrajectory.sqf";
	};
	
};

_handled;