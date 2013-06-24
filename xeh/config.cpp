class CfgPatches
{
	class FLAY_Archery_XEH
	{
		requiredaddons[] = {"FLAY_Archery","cba_xeh"};
		requiredversion = 0.1;
		units[] = {};
	};
};

class Extended_PreInit_EventHandlers
{
  class FLAY_Archery_PreInits
    {
        init = "[] execVM 'FLAY\FLAY_Archery\xeh\pre_init.sqf'";
        //serverInit = "[] execVM 'FLAY\FLAY_Archery\xeh\server_preinit.sqf'";
        //clientInit = "[] execVM 'FLAY\FLAY_Archery\xeh\client_preinit.sqf'";
    };
};

class Extended_PostInit_EventHandlers
{
	class FLAY_Archery_PostInits
    {
        init = "[] execVM 'FLAY\FLAY_Archery\xeh\post_init.sqf'";
        //serverInit = "[] execVM 'FLAY\FLAY_Archery\xeh\server_postinit.sqf'";
        //clientInit = "[] execVM 'FLAY\FLAY_Archery\xeh\client_postinit.sqf'";
    };	
};

class Extended_Init_EventHandlers
{
    class Man
    {
		onRespawn = 1;
        FLAY_Man_init = "_this execVM 'FLAY\FLAY_Archery\xeh\player_init.sqf'";
    };
};

// Note: when adding fired event hanlder using config the
// 6:th argument (projectile) is a string rather than and
// not an object.
//class Extended_Fired_Eventhandlers
//{
//    class Man
//    {
//        class FLAY_Man_fired
//        {
//			fired = "_this call FLAY_EH_BowFired";
//		};
//	};
//};