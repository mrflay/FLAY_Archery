class CfgPatches
{
	class FLAY_Archery_Module
	{
		requiredaddons[] = {"FLAY_Archery","A3_Modules_F"};
		requiredversion = 0.1;
		units[] = {"FLAY_ModuleArchery"};
	};
};

class CfgFunctions
{
	class FLAY_Modules
	{
		tag = "FLAY";
		class Archery
		{
			file = "FLAY\FLAY_Archery\modules\functions";
			class moduleArcheryPreInit
			{
				preInit = 1;
			};					
			class moduleArcheryPostInit
			{
				postInit = 1;
			};			
			class moduleArcheryInit
			{
				//ext = ".fsm";
			};
		};
		class Stealth
		{
			file = "FLAY\FLAY_Archery\modules\functions";
			class moduleStealth{};			
			class moduleStealthDebug{};
		};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class FLAY: NO_CATEGORY
	{
		displayName = "FLAY";
	};
};

class CfgVehicles 
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
			class Units;
		};
		class ModuleDescription;
	};
	class FLAY_ModuleArchery: Module_F
	{
		scope = 1;
		displayName = "Archery";
		category = "FLAY";
		author = "mrflay";
		function = "FLAY_fnc_moduleArcheryInit";
		isGlobal = 1;
		isPersistent = 1;
		isTriggerActivated = 0;
		class Arguments
		{
		};
		class ModuleDescription: ModuleDescription
		{
			description = "";
		};
	};
	class FLAY_ModuleStealth: Module_F
	{
		scope = 2;
		displayName = "Stealth";
		category = "FLAY";
		author = "mrflay";
		function = "FLAY_fnc_moduleStealth";
		isGlobal = 0;
		isPersistent = 0;
		isTriggerActivated = 0;
		class Arguments: ArgumentsBaseUnits
		{
			class Units: Units{};
			class Debug
  			{
				displayName = "Debug";
				description = "Enable debugging"; 
				typeName = "BOOL";
				class values
				{
					class Yes
					{
						name = "$STR_lib_info_yes";
						value = 1;
					};
					class No
					{
						name = "$STR_lib_info_no";
						value = 0;
						default = 1;
					};
				};
			};			
		};
		class ModuleDescription: ModuleDescription
		{
			description = "";
		};
	};
};

