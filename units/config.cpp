
class DefaultEventhandlers;

class CfgPatches
{
	class FLAY_Archery_Units
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F","A3_Characters_F_Beta","A3_Characters_F_BLUFOR","A3_Characters_F_INDEP","A3_Characters_F_OPFOR","FLAY_Archery"};
	};
};

class cfgVehicles
{
	class B_Soldier_base_F;
	class I_Soldier_base_F;
	class O_Soldier_base_F;
	class B_recon_M_F;
	class I_Soldier_lite_F;
	class O_Soldier_lite_F;
	class C_man_1;
	
	class FLAY_C_Archer_Base: C_man_1
	{
		scope = 1;
		_generalMacro = "FLAY_C_Archer_Base";
		displayName = "Archer";
		textSingular = "Archer";
		textPlural = "Archers";		
		identityTypes[] = {"Head_Rangemaster","G_Competitor"};
		uniformClass = "U_Competitor";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\A3\Characters_F_Beta\Civil\Data\c_competitor_co.paa"};		
		vehicleClass = "MenArcher";
		backpack = "B_AssaultPack_blk";
		weapons[] = {"FLAY_RecurveBow","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow","Binocular","Throw","Put"};
		magazines[] = {"FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow"};
		respawnMagazines[] = {"FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
		//linkedItems[] = {"V_Rangemaster_belt","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		//respawnlinkedItems[] = {"V_Rangemaster_belt","ItemMap","ItemCompass","ItemWatch","ItemRadio"};		
	};	

	class FLAY_C_Archer_CompoundBow: FLAY_C_Archer_Base
	{
		scope = 2;
		nameSound = "veh_infantry_SF_s";
		_generalMacro = "FLAY_C_Archer_Base";
		displayName = "Archer (Compound Bow)";
		cost = 100000;
		threat[] = {1,0.3,0.3};
		camouflage = 0.6;
		sensitivity = 3.5;
		weapons[] = {"FLAY_CompoundBow_Quiver_7B","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_CompoundBow_Quiver_7B","Binocular","Throw","Put"};
		magazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow"
		};
		respawnMagazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow"
		};
	};

	class FLAY_C_Archer_RecurveBow: FLAY_C_Archer_Base
	{
		scope = 2;
		nameSound = "veh_infantry_SF_s";
		_generalMacro = "FLAY_C_Archer_Base";
		displayName = "Archer (Recurve Bow)";
		cost = 100000;
		threat[] = {1,0.3,0.3};
		camouflage = 0.6;
		sensitivity = 3.5;
		weapons[] = {"FLAY_RecurveBow_Stabilizer","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow_Stabilizer","Binocular","Throw","Put"};
		magazines[] = {
			"FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow",
			"FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow"
		};
		respawnMagazines[] = {
			"FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow",
			"FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow","FLAY_1Rnd_PrecisionArrow"
		};
	};
	
	class FLAY_I_Archer_Base: I_Soldier_lite_F
	{
		scope = 1;
		textSingular = "Archer";
		textPlural = "Archers";
		_generalMacro = "FLAY_I_Archer_Base";
		displayName = "FLAY_I_Archer_Base";
		vehicleClass = "MenArcher";
		cost = 55000;
		camouflage = 1.5;
		backpack = "b_assaultpack_blk";
		weapons[] = {"FLAY_RecurveBow","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow","Binocular","Throw","Put"};
		magazines[] = {"FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
		respawnMagazines[] = {"FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
	};
	
	class FLAY_I_Archer_CompoundBow: FLAY_I_Archer_Base
	{
		scope = 2;
		nameSound = "veh_infantry_SF_s";
		_generalMacro = "FLAY_I_Archer_Base";
		displayName = "Archer (Compound Bow)";
		cost = 100000;
		threat[] = {1,0.3,0.3};
		camouflage = 0.6;
		sensitivity = 3.5;
		weapons[] = {"FLAY_CompoundBow_Quiver_7HE","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_CompoundBow_Quiver_7HE","Binocular","Throw","Put"};
		magazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
		respawnMagazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
	};

	class FLAY_I_Archer_RecurveBow: FLAY_I_Archer_Base
	{
		scope = 2;
		nameSound = "veh_infantry_SF_s";
		_generalMacro = "FLAY_I_Archer_Base";
		displayName = "Archer (Recurve Bow)";
		cost = 100000;
		threat[] = {1,0.3,0.3};
		camouflage = 0.6;
		sensitivity = 3.5;
		weapons[] = {"FLAY_RecurveBow_ACO","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow_ACO","Binocular","Throw","Put"};
		magazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
		respawnMagazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
	};
	
	class FLAY_B_Archer_Base: B_recon_M_F
	{
		scope = 1;
		textSingular = "Archer";
		textPlural = "Archers";
		_generalMacro = "FLAY_B_Archer_Base";
		displayName = "FLAY_B_Archer_Base";
		vehicleClass = "MenArcher";
		cost = 55000;
		camouflage = 1.5;
		backpack = "b_assaultpack_blk";
		weapons[] = {"FLAY_RecurveBow","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow","Binocular","Throw","Put"};
		magazines[] = {"FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
		respawnMagazines[] = {"FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
	};
	
	class FLAY_B_Archer_CompoundBow: FLAY_B_Archer_Base
	{
		scope = 2;
		nameSound = "veh_infantry_SF_s";
		_generalMacro = "FLAY_B_Archer_Base";
		displayName = "Archer (Compound Bow)";
		cost = 100000;
		threat[] = {1,0.3,0.3};
		camouflage = 0.6;
		sensitivity = 3.5;
		weapons[] = {"FLAY_CompoundBow_Quiver_7HE","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_CompoundBow_Quiver_7HE","Binocular","Throw","Put"};
		magazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
		respawnMagazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
	};

	class FLAY_B_Archer_RecurveBow: FLAY_B_Archer_Base
	{
		scope = 2;
		nameSound = "veh_infantry_SF_s";
		_generalMacro = "FLAY_B_Archer_Base";
		displayName = "Archer (Recurve Bow)";
		cost = 100000;
		threat[] = {1,0.3,0.3};
		camouflage = 0.6;
		sensitivity = 3.5;
		weapons[] = {"FLAY_RecurveBow_ACO","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow_ACO","Binocular","Throw","Put"};
		magazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
		respawnMagazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
	};

	class FLAY_O_Archer_Base: O_Soldier_lite_F
	{
		scope = 1;
		textSingular = "Archer";
		textPlural = "Archers";
		_generalMacro = "FLAY_O_Archer_Base";
		displayName = "FLAY_O_Archer_Base";
		vehicleClass = "MenArcher";
		cost = 55000;
		camouflage = 1.5;
		backpack = "b_assaultpack_blk";
		weapons[] = {"FLAY_RecurveBow","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow","Binocular","Throw","Put"};
		magazines[] = {"FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
		respawnMagazines[] = {"FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","FLAY_1Rnd_Arrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
	};
	
	class FLAY_O_Archer_CompoundBow: FLAY_O_Archer_Base
	{
		scope = 2;
		nameSound = "veh_infantry_SF_s";
		_generalMacro = "FLAY_O_Archer_Base";
		displayName = "Archer (Compound Bow)";
		cost = 100000;
		threat[] = {1,0.3,0.3};
		camouflage = 0.6;
		sensitivity = 3.5;
		weapons[] = {"FLAY_CompoundBow_Quiver_7HE","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_CompoundBow_Quiver_7HE","Binocular","Throw","Put"};
		magazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
		respawnMagazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
	};

	class FLAY_O_Archer_RecurveBow: FLAY_O_Archer_Base
	{
		scope = 2;
		nameSound = "veh_infantry_SF_s";
		_generalMacro = "FLAY_O_Archer_Base";
		displayName = "Archer (Recurve Bow)";
		cost = 100000;
		threat[] = {1,0.3,0.3};
		camouflage = 0.6;
		sensitivity = 3.5;
		weapons[] = {"FLAY_RecurveBow_ACO","Binocular","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow_ACO","Binocular","Throw","Put"};
		magazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
		respawnMagazines[] = {
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow",
			"HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"
		};
	};	
};
class CfgVehicleClasses
{
	class MenArcher
	{
		displayName = "Men (Archer)";
	};
};