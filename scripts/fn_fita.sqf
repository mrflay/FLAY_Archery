
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

17 cutRsc ["FLAY_RscFITA122","plain"];
waitUntil {not isNull (uiNamespace getVariable "FLAY_RscFITA122")};


