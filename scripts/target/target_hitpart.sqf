disableserialization;

_part1 = _this select 0;
_target = _part1 select 0;
_unit = _part1 select 1;
_projectile = _part1 select 2;
_position = _part1 select 3;

_x = "safezoneX + 0.04";
_y = "safezoneY + safezoneH - (0.4 * 4 / 3) - 0.04";
_w = "0.4";
_h = "0.4 * 4 / 3";

profilenamespace setvariable ["IGUI_GRID_FITA_X", _x];
profilenamespace setvariable ["IGUI_GRID_FITA_Y", _y];
profilenamespace setvariable ["IGUI_GRID_FITA_W", _w];
profilenamespace setvariable ["IGUI_GRID_FITA_H", _h];

_worldHitPos = ASLtoATL _position;
_modelHitPos = _target worldToModel _worldHitPos;
_modelOrigo = (_target selectionPosition "center");
_modelX = (_target selectionPosition "axis_x");
_modelY = (_target selectionPosition "axis_y");

//player globalchat format ["_worldHitPos:%1, _modelHitPos:%2", str _worldHitPos, str _modelHitPos];
//player globalchat format ["_modelOrigo:%1,_modelX:%1, _modelY:%2", str _modelOrigo, str _modelX, str _modelY];

_modelXAxis = [_modelOrigo, _modelX] call BIS_fnc_vectorDiff;
_modelYAxis = [_modelOrigo, _modelY] call BIS_fnc_vectorDiff;
_modelHitPos = [_modelOrigo, _modelHitPos] call BIS_fnc_vectorDiff;

_hitXo = [_modelHitPos, _modelXAxis] call BIS_fnc_dotProduct;
_hitYo = [_modelHitPos, _modelYAxis] call BIS_fnc_dotProduct;

_hitX = (_hitXo * 0.8 * 2 / 3) - 0.01;
_hitY = (_hitYo * 0.8) + 0.01;

_score = (10 - floor( 10 * (sqrt((_hitXo)^2+(_hitYo)^2)) / 0.37 ));

hint str _score;

//player globalchat format ["_modelXAxis:%1, _modelYAxis:%2", str _modelXAxis, str _modelYAxis];
//player globalchat format ["_hitX:%1, _hitY:%2", str _hitX, str _hitY];


//_display = uiNamespace getVariable "FLAY_RscFITA122";
//if (isNull _display) then {
	17 cutRsc ["FLAY_RscFITA122","plain"];
	waitUntil {!isNull (uiNamespace getVariable "FLAY_RscFITA122")};
	_display = (uiNamespace getVariable "FLAY_RscFITA122");
	uiNamespace setVariable ["FLAY.archery.HitMarkUiActive", true];
//};

_x = safezoneX + 0.04;
_y = safezoneY + safezoneH - (0.4 * 4 / 3) - 0.04;
_w = 0.4;
_h = 0.4 * 4 / 3;

_centerX = _x + _w / 2;
_centerY = _y + _h / 2;

//player globalchat format ["_centerX:%1, _centerY:%2", str _centerX, str _centerY];

_sequence = _target getVariable ["FLAY.archery.target.state.sequence", -1];
_sequence = (_sequence + 1) % 20;

(_display displayCtrl (_sequence + 3002)) ctrlSetText "\tb_arifle_hkump45\ui\FITA_marker2_ca.paa";
(_display displayCtrl (_sequence + 3002)) ctrlSetPosition [_hitX + _centerX, _centerY - _hitY];
(_display displayCtrl (_sequence + 3002)) ctrlSetFade 0;
(_display displayCtrl (_sequence + 3002)) ctrlCommit 0;

_spread = -1;
_score2 = 0;
_score3 = 0;
_tscore = _score;
_index = 0;
_hits = _target getVariable ["FLAY.archery.target.state.hits", []];
{
	_ihitX = _x select 0;
	_ihitY = _x select 1;
	_iscore = _x select 2;
	_fade = 0.5;
	_hitIcon = "\tb_arifle_hkump45\ui\FITA_marker_ca.paa";
	if (((20 + _sequence - _index) % 20) < 3) then {
		_hitIcon = "\tb_arifle_hkump45\ui\FITA_marker2_ca.paa";
		_fade = 0;
		_tscore = _tscore + _iscore;
		_score3 = _score2;
		_score2 = _iscore;
	};
	(_display displayCtrl (_index + 3002)) ctrlSetText _hitIcon;
	(_display displayCtrl (_index + 3002)) ctrlSetPosition [_ihitX + _centerX, _centerY - _ihitY];
	(_display displayCtrl (_index + 3002)) ctrlSetFade _fade;
	(_display displayCtrl (_index + 3002)) ctrlCommit 0;
	_index = _index + 1;
} forEach _hits;

// STATS
// target name
(_display displayCtrl (3022)) ctrlSetText (vehicleVarName _target);
(_display displayCtrl (3022)) ctrlSetFont "TahomaB";
(_display displayCtrl (3022)) ctrlSetFontHeight 0.04;
(_display displayCtrl (3022)) ctrlSetFade 0;
(_display displayCtrl (3022)) ctrlCommit 0;

// score (last arrow)
(_display displayCtrl (3023)) ctrlSetStructuredText parseText (format ["<t color='#ffff00' font='PuristaSemibold'>%1</t>/%2/%3", _score,_score2,_score3]);
(_display displayCtrl (3023)) ctrlSetFade 0;
(_display displayCtrl (3023)) ctrlCommit 0;

// Score (total of last three arrows)
(_display displayCtrl (3024)) ctrlSetText str _tscore;
//(_display displayCtrl (3022)) ctrlSetFontHeight 0.04;
(_display displayCtrl (3024)) ctrlSetFade 0;
(_display displayCtrl (3024)) ctrlCommit 0;


_hits set [_sequence, [_hitX, _hitY, _score, _spread, _hitXo, _hitYo]];
_target setVariable ["FLAY.archery.target.state.hits", _hits];
_target setVariable ["FLAY.archery.target.state.sequence", _sequence];
//_target setVariable ["FLAY.archery.target.state.timeout", time + 1];

// flash last hit marker
[_display, _sequence, _target] spawn {
	disableserialization;
	private ["_timeout", "_display", "_sequence", "_fade","_timeout", "_target"];
	_timeout = time + 2;
	_display = _this select 0;
	_sequence = _this select 1;
	_target = _this select 2;
	_fade = 1;
	while { time < _timeout } do {
		sleep 0.25;
		(_display displayCtrl (_sequence + 3002)) ctrlSetFade _fade;
		(_display displayCtrl (_sequence + 3002)) ctrlCommit 0.1;
		_fade = 1 - _fade;
	};
	sleep 3;
	// close if no other hit has been registered.
	_sequence2 = _target getVariable ["FLAY.archery.target.state.sequence", -1];
	if (_sequence == _sequence2) then {
		uiNamespace setVariable ["FLAY.archery.HitMarkUiActive", false];
		17 cutRsc ["FLAY_Default","plain",2];
	};
};

_target setDamage 0;