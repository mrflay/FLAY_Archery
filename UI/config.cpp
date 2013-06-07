
class CfgPatches
{
	class FLAY_Archery_UI
	{
		units[] = {};
		requiredVersion = 0.1;
		//requiredAddons[] = {"CAData","CAUI"};
		requiredAddons[] = {};
	};
};


// ===========================================================================
// DIALOGS
// ===========================================================================

#define HINT(BTN) ("hint " + BTN)

class RscText;
class RscPicture;
class RscStructuredText;
class FLAY_FitaHitMark: RscPicture
{
	x = 0;
	y = 0;
	w = 0.02;
	h = 0.02 * 4 / 3;
	//text = "\tb_arifle_hkump45\ui\FITA_marker_ca.paa";
};

class RscTitles
{
	class FLAY_Default
	{
		idd = -1;
		movingEnable = 0;
		duration = 0;
		fadein = 0;
		fadeout = 0;
	};
	class FLAY_RscFITA122
	{
		idd = -1;
		enableSimulation=1;
		movingEnable=1;
		duration = 1e+011;
		fadein = 0;
		onLoad = "uinamespace setvariable ['FLAY_RscFITA122',_this select 0];";
		onUnload = "uinamespace setvariable ['FLAY_RscFITA122',nil];";
		class ControlsBackground
		{
			class Background: RscPicture {
				idc = 3000;
				style = 48;
				
				x = "(call compile (profilenamespace getvariable ['IGUI_GRID_FITA_X',str (safezoneX + 0.01)]))";
				y = "(call compile (profilenamespace getvariable ['IGUI_GRID_FITA_Y',str (safezoneY + safezoneH - (0.25 * 4 / 3) - 0.01)]))";
				w = "(call compile (profilenamespace getvariable ['IGUI_GRID_FITA_W',str (0.25)]))";
				h = "(call compile (profilenamespace getvariable ['IGUI_GRID_FITA_H',str (0.25 * 4 / 3)]))";

				text = "\tb_arifle_hkump45\ui\FITA_122_ca.paa";
				color[] = {1, 1, 1, 0.5};
				colorActive[] = {1, 1, 1, 0};
				colorBackground[] = {1,1,1,0.5};
				colorText[] = {1,1,1,1};
				colorSelection[] = {0,0,0,0.4};
				colorBar[] = {0,0,0,1};
				colorFrame[] = {0,0,0,1};
			};
		};
		class Controls {
			class Hit_1: FLAY_FitaHitMark {
				idc = 3002;
			};
			class Hit_2: FLAY_FitaHitMark {
				idc = 3003;
			};
			class Hit_3: FLAY_FitaHitMark {
				idc = 3004;
			};
			class Hit_4: FLAY_FitaHitMark {
				idc = 3005;
			};
			class Hit_5: FLAY_FitaHitMark {
				idc = 3006;
			};
			class Hit_6: FLAY_FitaHitMark {
				idc = 3007;
			};
			class Hit_7: FLAY_FitaHitMark {
				idc = 3008;
			};
			class Hit_8: FLAY_FitaHitMark {
				idc = 3009;
			};
			class Hit_9: FLAY_FitaHitMark {
				idc = 3010;
			};
			class Hit_10: FLAY_FitaHitMark {
				idc = 3011;
			};
			class Hit_11: FLAY_FitaHitMark {
				idc = 3012;
			};
			class Hit_12: FLAY_FitaHitMark {
				idc = 3013;
			};
			class Hit_13: FLAY_FitaHitMark {
				idc = 3014;
			};
			class Hit_14: FLAY_FitaHitMark {
				idc = 3015;
			};
			class Hit_15: FLAY_FitaHitMark {
				idc = 3016;
			};
			class Hit_16: FLAY_FitaHitMark {
				idc = 3017;
			};
			class Hit_17: FLAY_FitaHitMark {
				idc = 3018;
			};
			class Hit_18: FLAY_FitaHitMark {
				idc = 3019;
			};
			class Hit_19: FLAY_FitaHitMark {
				idc = 3020;
			};
			class Hit_20: FLAY_FitaHitMark {
				idc = 3021;
			};
			class Name: RscText {
				idc = 3022;
				colorText[] = {1,1,1,1};
				x = safezoneX + 0.04;
				y = safezoneY + safezoneH - (0.4 * 4 / 3) - 0.04;
				shadow = 1;
			};
			class TScore: RscStructuredText {
				idc = 3023;
				colorText[] = {1,1,1,1};
				x = safezoneX + 0.04 + 0.35;
				y = safezoneY + safezoneH - (0.4 * 4 / 3) - 0.04 + 0.05;
				class Attributes
				{
					align = "right";
					font = "PuristaMedium";
					shadow = 1;
					size = 1;				
				};
			};
			class Hits: RscStructuredText {
				idc = 3024;
				colorText[] = {1,1,1,1};
				x = safezoneX + 0.04 + 0.35;
				y = safezoneY + safezoneH - (0.4 * 4 / 3) - 0.04;
				class Attributes
				{
					align = "right";
					font = "TahomaB";
					shadow = 1;
					size = 1;
				};
			};
		};
	};
};