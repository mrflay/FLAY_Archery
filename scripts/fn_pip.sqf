
profilenamespace setvariable ["IGUI_GRID_OLD_PIP_X", "-0.55"];
profilenamespace setvariable ["IGUI_GRID_OLD_PIP_Y", "-0.37"];
profilenamespace setvariable ["IGUI_GRID_OLD_PIP_W", "0.5"];
profilenamespace setvariable ["IGUI_GRID_OLD_PIP_H", "0.5"];


17 cutRsc ["RscPiP","plain"];
waitUntil {!isNull (uiNamespace getVariable "RscPIP")};

//((uiNamespace getVariable "RscPIP") displayctrl 2400) ctrlsettext;
((uiNamespace getVariable "RscPiP") displayctrl 2300) ctrlsetfade 0;
((uiNamespace getVariable "RscPiP") displayctrl 2300) ctrlsettext "#(argb,256,256,1)r2t(rendertarget0,1.0)";
((uiNamespace getVariable "RscPiP") displayctrl 2300) ctrlcommit 0;


_target = t99;
_centerPos = _target selectionPosition "center";
_centerPos = _target modelToWorld _centerPos;
_cameraPos = _target modelToWorld [2,2,1];

_cam = "camera" camCreate (getPosATL _target);
_cam camPrepareFov 0.70;
//_cam camPrepareTarget _target;
_cam camCommitPrepared 0;
_cam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];

//_cam camSetTarget _centerPos;
_cam camSetPos _cameraPos;
_cam camCommit 0;

player setVariable ["FLAY.archery.pip.cam", _cam];

_li = "#lightpoint" createVehicleLocal _cameraPos;
_li setLightBrightness 0.1;
_li setLightAmbient [1,1,1];
_li setLightColor [1,1,1];
_li lightAttachObject [_target, [0,0,0]];