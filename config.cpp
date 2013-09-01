class CfgPatches
{
	class FLAY_Archery
	{
		requiredaddons[] = {};
		requiredversion = 0.1;
		units[] = {"FLAY_Target_FITA_122"};
		weapons[] = {"FLAY_CompoundBow","FLAY_RecurveBow"};
		magazines[] = {"FLAY_1Rnd_Arrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_ExplosiveArrow"};
	};
};

class DefaultEventHandlers;
class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class UserActions;
class AnimationSources;


class CfgVehicles {

	class Static;
	class FLAY_Arrow: Static
	{
		scope = 1;
		displayName = "Arrow";
		model = "\FLAY\FLAY_Archery\FLAY_Arrow.p3d";
		vehicleClass = "Misc";
	};
	
	class Thing;
	class FLAY_ArrowThing: Thing
	{
		scope = 1;
		displayName = "Arrow Thing";
		model = "\FLAY\FLAY_Archery\FLAY_Arrow.p3d";
		vehicleClass = "Misc";
	};
	
	class FLAY_ArrowPlaceholder: Static
	{
		scope = 1;
		displayName = "FLAY_ArrowPlaceholder";
		model = "\A3\Weapons_f\empty";
		class EventHandlers;
	};
	
	class TargetBase;
	class FLAY_Target_FITA_122: TargetBase
	{
		scope = 2;
		displayName = "FITA 122";
		model = "\FLAY\FLAY_Archery\FLAY_Target_FITA_122.p3d";
		class EventHandlers {
			hitpart = "_this execVM '\FLAY\FLAY_Archery\scripts\target\target_hitpart.sqf';";
		};
	};
	
};

class CfgWeapons {

    class Default;
	class Rifle;
	class GrenadeLauncher;
	
	class FLAY_Archery_Bow: Rifle
	{	
		scope = 1;
		displayName = "Bow";
		descriptionshort = "Bow<br />Draw Length: 28""<br />Draw Weight: 50 lbs<br />String: 58.5""";
		picture = "";
		uipicture = "\A3\weapons_f\data\UI\icon_regular_CA.paa";

		model = "";
		handanim[] = {"OFP2_ManSkeleton","FLAY\FLAY_Archery\anim\handanim_recurvebow.rtm"};
		magazines[] = {};
		
		class FLAY_BowInfo {
			scope = 2;
			state = "empty";
		};
		
		muzzles[] = {"ArrowMuzzle"};
				
		class ArrowMuzzle: GrenadeLauncher
		{
			displayName = "Compound Bow";
			cursor = "EmptyCursor";
			cursoraim = "arifle";
			magazines[] = {
				"FLAY_1Rnd_Arrow"
				,"FLAY_1Rnd_PrecisionArrow"
				,"FLAY_1Rnd_BroadheadArrow"
				,"FLAY_1Rnd_ExplosiveArrow"
			};

			reloadAction = "GestureReloadBackQuiver"; // only used by ai, because player reloads using scripts
			discreteDistance[] = {30};
			discreteDistanceInitIndex = 0;			
			sound[] = {"",0.00031622776,1};
			reloadSound[] = {"",0.00031622776,1};
			showEmpty = 1;
			autoReload = 1; 
			reloadTime = 0; 
			magazineReloadTime = 0;
			enableAttack = 1;
			modelOptics = "-";
			begin1[] = {"FLAY\FLAY_Archery\sound\bowrelease02.ogg",5,1,30};
			soundBegin[] = {"begin1",1};
			recoil="Empty";
			recoilProne="Empty";
			distanceZoomMin = 100;
			distanceZoomMax = 1;
			opticsFlare = 1;
			opticsDisablePeripherialVision = 1;

			aiDispersionCoefX = 15.0;
			aiDispersionCoefY = 20.0;
			aiRateOfFire = 2.0;
			aiRateOfFireDistance=100;
			minRange = 5;
			minRangeProbab = 0.8;
			midRange = 50;
			midRangeProbab = 0.8;
			maxRange = 200;
			maxRangeProbab = 0.8;

			value = 1000;
			cost = 1;
		};
		
		class Library {
			libtextdesc = "";
		};

		class WeaponSlotsInfo {
			allowedslots[] = {901};
			mass = 60;
			class MuzzleSlot {
				access = 1;
				compatibleitems[] = {
					"FLAY_point"
					,"FLAY_point_Broadhead"
					,"FLAY_point_Explosive"
					,"FLAY_point_Field"
					,"FLAY_point_Target"
					,"FLAY_point_Precision"
					,"FLAY_point_Debug"
				};
				displayname = "Arrow Slot";
				linkproxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				scope = 0;
			};
			class CowsSlot {
				access = 1;
				compatibleitems[] = {
					"optic_arco"
					,"optic_mrco"
					,"optic_aco"
					,"optic_ACO_grn"
					,"optic_hamr"
					,"optic_Holosight"
				};
				displayname = "Optics Slot";
				linkproxy = "\A3\data_f\proxies\weapon_slots\TOP";
				scope = 2;
			};
			class PointerSlot 
			{
				access = 1;
				scope = 2;
				displayname = "Pointer Slot";
				compatibleitems[] = {
					"acc_pointer_IR"
					,"acc_flashlight"
					,"FLAY_acc_Quiver"
					,"FLAY_acc_Quiver_7","FLAY_acc_Quiver_6","FLAY_acc_Quiver_5","FLAY_acc_Quiver_4","FLAY_acc_Quiver_3","FLAY_acc_Quiver_2","FLAY_acc_Quiver_1","FLAY_acc_Quiver_0"
					,"FLAY_acc_Quiver_7HE","FLAY_acc_Quiver_6HE","FLAY_acc_Quiver_5HE","FLAY_acc_Quiver_4HE","FLAY_acc_Quiver_3HE","FLAY_acc_Quiver_2HE","FLAY_acc_Quiver_1HE","FLAY_acc_Quiver_0HE"
					,"FLAY_acc_Quiver_7P","FLAY_acc_Quiver_6P","FLAY_acc_Quiver_5P","FLAY_acc_Quiver_4P","FLAY_acc_Quiver_3P","FLAY_acc_Quiver_2P","FLAY_acc_Quiver_1P","FLAY_acc_Quiver_0P"
					,"FLAY_acc_Quiver_7B","FLAY_acc_Quiver_6B","FLAY_acc_Quiver_5B","FLAY_acc_Quiver_4B","FLAY_acc_Quiver_3B","FLAY_acc_Quiver_2B","FLAY_acc_Quiver_1B","FLAY_acc_Quiver_0B"
					,"FLAY_acc_Stabilizer"
				};
				linkproxy = "\A3\data_f\proxies\weapon_slots\SIDE";
			};		
		};
		
		class ItemInfo
		{
			priority = 1;
			RMBhint = "XMX";
			onHoverText = "TODO XMX DSS";
		};		
	};
	
	class FLAY_CompoundBow: FLAY_Archery_Bow {
		scope = 2;
		displayName = "Compound Bow";
		descriptionshort = "Compound Bow<br />Draw Length: 28""<br />Draw Weight: 65 lbs<br />String: 58.5""";		
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_nighthawk_x_ca";
		model = "\FLAY\FLAY_Archery\FLAY_CompoundBow";
		handanim[] = {"OFP2_ManSkeleton","FLAY\FLAY_Archery\anim\handanim_compoundbow.rtm"};
		muzzles[] = {"ArrowMuzzle","QuiverMuzzle"};
		class FLAY_BowInfo: FLAY_BowInfo {
			scope = 2;
			state = "empty";
			prev = "FLAY_CompoundBow";
			next = "FLAY_CompoundBowLoaded";
			empty = "FLAY_CompoundBow";
			loaded = "FLAY_CompoundBowLoaded";
			drawn = "FLAY_CompoundBowDrawn";		

		};
		class ArrowMuzzle: ArrowMuzzle
		{
			displayName = "(Backpack)     Compound Bow";
			cursor = "EmptyCursor";
			cursoraim = "arifle";
			magazines[] = {
				 "FLAY_1Rnd_Arrow"
				,"FLAY_1Rnd_PrecisionArrow"
				,"FLAY_1Rnd_BroadheadArrow"
				,"FLAY_1Rnd_ExplosiveArrow"
			};
			FLAY_reloadAction = "GestureReloadBackQuiver";
			FLAY_unloadAction = "GestureReset";
			showEmpty = 1;
			autoReload = 0; 
			reloadTime = 0; 
			magazineReloadTime = 1;
		};
		class QuiverMuzzle: ArrowMuzzle
		{
			displayName = "(Quiver)        Compound Bow";
			cursor = "EmptyCursor";
			cursoraim = "arifle";
			magazines[] = {
				 "FLAY_7Rnd_Arrow"
				,"FLAY_7Rnd_PrecisionArrow"
				,"FLAY_7Rnd_BroadheadArrow"
				,"FLAY_7Rnd_ExplosiveArrow"
			};
			FLAY_reloadAction = "GestureReloadBowQuiver";
			FLAY_unloadAction = "GestureReset";
			showEmpty = 1;
			autoReload = 0; 
			reloadTime = 0; 
			magazineReloadTime = 1;
		};		
		class Library {
			libtextdesc = "Compound Bow";
		};
	};
	
	class FLAY_CompoundBowLoaded: FLAY_CompoundBow {
		scope = 1;
		class FLAY_BowInfo: FLAY_BowInfo {
			scope = 2;
			state = "loaded";
			prev = "FLAY_CompoundBow";
			next = "FLAY_CompoundBowDrawn";
		};
		displayName = "Compound Bow (loaded)";
		model = "\FLAY\FLAY_Archery\FLAY_CompoundBowLoaded";
		class ArrowMuzzle: ArrowMuzzle
		{
			FLAY_reloadAction = "GestureReloadArrow";
			FLAY_unloadAction = "GestureReloadBackQuiver";
			autoReload = 0;	
		};
		class QuiverMuzzle: QuiverMuzzle
		{
			FLAY_reloadAction = "GestureReloadArrow";
			FLAY_unloadAction = "GestureReloadBowQuiver";
			autoReload = 0;
		};		
		class Library {
			libtextdesc = "Compound Bow";
		};
	};
	
	class FLAY_CompoundBowDrawn: FLAY_CompoundBow {
		scope = 1;
		class FLAY_BowInfo: FLAY_BowInfo {
			scope = 2;
			state = "drawn";
			prev = "FLAY_CompoundBowLoaded";
			next = "FLAY_CompoundBowDrawn";
		};
		displayName = "Compound Bow (drawn)";
		model = "\FLAY\FLAY_Archery\FLAY_CompoundBowDrawn";	
		class ArrowMuzzle: ArrowMuzzle
		{
			FLAY_reloadAction = "GestureReset"; // todo: fire animation
			FLAY_unloadAction = "GestureReset";
			autoReload = 0; 
			reloadTime = 0; 
			magazineReloadTime = 0;
		};
		class QuiverMuzzle: QuiverMuzzle
		{
			FLAY_reloadAction = "GestureReset";  // todo: fire animation
			FLAY_unloadAction = "GestureReset";
			autoReload = 0; 
			reloadTime = 0; 
			magazineReloadTime = 0;
		};			
		class Library {
			libtextdesc = "Compound Bow";
		};
	};	
	
	class FLAY_RecurveBow: FLAY_CompoundBow {
		scope = 2;
		displayName = "Recurve Bow";
		descriptionshort = "Recurve Bow<br />Draw Length: 28""<br />Draw Weight: 60 lbs<br />String: 58.5""";		
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_recurve_x_ca";
		model = "FLAY\FLAY_Archery\FLAY_RecurveBow";
		handanim[] = {"OFP2_ManSkeleton","FLAY\FLAY_Archery\anim\handanim_recurvebow.rtm"};
		class FLAY_BowInfo: FLAY_BowInfo {
			scope = 2;
			state = "empty";
			prev = "FLAY_RecurveBow";
			next = "FLAY_RecurveBowLoaded";
			empty = "FLAY_RecurveBow";
			loaded = "FLAY_RecurveBowLoaded";
			drawn = "FLAY_RecurveBowDrawn";		

		};
		class ArrowMuzzle: ArrowMuzzle
		{
			displayName = "(Backpack)      Recurve Bow";
		};
		class QuiverMuzzle: QuiverMuzzle
		{
			displayName = "(Quiver)         Recurve Bow";
		};
		class Library {
			libtextdesc = "Recurve Bow";
		};	
	};
	
	class FLAY_RecurveBowLoaded: FLAY_CompoundBowLoaded {
		scope = 1;
		class FLAY_BowInfo: FLAY_BowInfo {
			scope = 2;
			state = "loaded";
			prev = "FLAY_RecurveBow";
			next = "FLAY_RecurveBowDrawn";
			empty = "FLAY_RecurveBow";
			loaded = "FLAY_RecurveBowLoaded";
			drawn = "FLAY_RecurveBowDrawn";				
		};
		displayName = "Recurve Bow (loaded)";
		descriptionshort = "Recurve Bow<br />Draw Length: 28""<br />Draw Weight: 60 lbs<br />String: 58.5""";		
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_recurve_x_ca";
		model = "\FLAY\FLAY_Archery\FLAY_RecurveBowLoaded";
		handanim[] = {"OFP2_ManSkeleton","FLAY\FLAY_Archery\anim\handanim_recurvebow.rtm"};
		class ArrowMuzzle: ArrowMuzzle
		{
			displayName = "(Backpack)      Recurve Bow";
		};
		class QuiverMuzzle: QuiverMuzzle
		{
			displayName = "(Quiver)         Recurve Bow";
		};
		class Library {
			libtextdesc = "Recurve Bow";
		};
	};
	
	class FLAY_RecurveBowDrawn: FLAY_CompoundBowDrawn {
		scope = 1;
		class FLAY_BowInfo: FLAY_BowInfo {
			scope = 2;
			state = "drawn";
			prev = "FLAY_RecurveBowLoaded";
			next = "FLAY_RecurveBowDrawn";
			empty = "FLAY_RecurveBow";
			loaded = "FLAY_RecurveBowLoaded";
			drawn = "FLAY_RecurveBowDrawn";				
		};
		displayName = "Recurve Bow (drawn)";
		descriptionshort = "Recurve Bow<br />Draw Length: 28""<br />Draw Weight: 60 lbs<br />String: 58.5""";		
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_recurve_x_ca";		
		model = "\FLAY\FLAY_Archery\FLAY_RecurveBowDrawn";
		handanim[] = {"OFP2_ManSkeleton","FLAY\FLAY_Archery\anim\handanim_recurvebow.rtm"};
		class ArrowMuzzle: ArrowMuzzle
		{
			displayName = "(Backpack)      Recurve Bow";
		};
		class QuiverMuzzle: QuiverMuzzle
		{
			displayName = "(Quiver)         Recurve Bow";
		};			
		class Library {
			libtextdesc = "Recurve Bow";
		};
	};
	
	// Variants
	
	class FLAY_CompoundBow_Quiver_7HE: FLAY_CompoundBow 
	{
		displayName = "Compound Bow (HE7)";
		class LinkedItems
		{
			class LinkedItemsOptic
			{
				slot = "CowsSlot";
				item = "optic_aco";
			};
			class LinkedItemsAcc
			{
				slot = "PointerSlot";
				item = "FLAY_acc_Quiver_7HE";
			};	
		};	
	};
	
	class FLAY_CompoundBow_Quiver_7B: FLAY_CompoundBow 
	{
		displayName = "Compound Bow (HE7)";
		class LinkedItems
		{
			class LinkedItemsAcc
			{
				slot = "PointerSlot";
				item = "FLAY_acc_Quiver_7B";
			};	
		};	
	};	
	
	class FLAY_RecurveBow_Stabilizer: FLAY_RecurveBow 
	{
		displayName = "Recurve Bow (STB)";
		class LinkedItems
		{
			class LinkedItemsOptic
			{
				slot = "CowsSlot";
				item = "optic_aco";
			};
			class LinkedItemsAcc
			{
				slot = "PointerSlot";
				item = "FLAY_acc_Stabilizer";
			};	
		};
	};
	
	class FLAY_RecurveBow_ACO: FLAY_RecurveBow 
	{
		displayName = "Recurve Bow (STB)";
		class LinkedItems
		{
			class LinkedItemsOptic
			{
				slot = "CowsSlot";
				item = "optic_aco";
			};
			class LinkedItemsAcc
			{
				slot = "PointerSlot";
				item = "acc_flashlight";
			};				
		};
	};	
};

class CfgMagazines {

	class CA_Magazine;
	class FLAY_1Rnd_Arrow : CA_Magazine {
		displayname = "Arrow";
		displayNameShort = "Arrow";
		descriptionshort = "FLAY_1Rnd_Arrow";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		ammo = "B_RegularArrow";
		count = 1;
		initspeed = 100;
		lastroundstracer = 0;
		scope = 2;
		tracersevery = 0;
		FLAY_point = "";
		mass = 7;
	};
	class FLAY_7Rnd_Arrow : CA_Magazine {
		displayname = "Arrow";
		displayNameShort = "Arrow";
		descriptionshort = "FLAY_7Rnd_Arrow";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		ammo = "B_RegularArrow";
		count = 1;
		initspeed = 100;
		lastroundstracer = 0;
		scope = 2;
		tracersevery = 0;
		FLAY_point = "";
		mass = 7;
	};		
	class FLAY_1Rnd_PrecisionArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		displayName = "Precision Arrow";
		displayNameShort = "Precision";
		descriptionShort = "FLAY_1Rnd_PrecisionArrow";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		type = 256;
		ammo = "B_PrecisionArrow";
		count = 1;
		initSpeed = 120;
		nameSound = "";
		maxLeadSpeed = 50;
		FLAY_point = "FLAY_point_Precision";
		mass = 7;
	};
	class FLAY_7Rnd_PrecisionArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		displayName = "Precision Arrow";
		displayNameShort = "Precision";
		descriptionShort = "FLAY_7Rnd_PrecisionArrow";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		type = 256;
		ammo = "B_PrecisionArrow";
		count = 1;
		initSpeed = 120;
		nameSound = "";
		maxLeadSpeed = 50;
		FLAY_point = "FLAY_point_Precision";
		mass = 7;
	};	
	class FLAY_1Rnd_BroadheadArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		displayName = "Broadhead Arrow";
		displayNameShort = "Broadhead";
		descriptionShort = "FLAY_1Rnd_BroadheadArrow";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		type = 256;
		ammo = "B_BroadheadArrow";
		count = 1;
		initSpeed = 90;
		nameSound = "";
		maxLeadSpeed = 50;
		FLAY_point = "FLAY_point_Broadhead";
		mass = 8;
	};	
	class FLAY_7Rnd_BroadheadArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		displayName = "Broadhead Arrow";
		displayNameShort = "Broadhead";
		descriptionShort = "FLAY_7Rnd_BroadheadArrow";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		type = 256;
		ammo = "B_BroadheadArrow";
		count = 1;
		initSpeed = 90;
		nameSound = "";
		maxLeadSpeed = 50;
		FLAY_point = "FLAY_point_Broadhead";
		mass = 8;
	};		
	class FLAY_1Rnd_ExplosiveArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		type = 16;
		displayName = "Explosive Arrow";
		displayNameShort = "Explosive";
		descriptionShort = "FLAY_1Rnd_ExplosiveArrow";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		ammo = "G_ExplosiveArrow";
		count = 1;
		initSpeed = 60;
		nameSound = "";
		FLAY_point = "FLAY_point_Explosive";
		mass = 9;
	};
	class FLAY_7Rnd_ExplosiveArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		type = 16;
		displayName = "Explosive Arrow";
		displayNameShort = "Explosive";
		descriptionShort = "FLAY_7Rnd_ExplosiveArrow";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		ammo = "G_ExplosiveArrow";
		count = 1;
		initSpeed = 60;
		nameSound = "";
		FLAY_point = "FLAY_point_Explosive";
		mass = 9;
	};	
	class FLAY_1Rnd_FlameArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		type = 16;
		displayName = "Flame Arrow";
		displayNameShort = "Flame";
		descriptionShort = "FLAY_1Rnd_FlameArrow";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		ammo = "F_FlameArrow";
		count = 1;
		initSpeed = 60;
		nameSound = "";
		FLAY_point = "FLAY_point_Flame";
		mass = 9;
	};
	class FLAY_1Rnd_FlareArrow_Red: CA_Magazine
	{
		scope = 2;
		value = 1;
		type = 16;
		displayName = "Flare";
		displayNameShort = "Flare";
		descriptionShort = "FLAY_1Rnd_FlareArrow_Red";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		ammo = "F_FlareArrow_Red";
		count = 1;
		initSpeed = 60;
		nameSound = "";
		FLAY_point = "FLAY_point_Flare";
		mass = 9;
	};	
	class FLAY_1Rnd_SmokeArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		type = 16;
		displayName = "Smoke";
		displayNameShort = "Smoke";
		descriptionShort = "FLAY_1Rnd_SmokeArrow";
		picture = "\FLAY\FLAY_Archery\UI\gear_flay_arrow_ca";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		ammo = "G_SmokeArrow";
		count = 1;
		initSpeed = 60;
		nameSound = "";
		FLAY_point = "FLAY_point_Smoke";
		mass = 9;
	};
};

class CfgAmmo {

    class Default;
	class BulletBase;
	class GrenadeBase;
	class FlareBase;
	class SmokeShell;
	class G_40mm_HE;
	class G_40mm_Smoke;
	
	class B_RegularArrow: BulletBase
	{
		typicalspeed = 100;
		visibleFire = 0;
		audibleFire = 0;
		visibleFireTime = 0;
		fuseDistance = 0;
		hit = 8;
		indirectHit = 0;
		indirectHitRange = 0;
		//model = "\A3\Weapons_f\Data\bullettracer\tracer_yellow";
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		CraterEffects = "NoCrater";
		explosionEffects = "NoExplosion";
		explosive = 0;
		cost = 1;
		whistleDist = 0;
		simulation = "shotShell";
		deflecting = 0;
		airFriction = -0.0006;
		caliber = 0.5;
		timeToLive = 60;
	};
	
	class B_PrecisionArrow: B_RegularArrow
	{
		typicalspeed = 110;
		visibleFire = 0;
		audibleFire = 0;
		visibleFireTime = 0;
		fuseDistance = 0;
		hit = 5;
		indirectHit = 0;
		indirectHitRange = 0;
		model = "FLAY\FLAY_Archery\FLAY_Arrow";
		CraterEffects = "NoCrater";
		explosionEffects = "NoExplosion";
		explosive = 0;
		cost = 1;
		whistleDist = 0;
		simulation = "shotShell";
		deflecting = 0;
		airFriction = -0.0003;
		caliber = 0.3;
		timeToLive = 60;
	};
	
	class B_BroadheadArrow: B_RegularArrow
	{
		typicalspeed = 90;
		deflecting = 10;
		hit = 12;
		caliber = 1;
		airFriction = -0.0012;
	};	
	
	class G_ExplosiveArrow: G_40mm_HE
	{
		model = "\A3\weapons_f\Ammo\UGL_slug";
		hit = 16;
		indirectHit = 10;
		indirectHitRange = 5;
		visibleFire = 0;
		audibleFire = 0;
		visibleFireTime = 0;
		deflecting = 5;
		airFriction = -0.001064;
		fuseDistance = 0;
		whistleDist = 2;
		typicalSpeed = 60;
		timeToLive = 60;
	};	
		
	class F_FlameArrow: FlareBase
	{
		model = "\A3\Weapons_F\Ammo\UGL_Flare";
		typicalspeed = 60;
		lightColor[] = {0.5,0.5,0.5,0.5};
		useFlare = 1;
		deflecting = 30;
		smokeColor[] = {1,1,1,0.5};
		effectFlare = "CounterMeasureFlare";
		brightness = 1;
		size = 0.5;
		triggerTime = 2;
		triggerSpeedCoef = 1;
	};	
	
	class G_SmokeArrow: G_40mm_Smoke
	{
		scope = 1;
		model = "\A3\weapons_f\Ammo\UGL_slug";
		typicalspeed = 60;

		hit = 0;
		indirectHit = 0;
		indirectHitRange = 0.2;
		cost = 100;
	
		explosive = 0;
		deflecting = 60;
		explosionTime = 0.1;
		timeToLive = 60;
		fuseDistance = 1;
		soundHit[] = {"",0,1};
		smokeColor[] = {1,1,1,1};
		effectsSmoke = "ObjectDestructionSmoke1_2Smallx";
		whistleDist = 0;		
	};
	
	class F_FlareArrow_Red: SmokeShell
	{
		model = "\A3\Weapons_f\chemlight\chemlight_green_lit";
		effectsSmoke = "ChemlightLight_green";
		typicalspeed = 60;
		timeToLive = 900;
		fuseDistance = 0;
		triggerTime = 0.01;
	};		
};

	
// ===========================================================================
// MOVES
// ===========================================================================


class CfgMovesBasic
{
	class ManActions
	{
		GestureReset[] = {"GestureReset","Gesture"};
		GestureReloadArrowAndFireAi[] = {"GestureReloadArrowAndFireAi","Gesture"};
		GestureReloadArrow[] = {"GestureReloadArrow","Gesture"};
		GestureReloadBackQuiver[] = {"GestureReloadBackQuiver","Gesture"};
		GestureReloadBowQuiver[] = {"GestureReloadBowQuiver","Gesture"};
		GestureReloadBeltQuiver[] = {"GestureReloadBeltQuiver","Gesture"};
	};
};


// ===========================================================================
// GESTURES
// ===========================================================================

class CfgMovesMaleSdr : CfgMovesBasic {	
	class States {
		class AmovPknlMstpSrasWrflDnon;
		class AmovPknlMstpSrasWbowDnon : AmovPknlMstpSrasWrflDnon {
			aimPrecision = 0.01;
		};
	};
};
class CfgGesturesMale
{
	class Default;
	class States
	{	
		class GestureReset: Default
		{
			file = "\A3\anims_f\Data\Anim\Sdr\gst\GestureHi.rtm";
			looped = 0;
			speed = 10000;
			mask = "rightHand";
			rightHandIKCurve[] = {0,1,0.05,0,0.95,0,1,1};
			enableOptics = 1;
		};
		
		class GestureReloadArrow: Default
		{
			file = "FLAY\FLAY_Archery\anim\reload.rtm";
			looped = 1;
			speed = 0.1;
			mask = "handsWeapon";
			rightHandIKCurve[] = {0};
			canPullTrigger=1;
			disableWeapons=0;
			canReload=1;
			enableOptics = 1;
			aimPrecision = 0;
		};		

		class GestureReloadArrowAndFireAi: Default
		{
			file = "FLAY\FLAY_Archery\anim\reload.rtm";
			looped = 0;
			speed = 1;
			mask = "handsWeapon";
			rightHandIKCurve[] = {0};
			canPullTrigger=1;
			disableWeapons=0;
			canReload=1;
			enableOptics = 1;
		};
		
		class GestureReloadBackQuiver: Default
		{
			file = "FLAY\FLAY_Archery\anim\reload_back.rtm";
			looped = 0;
			speed = 2;
			mask = "rightHand";
			rightHandIKCurve[] = {0,1,0.05,0,0.95,0,1,1};
			enableOptics = 1;
		};

		class GestureReloadBowQuiver: Default
		{
			file = "FLAY\FLAY_Archery\anim\reload_bow.rtm";
			looped = 0;
			speed = 2;
			mask = "rightHand";
			rightHandIKCurve[] = {0,1,0.05,0,0.95,0,1,1};
			enableOptics = 1;
		};

		class GestureReloadBeltQuiver: Default
		{
			file = "FLAY\FLAY_Archery\anim\reload_belt.rtm";
			looped = 0;
			speed = 2;
			mask = "rightHand";
			rightHandIKCurve[] = {0,1,0.05,0,0.95,0,1,1};
			enableOptics = 1;
		};		
	};
};

class CfgFunctions
{
	class FLAY
	{
		tag = "FLAY";
		class archery_bow
		{
			file = "\FLAY\FLAY_Archery\scripts\bow";
			class BowActive {};
			class CanReloadBow {};
			class ReloadBow {};
			class UnloadBow {};
			class SetBowState {};
			class SetBowQuiverState {};
			class SetBackQuiverState {};
			class FilterMagazines {};
			class ApplyInventoryState {};
		};
	};
};
