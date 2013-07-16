
class DefaultEventhandlers;

class CfgPatches
{
	class FLAY_Archery_Units
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F","A3_Characters_F_BLUFOR","A3_Characters_F_INDEP","A3_Characters_F_OPFOR","FLAY_Archery"};
	};
};

class cfgVehicles
{
	class B_Soldier_base_F;
	class I_Soldier_base_F;
	class O_Soldier_base_F;
	
	class FLAY_I_Archer_Base: I_Soldier_base_F
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
		weapons[] = {"FLAY_RecurveBow","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow","Throw","Put"};
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
		weapons[] = {"FLAY_CompoundBow","Throw","Put"};
		respawnWeapons[] = {"FLAY_CompoundBow","Throw","Put"};
		magazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
		respawnMagazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
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
		weapons[] = {"FLAY_RecurveBow","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow","Throw","Put"};
		magazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
		respawnMagazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
	};
	
	
	class FLAY_B_Archer_Base: B_Soldier_base_F
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
		weapons[] = {"FLAY_RecurveBow","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow","Throw","Put"};
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
		weapons[] = {"FLAY_CompoundBow","Throw","Put"};
		respawnWeapons[] = {"FLAY_CompoundBow","Throw","Put"};
		magazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
		respawnMagazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
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
		weapons[] = {"FLAY_RecurveBow","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow","Throw","Put"};
		magazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
		respawnMagazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
	};

	class FLAY_O_Archer_Base: O_Soldier_base_F
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
		weapons[] = {"FLAY_RecurveBow","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow","Throw","Put"};
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
		weapons[] = {"FLAY_CompoundBow","Throw","Put"};
		respawnWeapons[] = {"FLAY_CompoundBow","Throw","Put"};
		magazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
		respawnMagazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
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
		weapons[] = {"FLAY_RecurveBow","Throw","Put"};
		respawnWeapons[] = {"FLAY_RecurveBow","Throw","Put"};
		magazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
		respawnMagazines[] = {"FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_BroadheadArrow","HandGrenade","HandGrenade","SmokeShell","SmokeShellRed","Chemlight_red","Chemlight_red"};
	};	
};
class CfgVehicleClasses
{
	class MenArcher
	{
		displayName = "Men (Archer)";
	};
};