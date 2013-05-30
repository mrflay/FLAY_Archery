class CfgPatches
{
 class tb_arifle_hkump45
 {
	requiredaddons[] = {};
	requiredversion = 0.1;
	units[] = {};
	weapons[] = {"FLAY_CompoundBow","FLAY_RecurveBow","FLAY_Arrow"};
	magazines[] = {"FLAY_1Rnd_RegularArrow","FLAY_1Rnd_BroadheadArrow","FLAY_1Rnd_ExplosiveArrow","FLAY_1Rnd_SmokeArrow","FLAY_1Rnd_FlareArrow"};
 };
};

class DefaultEventHandlers;

class CfgVehicles {

	class Man;
	class CAManBase {
	//	class EventHandlers: DefaultEventHandlers {
	//		init = "_scr = _this execVM ""tb_arifle_hkump45\scripts\bow_init.sqf"";";
	//		fired = "_this call FLAY_Effects_EH_Fired;";
	//		killed = "_this call FLAY_Effects_EH_Killed;";
	//		handledamage = "_this call FLAY_EH_HandleDamage;";
	//		hitpart = "_this call FLAY_EH_HitPart;";
	//		hit = "_this call FLAY_EH_Hit;";	
	//	};	
	};

	class Static;
	class FLAY_Arrow: Static
	{
		scope = 1;
		displayName = "Arrow";
		model = "\tb_arifle_hkump45\FLAY_Arrow.p3d";
		vehicleClass = "Misc";
	};
	
	class Thing;
	class FLAY_ArrowPlaceholder: Thing
	{
		scope = 1;
		displayName = "FLAY_ArrowPlaceholder";
		model = "\A3\Weapons_f\empty";
		vehicleClass = "Targets";
		class EventHandlers;
	};
	
	class FLAY_Target_FITA_122: Thing
	{
		class EventHandlers: DefaultEventHandlers {
			handledamage = "_this call FLAY_EH_HandleDamage;";
			hitpart = "_this call FLAY_EH_HitPart;";
			hit = "_this call FLAY_EH_Hit;";	
		};	
		scope = 1;
		displayName = "FITA 122";
		model = "\tb_arifle_hkump45\FLAY_Target_FITA_122.p3d";
		vehicleClass = "Targets";
	};
	
	class test_EmptyObjectForBubbles;
	class FLAY_SmokeEmitter: test_EmptyObjectForBubbles
	{
		displayName = "Smoke";
		class Eventhandlers
		{
			init = "(_this select 0) execVM ""\A3\weapons_f\data\scripts\smoke.sqf"";";
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
		handanim[] = {"OFP2_ManSkeleton","tb_arifle_hkump45\anim\handanim_recurvebow.rtm"};
		autoReload = 0;
		reloadAction = "GestureReset";
		reloadmagazinesound[] = {"A3\sounds_f\weapons\reloads\new_trg.wav", 0.1, 1, 30};
		reloadsound[] = {"", 1, 1};
		reloadtime = 0.15;
		
		muzzles[] = {
			"RegularArrowMuzzle"
			,"BroadheadArrowMuzzle"
			,"ExplosiveArrowMuzzle"
			// hacks
			,"DummyReloadBackQuiverMuzzle"
			,"DummyReloadBowQuiverMuzzle"
			,"DummyReloadBeltQuiverMuzzle"
			,"DummyReloadArrowMuzzle"
		};
		class ArrowMuzzle: GrenadeLauncher
		{
			displayName = "Compound Bow";
			cursor = "EmptyCursor";
			cursoraim = "mg";
			//cursor = "arifle";
			//cursoraim = "CursorAim";
			sound[] = {"",0.00031622776,1};
			reloadSound[] = {"",0.00031622776,1};
			aiDispersionCoefX = 6;
			aiDispersionCoefY = 6;
			showEmpty = 0;
			autoReload = 1;
			reloadTime = 0;
			magazineReloadTime = 0;
			enableAttack = 0;
			modelOptics = "-";
			minRange = 5;
			minRangeProbab = 0.5;
			midRange = 50;
			midRangeProbab = 0.2;
			maxRange = 100;
			maxRangeProbab = 0.03;
			begin1[] = {"tb_arifle_hkump45\sound\bowrelease02.ogg",5,1,30};
			soundBegin[] = {"begin1",1};
			recoil="Empty";
			recoilProne="Empty";
		};
		
		class RegularArrowMuzzle: ArrowMuzzle
		{
			magazines[] = {"FLAY_1Rnd_RegularArrow"};
			minRange = 5;
			minRangeProbab = 0.01;
			midRange = 50;
			midRangeProbab = 0.1;
			maxRange = 100;
			maxRangeProbab = 0.01;
			modelOptics = "-";
			distanceZoomMin = 100;
			distanceZoomMax = 1;
			opticsFlare = 1;
			opticsDisablePeripherialVision = 1;
		};
		
		class BroadheadArrowMuzzle: ArrowMuzzle
		{
			cursor = "arifle";
			cursoraim = "CursorAim";
			magazines[] = {"FLAY_1Rnd_BroadheadArrow"};
			minRange = 5;
			minRangeProbab = 0.01;
			midRange = 50;
			midRangeProbab = 0.1;
			maxRange = 200;
			maxRangeProbab = 0.01;
		}
		
		class ExplosiveArrowMuzzle: ArrowMuzzle
		{
			cursorAim = "gl";
			cursor = "EmptyCursor";			
			magazines[] = {
				"FLAY_1Rnd_ExplosiveArrow"
				//,"FLAY_1Rnd_SmokeArrow"
				//,"FLAY_1Rnd_FlareArrow_Red"
				//,"FLAY_1Rnd_FlameArrow"
			};
		};

		class DummyReloadBackQuiverMuzzle: ArrowMuzzle
		{
			magazineReloadTime=1;
			autoReload = 0;
			backgroundReload = 0;
			showEmpty = 1;
			magazines[] = {"FLAY_1Rnd_DummyArrow1"};
			reloadaction = "GestureReloadBackQuiver";
		};
		class DummyReloadBowQuiverMuzzle: ArrowMuzzle
		{
			magazineReloadTime=1;
			autoReload = 0;
			backgroundReload = 0;
			showEmpty = 1;
			magazines[] = {"FLAY_1Rnd_DummyArrow3"};
			reloadaction = "GestureReloadBowQuiver";
		};
		class DummyReloadBeltQuiverMuzzle: ArrowMuzzle
		{
			magazineReloadTime=1;
			autoReload = 0;
			backgroundReload = 0;
			showEmpty = 1;
			magazines[] = {"FLAY_1Rnd_DummyArrow4"};
			reloadaction = "GestureReloadBeltQuiver";
		};			
		class DummyReloadArrowMuzzle: ArrowMuzzle
		{
			magazineReloadTime=10;
			autoReload = 0;
			reloadTime = 0;
			backgroundReload = 1; // HACK: this enables reload animation to be shown for muzzles with autoReload=1
			showEmpty = 1;
			magazines[] = {"FLAY_1Rnd_DummyArrow2"};
			reloadAction = "GestureReloadArrow";
		};
		
		class Library {
			libtextdesc = "";
		};

		class WeaponSlotsInfo {
			allowedslots[] = {901};
			mass = 4;
			class MuzzleSlot {
				access = 1;
				compatibleitems[] = {
					"FLAY_point"
					,"FLAY_point_Broadhead"
					,"FLAY_point_Explosive"
					,"FLAY_point_Field"
					,"FLAY_point_Target"
					,"FLAY_point_Precision"
				};
				displayname = "Arrow Slot";
				linkproxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				scope = 0;
			};
			class CowsSlot {
				access = 1;
				compatibleitems[] = {
					"optic_Arco"
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
		displayName = "Night Hawk";
		descriptionshort = "Compound Bow<br />Draw Length: 28""<br />Draw Weight: 65 lbs<br />String: 58.5""";		
		picture = "\tb_arifle_hkump45\UI\gear_flay_nighthawk_x_ca";
		model = "tb_arifle_hkump45\FLAY_CompoundBow";
		handanim[] = {"OFP2_ManSkeleton","tb_arifle_hkump45\anim\handanim_compoundbow.rtm"};
		class Library {
			libtextdesc = "Night Hawk Compound Bow";
		};
	};
	
	class FLAY_RecurveBow: FLAY_Archery_Bow {
		scope = 2;
		displayName = "Classic";
		descriptionshort = "Recurve Bow<br />Draw Length: 28""<br />Draw Weight: 60 lbs<br />String: 58.5""";		
		picture = "\tb_arifle_hkump45\UI\gear_flay_nighthawk_x_ca";
		model = "tb_arifle_hkump45\FLAY_RecurveBow";
		handanim[] = {"OFP2_ManSkeleton","tb_arifle_hkump45\anim\handanim_recurvebow.rtm"};
		class Library {
			libtextdesc = "Night Hawk Compound Bow";
		};	
	};
	
	class launch_NLAW_F;
	class FLAY_Quiver_LauncherHack: launch_NLAW_F
	{
		scope = 2;
		displayName = "Back Quiver";
		model = "tb_arifle_hkump45\FLAY_quiver_launcher_7b";
		picture = "\tb_arifle_hkump45\UI\gear_accv_flay_quiver_ca";
	};
};

class CfgMagazines {

	class CA_Magazine;
	class FLAY_1Rnd_RegularArrow : CA_Magazine {
		displayname = "Precision Arrow";
		displayNameShort = "Arrow";
		descriptionshort = "FLAY_1Rnd_RegularArrow";
		picture = "\tb_arifle_hkump45\UI\gear_flay_arrow_ca";
		model = "tb_arifle_hkump45\hkump_mag";
		ammo = "B_RegularArrow";
		count = 1;
		initspeed = 100;
		lastroundstracer = 0;
		scope = 2;
		tracersevery = 0;
	};	
	class FLAY_1Rnd_BroadheadArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		displayName = "Broadhead Arrow";
		displayNameShort = "Broadhead";
		descriptionShort = "FLAY_1Rnd_BroadheadArrow";
		picture = "\tb_arifle_hkump45\UI\gear_flay_arrow_ca";
		type = 256;
		ammo = "B_BroadheadArrow";
		count = 1;
		initSpeed = 160;
		nameSound = "";
		maxLeadSpeed = 50;
	};	
	class FLAY_1Rnd_ExplosiveArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		type = 16;
		displayName = "Explosive Arrow";
		displayNameShort = "Explosive";
		descriptionShort = "FLAY_1Rnd_ExplosiveArrow";
		picture = "\tb_arifle_hkump45\UI\gear_flay_arrow_ca";
		ammo = "G_ExplosiveArrow";
		count = 1;
		initSpeed = 60;
		nameSound = "";
	};
	class FLAY_1Rnd_FlameArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		type = 16;
		displayName = "Flame Arrow";
		displayNameShort = "Flame";
		descriptionShort = "FLAY_1Rnd_FlameArrow";
		picture = "\tb_arifle_hkump45\UI\gear_flay_arrow_ca";
		ammo = "F_FlameArrow";
		count = 1;
		initSpeed = 60;
		nameSound = "";
	};
	class FLAY_1Rnd_FlareArrow_Red: CA_Magazine
	{
		scope = 2;
		value = 1;
		type = 16;
		displayName = "Flare";
		displayNameShort = "Flare";
		descriptionShort = "FLAY_1Rnd_FlareArrow_Red";
		picture = "\tb_arifle_hkump45\UI\gear_flay_arrow_ca";
		ammo = "F_FlareArrow_Red";
		count = 1;
		initSpeed = 60;
		nameSound = "";
	};	
	class FLAY_1Rnd_SmokeArrow: CA_Magazine
	{
		scope = 2;
		value = 1;
		type = 16;
		displayName = "Smoke";
		displayNameShort = "Smoke";
		descriptionShort = "FLAY_1Rnd_SmokeArrow";
		picture = "\tb_arifle_hkump45\UI\gear_flay_arrow_ca";
		ammo = "G_SmokeArrow";
		count = 1;
		initSpeed = 60;
		nameSound = "";
	};
	
	// hacks
	
	class FLAY_1Rnd_DummyArrow1 : CA_Magazine {
		scope = 2;
		displayname = "Back Quiver (maghack)";
		displayNameShort = "Back Quiver";
		descriptionshort = "FLAY_1Rnd_DummyArrow1";
		picture = "\tb_arifle_hkump45\UI\gear_flay_arrows_ca";
		model = "\A3\weapons_f\empty";
		ammo = "B_DummyArrow";
		count = 1;
		initspeed = 0;
	};
	class FLAY_1Rnd_DummyArrow2 : FLAY_1Rnd_DummyArrow1 {
		scope = 2;
		displayname = "FLAY_1Rnd_DummyArrow2";
		displayNameShort = "FLAY_1Rnd_DummyArrow2";
		descriptionshort = "FLAY_1Rnd_DummyArrow2";
	};
	class FLAY_1Rnd_DummyArrow3 : FLAY_1Rnd_DummyArrow1 {
		scope = 2;
		displayname = "Bow Quiver (maghack)";
		displayNameShort = "Bow Quiver";
		descriptionshort = "FLAY_1Rnd_DummyArrow3";
	};
	class FLAY_1Rnd_DummyArrow4 : FLAY_1Rnd_DummyArrow1 {
		scope = 2;
		displayname = "Belt Quiver (maghack)";
		displayNameShort = "Belt Quiver";
		descriptionshort = "FLAY_1Rnd_DummyArrow4";
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
		model = "\A3\Weapons_f\Data\bullettracer\tracer_yellow";
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
	
	class B_BroadheadArrow: B_RegularArrow
	{
		typicalspeed = 150;
		deflecting = 10;
		hit = 12;
		caliber = 1;
		airFriction = -0.0003;
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
	
	class B_DummyArrow: BulletBase
	{
		typicalspeed = 0;
		visibleFire = 0;
		audibleFire = 0;
		visibleFireTime = 0;
		fuseDistance = 1;
		hit = 0;
		indirectHit = 0;
		indirectHitRange = 0;
		explosive = 0;
		cost = 999999;
		timeToLive = 0;
		triggerTime = 0;
	};	
		
};

	
// ===========================================================================
// MOVES
// ===========================================================================


class CfgMovesBasic
{
	class DefaultDie;
	class NoActions;
	class ManActions
	{
		GestureReset[] = {"GestureReset","Gesture"};
		//GestureReset2[] = {"GestureReset2","Gesture"};
		//GestureReset3[] = {"GestureReset3","Gesture"};
		GestureReloadArrow[] = {"GestureReloadArrow","Gesture"};
		GestureReloadBackQuiver[] = {"GestureReloadBackQuiver","Gesture"};
		GestureReloadBowQuiver[] = {"GestureReloadBowQuiver","Gesture"};
		GestureReloadBeltQuiver[] = {"GestureReloadBeltQuiver","Gesture"};
	};
};

class CfgMovesMaleSdr: CfgMovesBasic
{
	class Default;
	class States {};
};


// ===========================================================================
// GESTURES
// ===========================================================================


class CfgGesturesMale
{
	class Default;
	class States
	{	
		// This is used to reset the animation to default posture 
		// after an looped gesture.
		class GestureResetOld: Default
		{
			file = "";
			looped = 0;
			speed = 0.1;
			mask = "fullBody";
			leftHandIKCurve[] = {1};
			rightHandIKCurve[] = {1};	
		};
		
		class GestureReset2: Default
		{
			file = "tb_arifle_hkump45\anim\reload3b.rtm"
			looped = 0;
			speed = 1;
			mask = "handsWeapon";
			//leftHandIKCurve[] = {0};
			rightHandIKCurve[] = {0};
		};
		class GestureReset: Default
		{
			file = "\A3\anims_f\Data\Anim\Sdr\gst\GestureHi.rtm";
			looped = 0;
			speed = 10000;
			mask = "rightHand";
			rightHandIKCurve[] = {0,1,0.05,0,0.95,0,1,1};
		};
		
		class GestureReloadArrow: Default
		{
			file = "tb_arifle_hkump45\anim\reload3a.rtm"
			looped = 0;
			speed = 0.1;
			mask = "handsWeapon";
			rightHandIKCurve[] = {0};
			canPullTrigger=1;
			disableWeapons=0;
			canReload=1;
		};		

		class GestureReloadBackQuiver: Default
		{
			file = "tb_arifle_hkump45\anim\reload_back.rtm"
			looped = 0;
			speed = 2;
			mask = "rightHand";
			rightHandIKCurve[] = {0,1,0.05,0,0.95,0,1,1};
			//rightHandIKCurve[] = {0};
		};

		class GestureReloadBowQuiver: Default
		{
			file = "tb_arifle_hkump45\anim\reload_bow.rtm"
			looped = 0;
			speed = 2;
			mask = "rightHand";
			rightHandIKCurve[] = {0,1,0.05,0,0.95,0,1,1};
			//rightHandIKCurve[] = {0};
		};

		class GestureReloadBeltQuiver: Default
		{
			file = "tb_arifle_hkump45\anim\reload_belt.rtm"
			looped = 0;
			speed = 2;
			mask = "rightHand";
			rightHandIKCurve[] = {0,1,0.05,0,0.95,0,1,1};
			//rightHandIKCurve[] = {0};
		};		
	};
};