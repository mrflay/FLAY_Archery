private ["_unit", "_animate", "_next", "_magazines", "_magazines", "_muzzle", "_weapon", "_items"];
private ["_state", "_nextWeapon", "_nextState", "_autoLoadMagazine", "_reloadAction", "_unloadAction"];

_unit = player;
_next = _this select 0;
_animate = true;

if (count _this > 1) then {
	_animate = _this select 1;
};

_magazines = magazines _unit;
_magazine = currentMagazine _unit;
_weapon = currentWeapon _unit;
_muzzle = currentMuzzle _unit;
_items = primaryWeaponItems _unit;

_state = getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> "state");
_nextWeapon =  getText (configFile >> "CfgWeapons" >> _weapon >> "FLAY_BowInfo" >> _next);
_nextState =  getText (configFile >> "CfgWeapons" >> _nextWeapon >> "FLAY_BowInfo" >> "state");
_autoLoadMagazine = getNumber (configFile >> "CfgWeapons" >> _nextWeapon >> "FLAY_BowInfo" >> "load") > 0;

// transition animations
_reloadAction =  getText (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "reloadAction");
_unloadAction =  getText (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "unloadAction");

if (_next == "next" and _animate) then {
	_unit playActionNow _reloadAction;
};

if (_next == "prev" and _animate) then {
	_unit playActionNow _unloadAction;
};

if (_state == "empty" and _nextState == "loaded" and _animate) then {
	sleep 0.5; // play animation for 0.5 seconds and then continue
};

_unit removeWeapon _weapon;
{ _unit removeMagazines _x; } forEach _magazines; // ensures that weapon is not auto loaded

if (_nextState == "empty") then {
	// add weapon first
	_unit addWeapon _nextWeapon;
	_unit selectWeapon _muzzle;
	// add magazines
	{ _unit addMagazine _x; } forEach _magazines;
	if (_magazine != "") then {
		_unit addMagazine _magazine;
	};
};

if (_nextState == "loaded") then {
	
	// reload
	if (_state == "empty") then {
		{ _unit addMagazine _x; } forEach _magazines;
		// add weapon
		_unit addWeapon _nextWeapon;
		_unit selectWeapon _muzzle;			
	};
	
	// unload
	if (_state == "drawn") then {
		// add loaded magazine first
		_unit addMagazine _magazine;
		// add weapon
		_unit addWeapon _nextWeapon;
		_unit selectWeapon _muzzle;	
		// add remaining magazines
		{ _unit addMagazine _x; } forEach _magazines;
	};
	
	// ensure the arrow point is updated according to loaded magazine
	_magazine = currentMagazine _unit;
	_magazineHasPoint = isText (configFile >> "CfgMagazines" >> _magazine >> "FLAY_Point");
	if (_magazineHasPoint) then {
		_magazinePoint = getText (configFile >> "CfgMagazines" >> _magazine >> "FLAY_Point");
		if (_magazinePoint != "") then {
			_unit addPrimaryWeaponItem _magazinePoint;
		} else {
			_currentPoint = _items select 0;
			_unit removePrimaryWeaponItem _currentPoint;
		};
		//_currentPoint = _items select 0;
		//if (_currentPoint == "") then {
		//	_unit addItem _magazinePoint;
		//};	
	};
};

if (_nextState == "drawn") then {
	// add the currently loaded magazine first
	if (_magazine != "") then {
		_unit addMagazine _magazine;
	};
	// add weapon
	_unit addWeapon _nextWeapon;
	_unit selectWeapon _muzzle;
	// add remaining magazines
	{ _unit addMagazine _x; } forEach _magazines;
};

// add point to inventory before removing it
if (_state == "loaded" and _nextState == "empty") then {
	_point = _items select 0;
	//if (_point != "") then {
	//	_unit addItem _point;
	//};
};

// drop the arrow point when bow is fired
if (_nextState == "empty") then {
	_items = [_items select 1, _items select 2];
};

// add all attachments
{ if (_x != "") then { player addPrimaryWeaponItem _x; }; } forEach _items;

// let the bow stay drawn for a short period before returning to empty bow state.
if (_currentState == "drawn" and _next == "empty" and _animate) then {
	sleep 0.25; // temporary for testing
	_unit playActionNow _reloadAction; // when drawn reloadAction is the fire animation
};	