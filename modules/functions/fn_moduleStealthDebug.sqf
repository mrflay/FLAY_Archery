/* knowsabout.sqf
 * 
 * This script visualizes what the AI knowsabout other units. Add a gamelogic and put the following in the init field.
 *
 * Usage: [(<unit>),(<reverse>)] execVM "knowsabout.sqf"
 *
 *      <unit>: (optional) When player is not pointing at any unit, show what all other AI units know about this unit (default is player).
 *   <reverse>: (optional) If true show what selected unit knowsabout all other units, otherwise display what all other units know about selected unit.
 */

#define DECIMAL(x,n) (str(round((x)*(10^(n)))/(10^(n))))

 // display what all other unit knowsabout this unit, when player is not pointing at another unit.
FLAY_debug_KnowsAboutUnit = [_this,0,player,[objNull]] call bis_fnc_param;

// if true display what selected unit knowsabout all other units, otherwise display what all other unit knowsabout unit.
FLAY_debug_KnowsAbout = [_this,1,false,[true]] call bis_fnc_param; 

// register key handler, when display is ready (shift key toggles FLAY_debug_KnowsAbout on/off).
[] spawn { 
	waitUntil { !isNull findDisplay 46 };
	(findDisplay 46) displayAddEventHandler ["KeyUp", "if ((_this select 1) in [0x2A,0x36]) then { FLAY_debug_KnowsAbout = !FLAY_debug_KnowsAbout; };"];
};

onEachFrame {

	private ["_unit", "_x", "_rgba"];
	
	_unit = FLAY_debug_KnowsAboutUnit;

	if (cursorTarget isKindOf "Man") then {
		{
			// display what the unit the player is pointing at knowsabout all other units.
			if (FLAY_debug_KnowsAbout) then {
				_rgba = [0,0,1,1];
				if ((cursorTarget knowsAbout _x) > 0) then
				{
					drawLine3D [ASLtoATL(eyePos _x), ASLtoATL (eyePos cursorTarget), _rgba];      
				};				
				if (_x != cursorTarget && (cursorTarget knowsAbout _x) > 0) then
				{ 
					drawIcon3D ["\a3\ui_f\data\gui\cfg\Hints\icon_text\group_1_ca.paa", _rgba, ASLtoATL (eyepos _x), 1, 1, 45, DECIMAL(cursorTarget knowsAbout _x, 1), 0, 0.025, "puristaLight"];
				};				
			} else {
				// display what all other AI knowsabout the unit the player is pointing at.
				_rgba = [0,1,0,1];
				if (side _x != side cursorTarget) then 
				{
					_rgba = [1,0,0,1];
				};
				if ((_x knowsAbout cursorTarget) > 0) then
				{
					drawLine3D [ASLtoATL(eyePos _x), ASLtoATL (eyePos cursorTarget), _rgba];      
				};				
				if (_x != cursorTarget && (_x knowsAbout cursorTarget) > 0) then
				{ 
					drawIcon3D ["\a3\ui_f\data\gui\cfg\Hints\icon_text\group_1_ca.paa", _rgba, ASLtoATL (eyepos _x), 1, 1, 45, DECIMAL(_x knowsAbout cursorTarget, 1), 0, 0.025, "puristaLight"];
				};				
			};
		} forEach allUnits;  	
	} else {
		// if player is not pointing at a unit, display what all AI units knowsabout the specified unit (by default player)
		{
			if (_x != _unit && (_x knowsAbout _unit) > 0) then
			{
				_rgba = [0,1,0,1];
				if (side _x != side _unit) then 
				{
					_rgba = [1,0,0,1];
				};				
				drawIcon3D ["\a3\ui_f\data\gui\cfg\Hints\icon_text\group_1_ca.paa", _rgba, ASLtoATL (eyepos _x), 1, 1, 45, DECIMAL(_x knowsAbout _unit, 1), 0, 0.025, "puristaLight"];
			};
		} forEach allUnits;
	};
};
