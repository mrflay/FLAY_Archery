private ["_arrows","_target","_caller","_id"];

_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_arrows = (position player) nearObjects ["FLAY_Arrow", 4];
{ 
	_arrow = _x;
	_magazine = _arrow getVariable ["flay.archery.arrow.magazine","FLAY_1Rnd_Arrow"];
	// fixme: temporarily convert quiver magazines to regular magazines
	switch (_magazine) do {
		case "FLAY_7Rnd_Arrow": {_magazine = "flay_1rnd_arrow"};
		case "FLAY_7Rnd_PrecisionArrow": {_magazine = "flay_1rnd_precisionarrow"};
		case "FLAY_7Rnd_BroadheadArrow": {_magazine = "flay_1rnd_broadheadarrow"};
		case "FLAY_7Rnd_ExplosiveArrow": {_magazine = "flay_1rnd_explosivearrow"}; // shouldn't happen
	};
	player addMagazine (_magazine);
	// clear near targets
	_targets = (position _arrow) nearObjects ["FLAY_Target_FITA_122", 2];
	{
		_target = _x;
		_target setVariable ["FLAY.archery.target.state.hits", []];
		_target setVariable ["FLAY.archery.target.state.sequence", -1];
	} forEach _targets;
	deleteVehicle _arrow; 
} forEach _arrows;

player setVariable ["flay.archery.state.takeArrowsId", -1];
player removeAction _id;


