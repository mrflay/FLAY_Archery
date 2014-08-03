disableserialization;

_key = (_this select 1);
_shift = (_this select 2);
_inventoryKeys = actionKeys "Gear";
_handled=false;

_weapon = currentWeapon player;
_isBow = isClass (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo");
if (not _isBow) exitWith { false; };

if (true) exitWith { false; };

//player globalchat format ["keyup:%1, dialog:%2", _key, str dialog];

if (_key in _inventoryKeys) then {
	// handle inventory
	if (not (uiNamespace getVariable ["flay.archery.inventory.open", false])) then {
		uiNamespace setVariable ["flay.archery.inventory.open", true];
		[] spawn {
			waitUntil { dialog };
			_olditems = primaryWeaponItems player;
			_oldpoint = _olditems select 0;
			_oldmagazine = primaryWeaponMagazine player;
			_oldmagazine = if (count _oldmagazine == 0) then {""} else {_oldmagazine select 0};
			while { dialog } do {
				sleep 0.05;
				_newitems = primaryWeaponItems player;
				_newpoint = _newitems select 0;
				_newmagazine = primaryWeaponMagazine player;
				_newmagazine = if (count _newmagazine == 0) then {""} else {_newmagazine select 0};
				
				// FIXME: this is a bug when replacing a magazine with the same kind after the point has been changed.
				if (_newmagazine != _oldmagazine) then {
					// player globalchat format ["magazine changed: old='%1' new='%2'", _oldmagazine, _newmagazine];
										
					// todo: not sure about this condition... 
					if (_oldpoint != "" and _oldmagazine == "") then {
						// add point to inventory before replacing it.
						player addItem _oldpoint;
						player removePrimaryWeaponItem _oldpoint;
					};
					
					// replace the removed magazine in inventory with type determined by the point
					if (_oldmagazine != "") then {
						player removePrimaryWeaponItem _oldpoint;
						if (_oldpoint == "FLAY_point_Explosive") then {
							player removeMagazine _oldmagazine;
							player addMagazine "FLAY_1Rnd_ExplosiveArrow";
						};
						if (_oldpoint == "FLAY_point_Broadhead") then {
							player removeMagazine _oldmagazine;
							player addMagazine "FLAY_1Rnd_BroadheadArrow";
						};
						if (_oldpoint == "FLAY_point_Precision") then {
							player removeMagazine _oldmagazine;
							player addMagazine "FLAY_1Rnd_PrecisionArrow";
						};
						if (_oldpoint == "") then {
							player removeMagazine _oldmagazine;
							player addMagazine "FLAY_1Rnd_Arrow";
						};						
					};
					
					if (_newmagazine != "") then {
						_newMagazineHasPoint = isText (configFile >> "CfgMagazines" >> _newmagazine >> "FLAY_point");
						if (_newMagazineHasPoint) then {
							_cfgpoint = getText (configFile >> "CfgMagazines" >> _newmagazine >> "FLAY_point");
							if (_cfgpoint != "") then {
								player addPrimaryWeaponItem _cfgpoint;
							};
						};
					};
				};
				
				if (_newpoint != _oldpoint) then {
					// player globalchat format ["point changed: old='%1' new='%2'", _oldpoint, _newpoint];
					// This is handled when inventory dialog is closed as there is no way to change
					// the currently loaded magazine of a weapon.
				};
				_oldmagazine = _newmagazine;
				_oldpoint = _newpoint;
				_olditems = _newitems;
			};
			waitUntil { not dialog };
			uiNamespace setVariable ["flay.archery.inventory.open", false];
			[] call FLAY_fnc_ApplyInventoryState;
			// reset pose
			// fixme: look this up in config.
			switch (animationState player) do {
				case "ainvpercmstpsraswrfldnon": { player playMove "AinvPercMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon"; }; // erect
				case "ainvpknlmstpsraswrfldnon": { player playMove "AinvPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon"; }; // kneel				
				case "ainvppnemstpsraswrfldnon": { player playMove "AinvPpneMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon"; }; // prone
			};
		};
	};
};

_handled;