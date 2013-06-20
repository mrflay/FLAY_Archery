disableserialization;

_key = (_this select 1);
_shift = (_this select 2);
_reloadKeys = actionKeys "ReloadMagazine";
_switchWeaponKeys = actionKeys "SwitchWeapon";
_handled=false;

// don't trigger when (any) dialog is shown.
if (dialog) exitWith { false };

_reload = (not _shift and _key in _reloadKeys);
_unload = (_shift and _key in _reloadKeys);

if (_reload or _unload) then {
	_action = if (_reload) then {"reload"} else {"unload"};
	_handled = [_action, true] call FLAY_fnc_ReloadBow;
};

_handled;