
class CfgPatches
{
	class FLAY_Archery_Ammo
	{
		units[] = {"FLAY_Archery_AmmoBox"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Weapons_F","A3_Weapons_F_Ammoboxes","FLAY_Archery"};
	};
};

class CfgVehicles
{
	class Box_NATO_Ammo_F;
	class FLAY_Archery_AmmoBox:	Box_NATO_Ammo_F
	{
		scope = 2;
		displayName = "[Archery] Ammo";
		//model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";
		//icon = "iconCrateAmmo";
		transportMaxWeapons = 40;
		transportMaxMagazines = 300;
		transportMaxItems = 300;
		transportMaxBackpacks = 10;
		class TransportWeapons 
		{
			class _xx_FLAY_Binocular
			{
				weapon = "Binocular";
				count = 10;
			};		
			class _xx_FLAY_CompoundBow
			{
				weapon = "FLAY_CompoundBow";
				count = 10;
			};
			class _xx_FLAY_RecurveBow
			{
				weapon = "FLAY_RecurveBow";
				count = 10;
			};
		};		
		class TransportMagazines
		{
			class _xx_FLAY_1Rnd_Arrow
			{
				magazine = "FLAY_1Rnd_Arrow";
				count = 50;
			};
			class _xx_FLAY_1Rnd_BroadheadArrow
			{
				magazine = "FLAY_1Rnd_BroadheadArrow";
				count = 50;
			};
			class _xx_FLAY_1Rnd_PrecisionArrow
			{
				magazine = "FLAY_1Rnd_PrecisionArrow";
				count = 50;
			};			
			class _xx_FLAY_1Rnd_ExplosiveArrow
			{
				magazine = "FLAY_1Rnd_ExplosiveArrow";
				count = 50;
			};
		};
		class TransportItems 
		{
			class _xx_FLAY_point_Broadhead
			{
				name = "FLAY_point_Broadhead";
				count = 50;
			};
			class _xx_FLAY_point_Precision
			{
				name = "FLAY_point_Precision";
				count = 50;
			};
			class _xx_FLAY_point_Explosive
			{
				name = "FLAY_point_Explosive"
				count = 50;
			};
			class _xx_FLAY_acc_quiver_7
			{
				name = "FLAY_acc_quiver_7";
				count = 10;
			};
			class _xx_FLAY_acc_quiver_7b
			{
				name = "FLAY_acc_quiver_7b";
				count = 10;
			};
			class _xx_FLAY_acc_quiver_7p
			{
				name = "FLAY_acc_quiver_7p";
				count = 10;
			};
			class _xx_FLAY_acc_quiver_7he
			{
				name = "FLAY_acc_quiver_7he";
				count = 10;
			};
			class _xx_FLAY_acc_stabilizer
			{
				name = "FLAY_acc_stabilizer";
				count = 10;
			};
			class _xx_FLAY_optic_aco
			{
				name = "optic_aco";
				count = 10;
			};
			class _xx_FLAY_optic_arco
			{
				name = "optic_arco";
				count = 10;
			};
			class _xx_FLAY_optic_holosight
			{
				name = "optic_holosight";
				count = 10;
			};
			class _xx_FLAY_acc_flashlight
			{
				name = "acc_flashlight";
				count = 10;
			};
			class _xx_FLAY_acc_pointer_ir
			{
				name = "acc_pointer_ir";
				count = 10;
			};
		};
		class TransportBackpacks 
		{
			class _xx_FLAY_b_assaultpack_blk
			{
				backpack = "b_assaultpack_blk";
				count = 5;
			};
		};
		accuracy = 1000;
	};
};