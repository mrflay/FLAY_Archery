player globalchat "target_hit.sqf";

_target = _this select 0;
_projectile = _this select 1;

_x = "safezoneX + 0.04";
_y = "safezoneY + safezoneH - (0.4 * 4 / 3) - 0.04";
_w = "0.4";
_h = "0.4 * 4 / 3";

profilenamespace setvariable ["IGUI_GRID_FITA_X", _x];
profilenamespace setvariable ["IGUI_GRID_FITA_Y", _y];
profilenamespace setvariable ["IGUI_GRID_FITA_W", _w];
profilenamespace setvariable ["IGUI_GRID_FITA_H", _h];

_worldHitPos = getPosATL _projectile;
_modelHitPos = _target worldToModel _worldHitPos;
_modelOrigo = (_target selectionPosition "center");
_modelX = (_target selectionPosition "axis_x");
_modelY = (_target selectionPosition "axis_y");

player globalchat format ["_worldHitPos:%1, _modelHitPos:%2", str _worldHitPos, str _modelHitPos];
player globalchat format ["_modelOrigo:%1,_modelX:%1, _modelY:%2", str _modelOrigo, str _modelX, str _modelY];

_modelXAxis = [_modelOrigo, _modelX] call BIS_fnc_vectorDiff;
_modelYAxis = [_modelOrigo, _modelY] call BIS_fnc_vectorDiff;
_modelHitPos = [_modelOrigo, _modelHitPos] call BIS_fnc_vectorDiff;

_hitX = [_modelHitPos, _modelXAxis] call BIS_fnc_dotProduct;
_hitY = [_modelHitPos, _modelYAxis] call BIS_fnc_dotProduct;

player globalchat format ["_modelXAxis:%1, _modelYAxis:%2", str _modelXAxis, str _modelYAxis];
player globalchat format ["_hitX:%1, _hitY:%2", str _hitX, str _hitY];

[] spawn {
	//_display = uiNamespace getVariable "FLAY_RscFITA122";
	//if (isNull _display) then {
		17 cutRsc ["FLAY_RscFITA122","plain"];
		waitUntil {!isNull (uiNamespace getVariable "FLAY_RscFITA122")};
		_display = (uiNamespace getVariable "FLAY_RscFITA122");
	//};
	//(_display (displayctrl 3002)) ctrlsetfade 0;
	//(_display (displayctrl 3002)) ctrlsetposition [_hitX, _hitY];
	//(_display (displayctrl 3002)) ctrlcommit 0;
};