enum {
	stabilizedinaxisx = 1,
	compartment1 = 1,
	stabilizedinaxisy = 2,
	compartment2 = 2,
	stabilizedinaxesboth = 3,
	compartment3 = 4,
	compartment4 = 8,
	stabilizedinaxesnone = 0
};


class CfgPatches
{
	class FLAY_Archery
	{
		units[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};


class DefaultEventHandlers;
class FLAY_DefaultEventhandlers: DefaultEventHandlers
{
	init = "_scr = _this execVM ""\FLAY\FLAY_Archery\scripts\bow_init.sqf"";";
	fired = "_this call FLAY_Effects_EH_Fired;";
	killed = "_this call FLAY_Effects_EH_Killed;";
	handledamage = "_this call FLAY_EH_HandleDamage;";
	hitpart = "_this call FLAY_EH_HitPart;";
	hit = "_this call FLAY_EH_Hit;";
};


// ===========================================================================
// VEHICLES
// ===========================================================================


class CfgVehicles
{
	class Land;
	class Static;
	class Man: Land {};
	//{
	//	class EventHandlers: FLAY_DefaultEventhandlers {};
	//};
	
	//class CAManBase: Man {};
	//class Civilian: CAManBase {};
	//class Woodlander: Civilian {};
	//class FLAY_BowHunter: Woodlander {
	//	access=2;
	//	displayName="Bow Hunter";
	//	faction = "CIV";
	//	vehicleClass = "Men";
	//	camouflage = 1;
	//	accuracy = 2.0;
	//	weapons[]={"Throw","Put","FLAY_CompoundBow_Berkut"};
	//	magazines[]={"300Rnd_Regulararrows","300Rnd_FastArrows","300Rnd_ExplosiveArrows","300Rnd_FlameArrows"};
	//};
	
	class FLAY_Arrow_Broadhead: Static
	{
		scope = 1;
		displayName = "Arrow";
		model = "\FLAY\FLAY_Archery\FLAY_Arrow_Broadhead.p3d";
		vehicleClass = "Misc";
	};
	
	class FLAY_Target_FITA_122: Static
	{
		scope = 1;
		displayName = "FITA 122";
		model = "\FLAY\FLAY_Archery\FLAY_Target_FITA_122.p3d";
		vehicleClass = "Targets";
	};		
};


// ===========================================================================
// WEAPONS
// ===========================================================================


class cfgWeapons
{
    class Default;
	class Rifle;
	class GrenadeLauncher;
	class FLAY_CompoundBow_Berkut: Rifle
	{
		scope = 1;
		model="\FLAY\FLAY_Archery\FLAY_CompoundBow_Berkut.p3d";
		autoAimEnabled = 0;
		//cursor = "Air_W_MG";
		//cursorAim = "Air_Dot";
		//cursorSize = 1;
		//showAimCursorInternal = 1;
		//handAnim[] = {"OFP2_ManSkeleton","\FLAY\FLAY_Archery\anims\berkut\berkutAnim.rtm"};
		value = 0;
		type = 1;
		displayName = "Berkut Compound Bow";
		canDrop = 1;
		muzzles[] = {"RegularArrowsMuzzle","FastArrowsMuzzle","ExplosiveArrowsMuzzle","FlameArrowsMuzzle"};
		class CompoundBowMuzzle: GrenadeLauncher
		{
			//cursor = "Air_W_MG";
			//cursorAim = "Air_Dot";
			//cursorSize = 1;
			sound[] = {"",0.00031622776,1};
			reloadSound[] = {"",0.00031622776,1};
			aiDispersionCoefX = 6;
			aiDispersionCoefY = 6;
			reloadTime = 1;
			magazineReloadTime = 1;
			enableAttack = 0;
			showEmpty = 0;
			autoReload = 1;
			modelOptics = "-";
			minRange = 5;
			minRangeProbab = 0.5;
			midRange = 50;
			midRangeProbab = 0.2;
			maxRange = 100;
			maxRangeProbab = 0.03;
			begin1[] = {"FLAY\FLAY_Archery\data\sounds\bowrelease01.ogg",10.0,1,60};
			soundBegin[] = {"begin1",1};
			recoil="Empty";
			recoilProne="Empty";
		};
		class RegularArrowsMuzzle: CompoundBowMuzzle
		{
			magazines[] = {"300Rnd_RegularArrows"};
			displayName = "Regular Arrows";
			minRange = 5;
			minRangeProbab = 0.01;
			midRange = 50;
			midRangeProbab = 0.1;
			maxRange = 100;
			maxRangeProbab = 0.01;
			modelOptics = "-";
			//opticsPPEffects[] = {"OpticsCHAbera2","OpticsBlur2"};
			//opticsZoomMin = 0.0623;
			//opticsZoomMax = 0.0623;
			distanceZoomMin = 100;
			distanceZoomMax = 1;
			opticsFlare = 1;
			opticsDisablePeripherialVision = 1;
		};
		class FastArrowsMuzzle: RegularArrowsMuzzle
		{
			magazines[] = {"300Rnd_FastArrows"};
			displayName = "Fast Arrows";
			minRange = 5;
			minRangeProbab = 0.01;
			midRange = 50;
			midRangeProbab = 0.1;
			maxRange = 200;
			maxRangeProbab = 0.01;
		}
		class ExplosiveArrowsMuzzle: CompoundBowMuzzle
		{
			displayName = "Explosive Arrows";
			magazines[] = {"300Rnd_ExplosiveArrows"};
		};
		class FlameArrowsMuzzle: CompoundBowMuzzle
		{
			displayName = "Flame Arrows";
			magazines[] = {"300Rnd_FlameArrows"};
		};
	};
	
	class FLAY_RecurveBow_Haraburdi: FLAY_CompoundBow_Berkut
	{
		scope = 1;
		model="\FLAY\FLAY_Archery\FLAY_RecurveBow_Haraburdi.p3d";
		displayName = "Haraburdi Recurve Bow";
	};
	
	class FLAY_LongBow_Luk: FLAY_CompoundBow_Berkut
	{
		scope = 1;
		model="\FLAY\FLAY_Archery\FLAY_LongBow_Luk.p3d";
		displayName = "Luk Longbow";
	};	
};


// ===========================================================================
// MAGAZINES
// ===========================================================================


class CfgMagazines
{
	class Default;
	class CA_Magazine;
	class 300Rnd_RegularArrows: CA_Magazine
	{
		scope = 2;
		value = 1;
		displayName = "$STR_MN_HAND_GRENADE_EAST";
		picture = "\CA\weapons\data\equip\m_RGD5_ca.paa";
		type = 256;
		ammo = "RegularArrow";
		count = 300;
		initSpeed = 100;
		nameSound = "";
		maxLeadSpeed = 7;
		descriptionShort = "$STR_DSS_HandGrenade";
	};
	class 300Rnd_FastArrows: CA_Magazine
	{
		scope = 2;
		value = 1;
		displayName = "$STR_MN_HAND_GRENADE_EAST";
		picture = "\CA\weapons\data\equip\m_RGD5_ca.paa";
		type = 256;
		ammo = "FastArrow";
		count = 300;
		initSpeed = 160;
		nameSound = "";
		maxLeadSpeed = 50;
		descriptionShort = "$STR_DSS_HandGrenade";
	};	
	class 300Rnd_ExplosiveArrows: CA_Magazine
	{
		scope = 2;
		value = 1;
		displayName = "$STR_MN_HAND_GRENADE_EAST";
		picture = "\CA\weapons\data\equip\m_RGD5_ca.paa";
		type = 256;
		ammo = "ExplosiveArrow";
		count = 300;
		initSpeed = 60;
		nameSound = "";
		maxLeadSpeed = 7;
		descriptionShort = "$STR_DSS_HandGrenade";	
	};
	class 300Rnd_FlameArrows: CA_Magazine
	{
		scope = 2;
		value = 1;
		displayName = "$STR_MN_HAND_GRENADE_EAST";
		picture = "\CA\weapons\data\equip\m_RGD5_ca.paa";
		type = 256;
		ammo = "FlameArrow";
		count = 300;
		initSpeed = 50;
		nameSound = "";
		maxLeadSpeed = 7;
		descriptionShort = "$STR_DSS_HandGrenade";
	};
};


// ===========================================================================
// AMMO
// ===========================================================================


class CfgAmmo
{
    class Default;
	class BulletBase;
	class Grenade;
	class RegularArrow: BulletBase
	{
		typicalspeed = 100;
		visibleFire = 0;
		audibleFire = 0;
		visibleFireTime = 0;
		fuseDistance = 0;
		hit = 6;
		indirectHit = 0;
		indirectHitRange = 0;
		model = "\FLAY\FLAY_Archery\FLAY_Arrow_Broadhead.p3d";
		CraterEffects = "NoCrater";
		explosionEffects = "NoExplosion";
		explosive = 0;
		cost = 1;
		whistleDist = 0;
		simulation = "shotShell";
		deflecting = 0;
		airFriction = -0.0006;
		caliber = 0.5;
	};
	
	class FastArrow: RegularArrow
	{
		typicalspeed = 150;
		deflecting = 10;
		hit = 5;
		caliber = 0.05;
		airFriction = -0.0003;
	};
	
	class ExplosiveArrow: Grenade
	{
		soundHit[] = {"Ca\sounds\Weapons\explosions\grenade_new1",3.1622777,1,200};
		model = "\FLAY\FLAY_Archery\FLAY_Arrow_Broadhead.p3d";
		typicalspeed = 60;
		visibleFire = 0;
		audibleFire = 0;
		visibleFireTime = 0;
		fuseDistance = 0;
		hit = 16;
		indirectHit = 8;
		indirectHitRange = 2;
		cost = 1;
		whistleDist = 0;
		airFriction = -0.00105;
		CraterEffects = "NoCrater";
		explosionEffects = "ArrowExplosion";
		explosive = 1;
	};
	
	class FlameArrow: Grenade
	{
		model = "\FLAY\FLAY_Archery\FLAY_Arrow_Broadhead.p3d";
		typicalspeed = 60;
		visibleFire = 0;
		audibleFire = 0;
		visibleFireTime = 0;
		fuseDistance = 0;
		hit = 10;
		indirectHit = 5;
		indirectHitRange = 3;
		cost = 1;
		whistleDist = 0;
		simulation = "shotSmoke";
		explosionTime = 0.001;
		timeToLive = 15;
		smokeColor[] = {1,1,1,1};
		effectsSmoke = "FlameArrow";
		airFriction = -0.00205;
	};
	
	// FIXME: This should be changed to an impact effect.
	class FLAY_Blood: Grenade
	{
		model = "\ca\weapons\empty";
		typicalspeed = 0;
		visibleFire = 0;
		audibleFire = 0;
		visibleFireTime = 0;
		fuseDistance = 0;
		hit = 0;
		indirectHit = 0;
		indirectHitRange = 0;
		cost = 1;
		whistleDist = 0;
		simulation = "shotSmoke";
		explosionTime = 0.001;
		timeToLive = 15;
		smokeColor[] = {1,1,1,1};
		effectsSmoke = "FLAY_BloodEffect";
		airFriction = 0;
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
		ResetGesture[] = {"ResetGesture","Gesture"};
		BowStandGesture[] = {"BowStandGesture","Gesture"};
		BowAimGesture[] = {"BowAimGesture","Gesture"};
		BowAim1Gesture[] = {"BowAim1Gesture","Gesture"};
		BowAim = "BowAim";
	};
};

class CfgMovesMaleSdr: CfgMovesBasic
{
	class Default;
	class States
	{
		class AmovPercMstpSrasWrflDnon;
		class BowAim: AmovPercMstpSrasWrflDnon
		{
			file = "\FLAY\FLAY_Archery\anims\bowaim1.rtm";
			actions = "RifleStandActions";
			looped = 0;
			speed = 0.5;
			weaponIK = 0;
			legs = "aimingUpDefault";
		};		
	};
};


// ===========================================================================
// GESTURES
// ===========================================================================


class CfgGesturesMale
{
	class Default;
	class States
	{
		class BowStandGesture: Default
		{
			file = "\FLAY\FLAY_Archery\anims\bowstand.rtm";
			looped = 0;
			speed = 0;
			//mask = "handsWeapon";
			interpolateTo[] = {"BowAimGesture",1};
			interpolateWith[] = {"BowAimGesture",1};
			disableWeapons = 1;
			mask = "upperTorso";
			headBobStrength = 0;
			headBobMode = 0;
			leftHandIKCurve[] = {0};
			rightHandIKCurve[] = {0};			
		};
		class BowAimGesture: Default
		{
			file = "\FLAY\FLAY_Archery\anims\bowaim.rtm";
			looped = 0;
			speed = 2.0;
			terminal = 1;
			mask = "handsWeapon";
			//mask = "upperTorso";
			interpolateTo[] = {"BowStandGesture", 1,"BowAim1Gesture", 1};
			interpolateFrom[] = {"BowStandGesture", 1};
			disableWeapons = 0;
			headBobStrength = 0;
			headBobMode = 0;
			leftHandIKCurve[] = {0};
			rightHandIKCurve[] = {0};			
		};
		class BowAim1Gesture: Default
		{
			file = "\FLAY\FLAY_Archery\anims\bowaim1.rtm";
			looped = 1;
			speed = 0;
			mask = "handsWeapon";
			//mask = "upperTorso";
			interpolateTo[] = {"BowStandGesture", 1};
			interpolateFrom[] = {"BowStandGesture", 1};
			disableWeapons = 0;
			leftHandIKCurve[] = {0};
			rightHandIKCurve[] = {0};			
		};
		// This is used to reset the animation to default posture 
		// after an looped gesture.
		class ResetGesture: Default
		{
			file = "";
			looped = 0;
			speed = 1000;
			mask = "BodyFull";
			leftHandIKCurve[] = {0};
			rightHandIKCurve[] = {0};
		};
	};
};


// ===========================================================================
// PARTICLE EFFECTS
// ===========================================================================


class ArrowExplosion
{
	class Light1
	{
		simulation = "light";
		type = "GrenadeExploLight";
		position[] = {0,0,0};
		intensity = 0.0001;
		interval = 1;
		lifeTime = 1;
	};
	class GrenadeExp1
	{
		simulation = "particles";
		type = "ArrowExp";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class GrenadeSmoke1
	{
		simulation = "particles";
		type = "ArrowSmoke";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
};

class FlameArrow {
	class FlameArrow {
		simulation = "particles";
		type = "FlameArrow";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 0.01;
		lifeTime = 10;
	};
};

class ArrowTrailSmoke {
	// FIXME: Currently not used.
	// Need to figure out how to add particle effects to 
	// regular (i.e. non-smoke) shells.
	class ArrowTrailSmoke {
		simulation = "particles";
		type = "ArrowTrailSmoke";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 0.01;
		lifeTime = 2;
	};
};

class FLAY_BloodEffect {
	// FIXME: This should be an impact effect.
	class BloodSpray {
		simulation = "particles";
		type = "FLAY_BloodParticles";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 0.01;
		lifeTime = 10;
	};
};

class CfgCloudlets
{
	access = 0;
	class Default;
	class FlameArrow: Default
	{
		animationSpeedCoef = 1;
		colorCoef[] = {"colorR","colorG","colorB","colorA"};
		sizeCoef = 1;
		position[] = {0,0,0};
		interval = "0.001";
		circleRadius = 0;
		circleVelocity[] = {0,0,0};
		particleShape = "\Ca\Data\ParticleEffects\Universal\Universal";
		particleFSNtieth = 16;
		particleFSIndex = 7;
		particleFSFrameCount = 48;
		particleFSLoop = 1;
		angleVar = 0.1;
		animationName = "";
		particleType = "Billboard";
		timerPeriod = 1;
		lifeTime = "20";
		moveVelocity[] = {0.2,0.1,0.1};
		rotationVelocity = 1;
		weight = 1;
		volume = 1;
		rubbing = 0.015;
		size[] = {0.1,2,4};
		color[] = {
			{ 0.9,0.9,0.9,0.2 },
			{ 0.9,0.9,0.9,0.05 },
			{ 0.9,0.9,0.9,0 }};
		animationSpeed[] = {0.5,0.1};
		randomDirectionPeriod = 1;
		randomDirectionIntensity = 0.04;
		onTimerScript = "";
		beforeDestroyScript = "";
		lifeTimeVar = 3;
		positionVar[] = {0,0,0};
		MoveVelocityVar[] = {0.25,0.25,0.25};
		rotationVelocityVar = 20;
		sizeVar = 0.5;
		colorVar[] = {0,0,0,0.35};
		randomDirectionPeriodVar = 0;
		randomDirectionIntensityVar = 0;
	};
	class ArrowTrailSmoke: Default
	{
		animationSpeedCoef = 1;
		colorCoef[] = {"colorR","colorG","colorB","colorA"};
		sizeCoef = 1;
		position[] = {0,0,0};
		interval = "0.001";
		circleRadius = 0;
		circleVelocity[] = {0,0,0};
		particleShape = "\Ca\Data\ParticleEffects\Universal\Universal";
		particleFSNtieth = 16;
		particleFSIndex = 13;
		particleFSFrameCount = 3;
		particleFSLoop = 0;
		angleVar = 0;
		animationName = "";
		particleType = "Billboard";
		timerPeriod = 1;
		lifeTime = "2";
		moveVelocity[] = {0,0,0};
		rotationVelocity = 0;
		weight = 1.033;
		volume = 0.79;
		rubbing = 0.18;
		size[] = {0.25,0.05};
		color[] = {
			{ 1.0,1.0,1.0,0.10 },
			{ 1.0,1.0,1.0,0.30 },
			{ 1.0,1.0,1.0,0 }};
		animationSpeed[] = {1000,1000};
		randomDirectionPeriod = 100;
		randomDirectionIntensity = 0.01;
		onTimerScript = "";
		beforeDestroyScript = "";
		lifeTimeVar = 360;
		positionVar[] = {0,0,0};
		MoveVelocityVar[] = {0,0,0};
		rotationVelocityVar = 0;
		sizeVar = 0;
		colorVar[] = {0,0,0,0};
		randomDirectionPeriodVar = 0;
		randomDirectionIntensityVar = 0;
	};
	class ArrowExp: Default
	{
		interval = 0.1;
		circleRadius = 0;
		circleVelocity[] = {0,0,0};
		particleShape = "\ca\Data\ParticleEffects\Universal\Universal";
		particleFSNtieth = 16;
		particleFSIndex = 0;
		particleFSFrameCount = 32;
		particleFSLoop = 0;
		angleVar = 1;
		animationName = "";
		particleType = "Billboard";
		timerPeriod = 1;
		lifeTime = 1;
		moveVelocity[] = {0,0,0};
		rotationVelocity = 0;
		weight = 10;
		volume = "intensity";
		rubbing = 0.1;
		size[] = {"8*intensity","8*intensity"};
		color[] = {
			{ 1,1,1,-1 },
			{ 1,1,1,0 }};
		animationSpeed[] = {1};
		randomDirectionPeriod = 0.2;
		randomDirectionIntensity = 0.2;
		onTimerScript = "";
		beforeDestroyScript = "";
		lifeTimeVar = 0;
		positionVar[] = {0.1,0.1,0.1};
		MoveVelocityVar[] = {0,0,0};
		rotationVelocityVar = 90;
		sizeVar = 0.1;
		colorVar[] = {0,0,0,0};
		randomDirectionPeriodVar = 0;
		randomDirectionIntensityVar = 0;
	};
	class ArrowSmoke: Default
	{
		interval = "0.014 * interval + 0.014";
		circleRadius = 0;
		circleVelocity[] = {0,0,0};
		particleShape = "\ca\Data\ParticleEffects\Universal\Universal";
		particleFSNtieth = 16;
		particleFSIndex = 7;
		particleFSFrameCount = 48;
		particleFSLoop = 1;
		angleVar = 1;
		animationName = "";
		particleType = "Billboard";
		timerPeriod = 1;
		lifeTime = 1;
		moveVelocity[] = {0.05,0.05,0.05};
		rotationVelocity = 0;
		weight = 0.053;
		volume = 0.04;
		rubbing = 0.2;
		size[] = {"6*intensity", "6*intensity ", "6*intensity", "6*intensity"};
		color[] = {
			{ 0.5,0.5,0.5,1 },
			{ 0.8,0.8,0.8,0.5 },
			{ 0.9,0.9,0.9,0.25 },
			{ 1,1,1,0 }};
		animationSpeed[] = {1.7,0.6,0.4,0.3,0.3};
		randomDirectionPeriod = 0.2;
		randomDirectionIntensity = 0.2;
		onTimerScript = "";
		beforeDestroyScript = "";
		lifeTimeVar = 3;
		positionVar[] = {0.1,0.15,0.1};
		MoveVelocityVar[] = {0.05,0.05,0.05};
		rotationVelocityVar = 30;
		sizeVar = 0.1;
		colorVar[] = {0,0,0,0};
		randomDirectionPeriodVar = 0.5;
		randomDirectionIntensityVar = 0.02;
	};
	class FLAY_BloodParticles: Default
	{
		animationSpeedCoef = 1;
		colorCoef[] = {"colorR","colorG","colorB","colorA"};	
		sizeCoef = 1;
		interval = "0.01";
		position[] = {0,0,0};
		circleRadius = 0;
		circleVelocity[] = {0,0,0};
		particleShape = "\ca\Data\ParticleEffects\Universal\Universal";
		particleFSNtieth = 16;
		particleFSIndex = 13;
		particleFSFrameCount = 1;
		particleFSLoop = 0;
		angleVar = 360;
		animationName = "";
		particleType = "Billboard";
		timerPeriod = 1;
		lifeTime = 1;
		moveVelocity[] = {0.1,0.1,0.1};
		rotationVelocity = 1;
		weight = 0.165;
		volume = 0.1;
		rubbing = 0.05;
		size[] = {0.1,0.015};
		color[] = {
			{ 0.5,0.5,0.5,1 },
			{ 0.5,0.5,0.5,0 }};
		animationSpeed[] = {0.1};
		randomDirectionPeriod = 0;
		randomDirectionIntensity = 0;
		onTimerScript = "";
		beforeDestroyScript = "";
		lifeTimeVar = 0.1;
		positionVar[] = {0.0,0.0,0.0};
		MoveVelocityVar[] = {0.1,0.1,0.1};
		rotationVelocityVar = 1;
		sizeVar = 0.25;
		colorVar[] = {0,0,0,0.2};
		randomDirectionPeriodVar = 0;
		randomDirectionIntensityVar = 0;
	};	
};
//};
