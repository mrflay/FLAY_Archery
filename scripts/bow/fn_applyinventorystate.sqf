//_this spawn {

	disableserialization;
	private ["_newstate","_oldstate","_unit","_weapon","_items","_muzzleAcc","_sideAcc","_opticAcc","_magazine"];
	
	_unit = player;
	_newWeapon = currentWeapon _unit;
	_newItems = primaryWeaponItems _unit;
	_newMuzzleAcc = _newItems select 0;
	_newSideAcc = _newItems select 1;
	_newOpticAcc = _newItems select 2;
	
	_newMagazine = currentMagazine _unit;
	//_newMagazine = if (count _newMagazine == 0) then {""} else {_newMagazine select 0};

	_newState = [_newWeapon, _newMuzzleAcc, _newSideAcc, _newOpticAcc, _newMagazine];
	_oldState = player getVariable ["flay.archery.inventory.state", ["","","","",""]];

	_oldWeapon = _oldState select 0;
	_oldMuzzleAcc = _oldState select 1;
	_oldSideAcc = _oldState select 2;
	_oldOpticAcc = _oldState select 3;
	_oldMagazine = _oldState select 4;

	if (_newMuzzleAcc != _oldMuzzleAcc) then {
		// fixme: handle this in a nicer way!
		if (_oldMagazine != "") then {
			_magazines = magazines _unit;
			_weapon = currentWeapon _unit;
			_unit removeWeapon _weapon;
			{ _unit removeMagazines _x; } forEach _magazines;
			
			if (_newMuzzleAcc == "FLAY_point_Explosive") then {
				_unit addMagazine "FLAY_1Rnd_ExplosiveArrow";
			};
			if (_newMuzzleAcc == "FLAY_point_Broadhead") then {
				_unit addMagazine "FLAY_1Rnd_BroadheadArrow";
			};
			if (_newMuzzleAcc == "FLAY_point_Precision") then {
				_unit addMagazine "FLAY_1Rnd_PrecisionArrow";
			};
			if (_newMuzzleAcc == "") then {
				_unit addMagazine "FLAY_1Rnd_Arrow";
			};
			
			_unit addWeapon _weapon;
			{ _unit addMagazine _x; } forEach _magazines;
			{ if (_x != "") then { _unit addPrimaryWeaponItem _x; }; } forEach _newItems;
			_unit selectWeapon "ArrowMuzzle";
		};
		
	} else {
	
		if (_newMagazine != _oldMagazine) then {
			if (_newMagazine != "") then {
				_magazineHasPoint = isText (configFile >> "CfgMagazines" >> _newMagazine >> "FLAY_point");
				if (_magazineHasPoint) then {
					_point = getText (configFile >> "CfgMagazines" >> _newMagazine >> "FLAY_point");
					if (_point != "") then {
						_unit addPrimaryWeaponItem _point;
					} else {
						_unit removeItemFromPrimaryWeapon _newMuzzleAcc;
					};
				} else {
					_unit removeItemFromPrimaryWeapon _newMuzzleAcc;
				};
				["loaded", false] call FLAY_fnc_SetBowState;
			};
		};
		// Using current magazine since primaryWeaponMagazine does not
		// report magazine correctly if weapon is swithed using script
		// while the inventory dialog is open.
		_currentMagazine = currentMagazine player;
		if (_currentMagazine == "") then {
			_unit removeItemFromPrimaryWeapon _newMuzzleAcc;
			["empty", false] call FLAY_fnc_SetBowState;
			//if (_newMuzzleAcc != "") then {
			//	_unit addItem _newMuzzleAcc;
			//};
		};
	};
	
	[] call FLAY_fnc_StoreInventoryState;
//};
