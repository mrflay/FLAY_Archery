class CfgPatches
{
	class FLAY_Archery_Acc
	{
		units[] = {};
		weapons[] = {
			"FLAY_point"
			,"FLAY_point_Broadhead"
			,"FLAY_point_Explosive"
			,"FLAY_point_Field"
			,"FLAY_point_Target"
			,"FLAY_point_Precision"
			,"FLAY_acc_Quiver"
			,"FLAY_acc_Stabilizer"
		};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Weapons_F_Acc"};
	};
};

class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class cfgWeapons
{
	class ItemInfo;
	class ItemCore;
	class muzzle_snds_L;
	class InventoryFlashLightItem_Base_F;
	
	class FLAY_point: muzzle_snds_L
	{
		displayName = "Arrow Point";
		picture = "\FLAY\FLAY_Archery\UI\gear_acca_flay_arrowtip_f_ca";
		model = "\FLAY\FLAY_Archery\acc\FLAY_arrow_Point.p3d";
		class ItemInfo: ItemInfo
		{
			mass = 2;
			class MagazineCoef
			{
				initSpeed = 0.6;
			};
			class AmmoCoef
			{
				hit = 0.7;
				visibleFire = 0;
				audibleFire = 0;
				visibleFireTime = 0;
				audibleFireTime = 0;
				cost = 1.0;
				typicalSpeed = 0.6;
				airFriction = 1.0;
			};
			modes[] = {"Single"};
			class Single: Mode_SemiAuto
			{
				begin1[] = {"FLAY\FLAY_Archery\sound\bowrelease02.ogg",5,1,30};
				soundBegin[] = {"begin1",1};
				weaponSoundEffect = "DefaultRifle";
			};
		};		
	};
	class FLAY_point_Field: FLAY_point 
	{
		displayName = "Field Point";
	};	
	class FLAY_point_Target: FLAY_point 
	{
		displayName = "Target Point";
	};	
	class FLAY_point_Precision: FLAY_point
	{
		displayName = "Precision Point";
		class ItemInfo: ItemInfo
		{
			mass = 2;
			class MagazineCoef
			{
				initSpeed = 0.1;
			};
			class AmmoCoef
			{
				hit = 0.1;
				visibleFire = 0;
				audibleFire = 0;
				visibleFireTime = 0;
				audibleFireTime = 0;
				cost = 1.0;
				typicalSpeed = 0.1;
				airFriction = 0.5;
			};
		};
	};	
	class FLAY_point_Broadhead: FLAY_point 
	{
		displayName = "Broadhead Point";
		picture = "\FLAY\FLAY_Archery\UI\gear_acca_flay_arrowtip_b_ca";
		model = "\FLAY\FLAY_Archery\acc\FLAY_arrow_BroadHead.p3d";
		class ItemInfo: ItemInfo
		{
			mass = 2;
			class MagazineCoef
			{
				initSpeed = 0.9;
			};
			class AmmoCoef
			{
				hit = 3;
				visibleFire = 0;
				audibleFire = 0;
				visibleFireTime = 0;
				audibleFireTime = 0;
				cost = 1.0;
				typicalSpeed = 0.9;
				airFriction = 1.1;
			};
		};		
	};
	class FLAY_point_Explosive: FLAY_point 
	{
		displayName = "Explosive Point";
		picture = "\FLAY\FLAY_Archery\UI\gear_acca_flay_arrowtip_e_ca";
		model = "\FLAY\FLAY_Archery\acc\FLAY_arrow_HE.p3d";
		class ItemInfo: ItemInfo
		{
			mass = 3;
			class MagazineCoef
			{
				initSpeed = 0.6;
			};		
			class AmmoCoef
			{
				hit = 1;
				visibleFire = 0;
				audibleFire = 0;
				visibleFireTime = 0;
				audibleFireTime = 0;
				cost = 2.0;
				typicalSpeed = 0.6;
				airFriction = 1.5;
			};
		};
	};
	class FLAY_point_Flame: FLAY_point 
	{
		displayName = "Flame Point";
		picture = "\FLAY\FLAY_Archery\UI\gear_acca_flay_arrowtip_f_ca";
		model = "\FLAY\FLAY_Archery\acc\FLAY_arrow_Flame.p3d";
	};

	class FLAY_point_Debug: FLAY_point 
	{
		displayName = "Debug Point";
		picture = "\FLAY\FLAY_Archery\UI\gear_acca_flay_arrowtip_f_ca";
		model = "\FLAY\FLAY_Archery\acc\FLAY_arrow_Flame.p3d";
	};	
	
	class FLAY_acc_Quiver: ItemCore
	{
		scope = 2;
		displayName = "Bow Mounted Quiver";
		descriptionShort = "Bow Mounted Quiver (7 Arrows)";
		descriptionUse = "descriptionUse";
		picture = "\FLAY\FLAY_Archery\UI\gear_accv_flay_quiver_ca";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_7.p3d";
		class ItemInfo: InventoryFlashLightItem_Base_F
		{
			mass = 20;
			RMBhint = "Bow Mounted Quiver";
			class FlashLight {};
		};
		class FLAY_QuiverInfo {
			count = 7;
			next = "FLAY_acc_Quiver_7";
			prev = "FLAY_acc_Quiver_6";
			magazine = "FLAY_7Rnd_Arrow";
			point = "";
		};
	};

	class FLAY_acc_Quiver_7: FLAY_acc_Quiver {
		displayName = "Quiver";
		descriptionShort = "Bow Mounted Quiver (7 Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_7.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 7;
			next = "FLAY_acc_Quiver_7";
			prev = "FLAY_acc_Quiver_6";
			magazine = "FLAY_7Rnd_Arrow";
		};
	};	
	class FLAY_acc_Quiver_6: FLAY_acc_Quiver {
		displayName = "Quiver";
		descriptionShort = "Bow Mounted Quiver (6 Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_6.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 6;
			next = "FLAY_acc_Quiver_7";
			prev = "FLAY_acc_Quiver_5";
		};		
	};
	class FLAY_acc_Quiver_5: FLAY_acc_Quiver {
		displayName = "Quiver";
		descriptionShort = "Bow Mounted Quiver (5 Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_5.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 5;
			next = "FLAY_acc_Quiver_6";
			prev = "FLAY_acc_Quiver_4";
		};		
	};
	class FLAY_acc_Quiver_4: FLAY_acc_Quiver {
		displayName = "Quiver";
		descriptionShort = "Bow Mounted Quiver (4 Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_4.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 4;
			next = "FLAY_acc_Quiver_5";
			prev = "FLAY_acc_Quiver_3";
		};		
	};
	class FLAY_acc_Quiver_3: FLAY_acc_Quiver {
		displayName = "Quiver";
		descriptionShort = "Bow Mounted Quiver (3 Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_3.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 3;
			next = "FLAY_acc_Quiver_4";
			prev = "FLAY_acc_Quiver_2";
		};		
	};		
	class FLAY_acc_Quiver_2: FLAY_acc_Quiver {
		displayName = "Quiver";
		descriptionShort = "Bow Mounted Quiver (2 Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_2.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 2;
			next = "FLAY_acc_Quiver_3";
			prev = "FLAY_acc_Quiver_1";
		};		
	};
	class FLAY_acc_Quiver_1: FLAY_acc_Quiver {
		displayName = "Quiver";
		descriptionShort = "Bow Mounted Quiver (1 Arrow)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_1.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 1;
			next = "FLAY_acc_Quiver_2";
			prev = "FLAY_acc_Quiver_0";
		};		
	};
	class FLAY_acc_Quiver_0: FLAY_acc_Quiver {
		displayName = "Quiver";
		descriptionShort = "Bow Mounted Quiver (0 Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_0.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 0;
			next = "FLAY_acc_Quiver_1";
			prev = "FLAY_acc_Quiver_0";
		};		
	};
	
	
	class FLAY_acc_Quiver_7HE: FLAY_acc_Quiver {
		displayName = "Quiver (HE)";
		descriptionShort = "Bow Mounted Quiver (7 HE Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_7.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 7;
			next = "FLAY_acc_Quiver_7HE";
			prev = "FLAY_acc_Quiver_6HE";
			magazine = "FLAY_7Rnd_ExplosiveArrow";
			point = "FLAY_point_Explosive";
		};		
	};	
	class FLAY_acc_Quiver_6HE: FLAY_acc_Quiver {
		displayName = "Quiver (HE)";
		descriptionShort = "Bow Mounted Quiver (6 HE Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_6.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 6;
			next = "FLAY_acc_Quiver_7HE";
			prev = "FLAY_acc_Quiver_5HE";
			magazine = "FLAY_7Rnd_ExplosiveArrow";
			point = "FLAY_point_Explosive";
		};				
	};
	class FLAY_acc_Quiver_5HE: FLAY_acc_Quiver {
		displayName = "Quiver (HE)";
		descriptionShort = "Bow Mounted Quiver (5 HE Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_5.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 5;
			next = "FLAY_acc_Quiver_6HE";
			prev = "FLAY_acc_Quiver_4HE";
			magazine = "FLAY_7Rnd_ExplosiveArrow";
			point = "FLAY_point_Explosive";
		};				
	};
	class FLAY_acc_Quiver_4HE: FLAY_acc_Quiver {
		displayName = "Quiver (HE)";
		descriptionShort = "Bow Mounted Quiver (4 HE Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_4.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 4;
			next = "FLAY_acc_Quiver_5HE";
			prev = "FLAY_acc_Quiver_3HE";
			magazine = "FLAY_7Rnd_ExplosiveArrow";
			point = "FLAY_point_Explosive";
		};				
	};
	class FLAY_acc_Quiver_3HE: FLAY_acc_Quiver {
		displayName = "Quiver (HE)";
		descriptionShort = "Bow Mounted Quiver (3 HE Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_3.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 3;
			next = "FLAY_acc_Quiver_4HE";
			prev = "FLAY_acc_Quiver_2HE";
			magazine = "FLAY_7Rnd_ExplosiveArrow";
			point = "FLAY_point_Explosive";
		};				
	};		
	class FLAY_acc_Quiver_2HE: FLAY_acc_Quiver {
		displayName = "Quiver (HE)";
		descriptionShort = "Bow Mounted Quiver (2 HE Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_2.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 2;
			next = "FLAY_acc_Quiver_3HE";
			prev = "FLAY_acc_Quiver_1HE";
			magazine = "FLAY_7Rnd_ExplosiveArrow";
			point = "FLAY_point_Explosive";
		};				
	};
	class FLAY_acc_Quiver_1HE: FLAY_acc_Quiver {
		displayName = "Quiver (HE)";
		descriptionShort = "Bow Mounted Quiver (1 HE Arrow)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_1.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 1;
			next = "FLAY_acc_Quiver_2HE";
			prev = "FLAY_acc_Quiver_0HE";
			magazine = "FLAY_7Rnd_ExplosiveArrow";
			point = "FLAY_point_Explosive";
		};				
	};
	class FLAY_acc_Quiver_0HE: FLAY_acc_Quiver {
		displayName = "Quiver (HE)";
		descriptionShort = "Bow Mounted Quiver (0 HE Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_0.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 0;
			next = "FLAY_acc_Quiver_1HE";
			prev = "FLAY_acc_Quiver_0HE";
			magazine = "FLAY_7Rnd_ExplosiveArrow";
			point = "FLAY_point_Explosive";
		};				
	};
	
	
	class FLAY_acc_Quiver_7P: FLAY_acc_Quiver {
		displayName = "Quiver (Precision)";
		descriptionShort = "Bow Mounted Quiver (7 Precision Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_7.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 7;
			next = "FLAY_acc_Quiver_7P";
			prev = "FLAY_acc_Quiver_6P";
			magazine = "FLAY_7Rnd_PrecisionArrow";
			point = "FLAY_point_Precision";
		};				
	};	
	class FLAY_acc_Quiver_6P: FLAY_acc_Quiver {
		displayName = "Quiver (Precision)";
		descriptionShort = "Bow Mounted Quiver (6 Precision Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_6.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 6;
			next = "FLAY_acc_Quiver_7P";
			prev = "FLAY_acc_Quiver_5P";
			magazine = "FLAY_7Rnd_PrecisionArrow";
			point = "FLAY_point_Precision";
		};			
	};
	class FLAY_acc_Quiver_5P: FLAY_acc_Quiver {
		displayName = "Quiver (Precision)";
		descriptionShort = "Bow Mounted Quiver (5 Precision Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_5.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 5;
			next = "FLAY_acc_Quiver_6P";
			prev = "FLAY_acc_Quiver_4P";
			magazine = "FLAY_7Rnd_PrecisionArrow";
			point = "FLAY_point_Precision";
		};			
	};
	class FLAY_acc_Quiver_4P: FLAY_acc_Quiver {
		displayName = "Quiver (Precision)";
		descriptionShort = "Bow Mounted Quiver (4 Precision Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_4.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 4;
			next = "FLAY_acc_Quiver_5P";
			prev = "FLAY_acc_Quiver_3P";
			magazine = "FLAY_7Rnd_PrecisionArrow";
			point = "FLAY_point_Precision";
		};			
	};
	class FLAY_acc_Quiver_3P: FLAY_acc_Quiver {
		displayName = "Quiver (Precision)";
		descriptionShort = "Bow Mounted Quiver (3 Precision Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_3.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 3;
			next = "FLAY_acc_Quiver_4P";
			prev = "FLAY_acc_Quiver_2P";
			magazine = "FLAY_7Rnd_PrecisionArrow";
			point = "FLAY_point_Precision";
		};			
	};		
	class FLAY_acc_Quiver_2P: FLAY_acc_Quiver {
		displayName = "Quiver (Precision)";
		descriptionShort = "Bow Mounted Quiver (2 Precision Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_2.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 2;
			next = "FLAY_acc_Quiver_3P";
			prev = "FLAY_acc_Quiver_1P";
			magazine = "FLAY_7Rnd_PrecisionArrow";
			point = "FLAY_point_Precision";
		};			
	};
	class FLAY_acc_Quiver_1P: FLAY_acc_Quiver {
		displayName = "Quiver (Precision)";
		descriptionShort = "Bow Mounted Quiver (1 Precision Arrow)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_1.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 1;
			next = "FLAY_acc_Quiver_2P";
			prev = "FLAY_acc_Quiver_0P";
			magazine = "FLAY_7Rnd_PrecisionArrow";
			point = "FLAY_point_Precision";
		};			
	};
	class FLAY_acc_Quiver_0P: FLAY_acc_Quiver {
		displayName = "Quiver (Precision)";
		descriptionShort = "Bow Mounted Quiver (0 Precision Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_0.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 0;
			next = "FLAY_acc_Quiver_1P";
			prev = "FLAY_acc_Quiver_0P";
			magazine = "FLAY_7Rnd_PrecisionArrow";
			point = "FLAY_point_Precision";
		};			
	};
	
	
	class FLAY_acc_Quiver_7B: FLAY_acc_Quiver {
		displayName = "Quiver (Broadhead)";
		descriptionShort = "Bow Mounted Quiver (7 Broadhead Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_7.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 7;
			next = "FLAY_acc_Quiver_7B";
			prev = "FLAY_acc_Quiver_6B";
			magazine = "FLAY_7Rnd_BroadheadArrow";
			point = "FLAY_point_Broadhead";
		};			
	};	
	class FLAY_acc_Quiver_6B: FLAY_acc_Quiver {
		displayName = "Quiver (Broadhead)";
		descriptionShort = "Bow Mounted Quiver (6 Broadhead Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_6.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 6;
			next = "FLAY_acc_Quiver_7B";
			prev = "FLAY_acc_Quiver_5B";
			magazine = "FLAY_7Rnd_BroadheadArrow";
			point = "FLAY_point_Broadhead";
		};			
	};
	class FLAY_acc_Quiver_5B: FLAY_acc_Quiver {
		displayName = "Quiver (Broadhead)";
		descriptionShort = "Bow Mounted Quiver (5 Broadhead Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_5.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 5;
			next = "FLAY_acc_Quiver_6B";
			prev = "FLAY_acc_Quiver_4B";
			magazine = "FLAY_7Rnd_BroadheadArrow";
			point = "FLAY_point_Broadhead";
		};		
	};
	class FLAY_acc_Quiver_4B: FLAY_acc_Quiver {
		displayName = "Quiver (Broadhead)";
		descriptionShort = "Bow Mounted Quiver (4 Broadhead Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_4.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 4;
			next = "FLAY_acc_Quiver_5B";
			prev = "FLAY_acc_Quiver_3B";
			magazine = "FLAY_7Rnd_BroadheadArrow";
			point = "FLAY_point_Broadhead";
		};			
	};
	class FLAY_acc_Quiver_3B: FLAY_acc_Quiver {
		displayName = "Quiver (Broadhead)";
		descriptionShort = "Bow Mounted Quiver (3 Broadhead Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_3.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 3;
			next = "FLAY_acc_Quiver_4B";
			prev = "FLAY_acc_Quiver_2B";
			magazine = "FLAY_7Rnd_BroadheadArrow";
			point = "FLAY_point_Broadhead";
		};			
	};		
	class FLAY_acc_Quiver_2B: FLAY_acc_Quiver {
		displayName = "Quiver (Broadhead)";
		descriptionShort = "Bow Mounted Quiver (2 Broadhead Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_2.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 2;
			next = "FLAY_acc_Quiver_3B";
			prev = "FLAY_acc_Quiver_1B";
			magazine = "FLAY_7Rnd_BroadheadArrow";
			point = "FLAY_point_Broadhead";
		};			
	};
	class FLAY_acc_Quiver_1B: FLAY_acc_Quiver {
		displayName = "Quiver (Broadhead)";
		descriptionShort = "Bow Mounted Quiver (1 Broadhead Arrow)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_1.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 1;
			next = "FLAY_acc_Quiver_2B";
			prev = "FLAY_acc_Quiver_0B";
			magazine = "FLAY_7Rnd_BroadheadArrow";
			point = "FLAY_point_Broadhead";
		};			
	};
	class FLAY_acc_Quiver_0B: FLAY_acc_Quiver {
		displayName = "Quiver (Broadhead)";
		descriptionShort = "Bow Mounted Quiver (0 Broadhead Arrows)";
		model = "\FLAY\FLAY_Archery\acc\FLAY_quiver_0.p3d";
		class FLAY_QuiverInfo: FLAY_QuiverInfo {
			count = 0;
			next = "FLAY_acc_Quiver_1B";
			prev = "FLAY_acc_Quiver_0B";
			magazine = "FLAY_7Rnd_BroadheadArrow";
			point = "FLAY_point_Broadhead";
		};			
	};
	
	
	class FLAY_acc_Stabilizer: ItemCore
	{
		scope = 2;
		displayName = "Stabilizer";
		descriptionShort = "descriptionShort";
		descriptionUse = "descriptionUse";
		picture = "\FLAY\FLAY_Archery\UI\gear_accv_flay_quiver_ca";
		model = "\FLAY\FLAY_Archery\acc\FLAY_stabilizer.p3d";
		class ItemInfo: InventoryFlashLightItem_Base_F
		{
			mass = 20;
			RMBhint = "Stabilizer";
			class FlashLight {};
		};
	};	
};
