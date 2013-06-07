//disableserialization;

private ["_display","_hitX","_hitY","_x","_y","_w","_h","_centerX","_centerY"];
while { alive player } do

	_hitMarker = player getVariable "FLAY.archery.target.HitMarker";
	if (_hitMarker) then {
		player setVariable ["FLAY.archery.target.HitMarker", objNull];
		
		_hitX = _hitMarker select 0;
		_hitY = _hitMarker select 1;
		_display = uiNamespace getVariable "FLAY_RscFITA122";
		//if (isNull _display) then {
			17 cutRsc ["FLAY_RscFITA122","plain"];
			waitUntil {!isNull (uiNamespace getVariable "FLAY_RscFITA122")};
			//_display = (uiNamespace getVariable "FLAY_RscFITA122");
		//};

		_x = safezoneX + 0.04;
		_y = safezoneY + safezoneH - (0.4 * 4 / 3) - 0.04;
		_w = 0.4;
		_h = 0.4 * 4 / 3;

		_centerX = _x + _w / 2;
		_centerY = _y + _h / 2;

		player globalchat format ["_centerX:%1, _centerY:%2", str _centerX, str _centerY];

		(_display displayctrl 3002) ctrlsettext "\tb_arifle_hkump45\ui\FITA_marker_ca.paa";
		(_display displayctrl 3002) ctrlsetfade 0;
		(_display displayctrl 3002) ctrlsetposition [_hitX + _centerX, _hitY + _centerY];
		(_display displayctrl 3002) ctrlcommit 0;
		
		sleep 1;
	};
	//(_display displayctrl 3002) ctrlsetfade 0.3;
	//(_display displayctrl 3002) ctrlcommit 2;
	//sleep 3;
	//17 cutRsc ["","plain",2];
};