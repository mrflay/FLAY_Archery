_currentMuzzle = currentMuzzle player;
if (_currentMuzzle in ["DummyReloadBackQuiverMuzzle","DummyReloadBowQuiverMuzzle","DummyReloadBeltQuiverMuzzle"]) then {
	_isReloading = player getVariable ["FLAY.archery.state.reloading", false];
	if (_isReloading) exitWith {};
	player setVariable ["FLAY.archery.state.reloading", true];
	[] spawn {
		_reloadFromMuzzlePossible = true;
		_ammoCount = 1;
		_ammoType = "R";
		_muzzleItem = (primaryWeaponItems player) select 0;
		_currentMuzzle = currentMuzzle player;
		if (_currentMuzzle == "DummyReloadBowQuiverMuzzle") then {
			_quiver = (primaryWeaponItems player) select 1;
			switch (_quiver) do 
			{ 
			  case "FLAY_acc_Quiver":   { _ammoType = "R"; _ammoCount = 7; player addPrimaryWeaponItem "FLAY_acc_Quiver_6"; }; //temp
			  case "FLAY_acc_Quiver_7": { _ammoType = "R"; _ammoCount = 7; player addPrimaryWeaponItem "FLAY_acc_Quiver_6"; }; 
			  case "FLAY_acc_Quiver_6": { _ammoType = "R"; _ammoCount = 6; player addPrimaryWeaponItem "FLAY_acc_Quiver_5"; }; 
			  case "FLAY_acc_Quiver_5": { _ammoType = "R"; _ammoCount = 5; player addPrimaryWeaponItem "FLAY_acc_Quiver_4"; }; 
			  case "FLAY_acc_Quiver_4": { _ammoType = "R"; _ammoCount = 4; player addPrimaryWeaponItem "FLAY_acc_Quiver_3"; }; 
			  case "FLAY_acc_Quiver_3": { _ammoType = "R"; _ammoCount = 3; player addPrimaryWeaponItem "FLAY_acc_Quiver_2"; }; 
			  case "FLAY_acc_Quiver_2": { _ammoType = "R"; _ammoCount = 2; player addPrimaryWeaponItem "FLAY_acc_Quiver_1"; }; 
			  case "FLAY_acc_Quiver_1": { _ammoType = "R"; _ammoCount = 1; player addPrimaryWeaponItem "FLAY_acc_Quiver_0"; }; 
			  //case "FLAY_acc_Quiver_0": { _ammoCount = 0; _reloadFromMuzzlePossible = false; };
			  
			  case "FLAY_acc_Quiver_7HE": { _ammoType = "HE"; _ammoCount = 7; player addPrimaryWeaponItem "FLAY_acc_Quiver_6HE"; }; 
			  case "FLAY_acc_Quiver_6HE": { _ammoType = "HE"; _ammoCount = 6; player addPrimaryWeaponItem "FLAY_acc_Quiver_5HE"; }; 
			  case "FLAY_acc_Quiver_5HE": { _ammoType = "HE"; _ammoCount = 5; player addPrimaryWeaponItem "FLAY_acc_Quiver_4HE"; }; 
			  case "FLAY_acc_Quiver_4HE": { _ammoType = "HE"; _ammoCount = 4; player addPrimaryWeaponItem "FLAY_acc_Quiver_3HE"; }; 
			  case "FLAY_acc_Quiver_3HE": { _ammoType = "HE"; _ammoCount = 3; player addPrimaryWeaponItem "FLAY_acc_Quiver_2HE"; }; 
			  case "FLAY_acc_Quiver_2HE": { _ammoType = "HE"; _ammoCount = 2; player addPrimaryWeaponItem "FLAY_acc_Quiver_1HE"; }; 
			  case "FLAY_acc_Quiver_1HE": { _ammoType = "HE"; _ammoCount = 1; player addPrimaryWeaponItem "FLAY_acc_Quiver_0HE"; }; 
			  //case "FLAY_acc_Quiver_0HE": { _ammoCount = 0; _reloadFromMuzzlePossible = false; };
			  
			  case "FLAY_acc_Quiver_7P": { _ammoType = "P"; _ammoCount = 7; player addPrimaryWeaponItem "FLAY_acc_Quiver_6P"; }; 
			  case "FLAY_acc_Quiver_6P": { _ammoType = "P"; _ammoCount = 6; player addPrimaryWeaponItem "FLAY_acc_Quiver_5P"; }; 
			  case "FLAY_acc_Quiver_5P": { _ammoType = "P"; _ammoCount = 5; player addPrimaryWeaponItem "FLAY_acc_Quiver_4P"; }; 
			  case "FLAY_acc_Quiver_4P": { _ammoType = "P"; _ammoCount = 4; player addPrimaryWeaponItem "FLAY_acc_Quiver_3P"; }; 
			  case "FLAY_acc_Quiver_3P": { _ammoType = "P"; _ammoCount = 3; player addPrimaryWeaponItem "FLAY_acc_Quiver_2P"; }; 
			  case "FLAY_acc_Quiver_2P": { _ammoType = "P"; _ammoCount = 2; player addPrimaryWeaponItem "FLAY_acc_Quiver_1P"; }; 
			  case "FLAY_acc_Quiver_1P": { _ammoType = "P"; _ammoCount = 1; player addPrimaryWeaponItem "FLAY_acc_Quiver_0P"; }; 
			  //case "FLAY_acc_Quiver_0P": { _ammoCount = 0; _reloadFromMuzzlePossible = false; };					  

			  case "FLAY_acc_Quiver_7B": { _ammoType = "B"; _ammoCount = 7; player addPrimaryWeaponItem "FLAY_acc_Quiver_6B"; }; 
			  case "FLAY_acc_Quiver_6B": { _ammoType = "B"; _ammoCount = 6; player addPrimaryWeaponItem "FLAY_acc_Quiver_5B"; }; 
			  case "FLAY_acc_Quiver_5B": { _ammoType = "B"; _ammoCount = 5; player addPrimaryWeaponItem "FLAY_acc_Quiver_4B"; }; 
			  case "FLAY_acc_Quiver_4B": { _ammoType = "B"; _ammoCount = 4; player addPrimaryWeaponItem "FLAY_acc_Quiver_3B"; }; 
			  case "FLAY_acc_Quiver_3B": { _ammoType = "B"; _ammoCount = 3; player addPrimaryWeaponItem "FLAY_acc_Quiver_2B"; }; 
			  case "FLAY_acc_Quiver_2B": { _ammoType = "B"; _ammoCount = 2; player addPrimaryWeaponItem "FLAY_acc_Quiver_1B"; }; 
			  case "FLAY_acc_Quiver_1B": { _ammoType = "B"; _ammoCount = 1; player addPrimaryWeaponItem "FLAY_acc_Quiver_0B"; }; 
			  //case "FLAY_acc_Quiver_0B": { _ammoCount = 0; _reloadFromMuzzlePossible = false; };
			  
			  default                    { _ammoType = "R"; _ammoCount = 0; _reloadFromMuzzlePossible = false; };
			};
		};
		
		if (_reloadFromMuzzlePossible) then {
			player addmagazine "FLAY_1Rnd_DummyArrow2";
			if (_muzzleItem == "FLAY_point_Explosive" or _ammoType == "HE") then {
				player addMagazine "FLAY_1Rnd_ExplosiveArrow";
				player addPrimaryWeaponItem "FLAY_point_Explosive";
			};
			if (_muzzleItem == "FLAY_point_Broadhead" or _ammoType == "B") then {
				player addMagazine "FLAY_1Rnd_BroadheadArrow";
				player addPrimaryWeaponItem "FLAY_point_Broadhead";
			};
			if (_muzzleItem == "FLAY_point_Precision" or _ammoType == "P") then {
				player addMagazine "FLAY_1Rnd_PrecisionArrow";
				player addPrimaryWeaponItem "FLAY_point_Precision";
			};
			if (_muzzleItem in ["","FLAY_point","FLAY_point_Target","FLAY_point_Field"]) then {
				player addMagazine "FLAY_1Rnd_RegularArrow";
			};
			sleep 0.5;
		} else {
			player setVariable ["FLAY.archery.state.ReloadMuzzle", "DummyReloadBackQuiverMuzzle"];
			player setVariable ["FLAY.archery.state.ReloadMagazine", "FLAY_1Rnd_DummyArrow1"];
			player setVariable ["FLAY.archery.state.ReloadMuzzleIndex", 0];
			player selectWeapon "DummyReloadBackQuiverMuzzle";
		};
		//_muzzleItem = (primaryWeaponItems player) select 0;
		//if (_muzzleItem == "FLAY_point_Explosive") then {
		//	player selectWeapon "ExplosiveArrowMuzzle";
		//};
		//if (_muzzleItem == "FLAY_point_Broadhead") then {
		//	player selectWeapon "BroadheadArrowMuzzle";
		//};
		//if (_muzzleItem == "FLAY_point_Precision") then {
		//	player selectWeapon "PrecisionArrowMuzzle";
		//};		
		//if (_muzzleItem in ["","FLAY_point","FLAY_point_Target","FLAY_point_Field"]) then {
		//	player selectWeapon "RegularArrowMuzzle";
		//};
		player selectWeapon "ArrowMuzzle";
		player setVariable ["FLAY.archery.state.reloading", false];
	};
};