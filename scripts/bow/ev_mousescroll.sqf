disableserialization;

_ctrl = _this select 0;
_button = _this select 1;
_handled = false;

// don't trigger when (any) dialog is shown.
if (dialog) exitWith { false };

_reload = _button < 0;
_unload = _button > 0;

if (_reload or _unload) then {
	_action = if (_reload) then {"reload"} else {"unload"};
	_handled = [_action] call FLAY_fnc_ReloadBow;
};

_handled;