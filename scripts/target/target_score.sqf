disableserialization;
waitUntil { alive player };
while { alive player } do {
	sleep 1;
	_targets = nearestObjects [player, ["FLAY_Target_FITA_122"], 4];

	if (count _targets > 0) then {
	
		_target = _targets select 0;
		
		17 cutRsc ["FLAY_RscFITA122","plain",2];
		waitUntil {!isNull (uiNamespace getVariable "FLAY_RscFITA122")};
		_display = (uiNamespace getVariable "FLAY_RscFITA122");

		_x = safezoneX + 0.04;
		_y = safezoneY + safezoneH - (0.4 * 4 / 3) - 0.04;
		_w = 0.4;
		_h = 0.4 * 4 / 3;

		_centerX = _x + _w / 2;
		_centerY = _y + _h / 2;

		_score1 = 0;
		_score2 = 0;
		_score3 = 0;
		_tscore = 0;
		_index = 0;
		
		_sequence = _target getVariable ["FLAY.archery.target.state.sequence", -1];
		_hits = _target getVariable ["FLAY.archery.target.state.hits", []];
		{
			_ihitX = _x select 0;
			_ihitY = _x select 1;
			_iscore = _x select 2;
			_fade = 0.5;
			_hitIcon = "\flay\flay_archery\ui\FITA_marker_ca.paa";
			if (((20 + _sequence - _index) % 20) < 3) then {
				_hitIcon = "\flay\flay_archery\ui\FITA_marker2_ca.paa";
				_fade = 0;
				_tscore = _tscore + _iscore;
				_score2 = _score1;
				_score3 = _score2;
				_score1 = _iscore;
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
		(_display displayCtrl (3023)) ctrlSetStructuredText parseText (format ["<t color='#ffff00' font='PuristaSemibold'>%1</t>/%2/%3", _score1,_score2,_score3]);
		(_display displayCtrl (3023)) ctrlSetFade 0;
		(_display displayCtrl (3023)) ctrlCommit 0;

		// Score (total of last three arrows)
		(_display displayCtrl (3024)) ctrlSetText str _tscore;
		//(_display displayCtrl (3022)) ctrlSetFontHeight 0.04;
		(_display displayCtrl (3024)) ctrlSetFade 0;
		(_display displayCtrl (3024)) ctrlCommit 0;
		
	} else {
		_isHitMarkUiActive = uiNamespace getVariable ["FLAY.archery.HitMarkUiActive", false];
		if (not _isHitMarkUiActive) then {
			17 cutRsc ["FLAY_Default","plain",2];
		};
	};
};