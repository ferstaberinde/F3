// F3 - Curator Add Addons
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private ["_curator","_mode","_addons","_cfgPatches","_class"];

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_curator = [_this,0,objNull,[objNull]] call bis_fnc_param;
_mode = [_this,1,true,["",true,[]]] call bis_fnc_param;

// ====================================================================================

// Decide which addons to add based on passed mode
_addons = [];
switch (typeName _mode) do {
	case "ARRAY": {_addons = _mode};
	case "STRING": {_addons = [_mode]};
	case "BOOLEAN": {
		// If true was passed, add all available addons to curator list
		_cfgPatches = configfile >> "cfgpatches";
		for "_i" from 0 to (count _cfgPatches - 1) do {
			_class = _cfgPatches select _i;
			if (isclass _class) then {_addons set [count _addons,configname _class];};
		};
	};
};

// Enable addons to the curator
_curator addcuratoraddons _addons;