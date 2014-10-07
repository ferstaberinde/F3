// F3 - Curator Add Addons
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private ["_curator","_mode","_objects","_getGlobalVars"];

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_curator = [_this,0,objNull,[objNull]] call bis_fnc_param;
_mode = [_this,1,true,[true,[],side]] call bis_fnc_param;

// ====================================================================================

// Decide which objects to add based on passed mode

_objects = [];
switch (typeName _mode) do {
	case "ARRAY": {_objects = _mode};
	case "OBJECT": {_addons = [_mode]};
	case "SIDE": {
		_getGlobalVars = [0] execVM "f\common\f_setLocalVars.sqf";
		waitUntil {scriptDone _getGlobalVars;sleep 0.1};

		_objects = switch (_mode) do {
			case west: {f_var_units_BLU};
			case blufor: {f_var_units_BLU};
			case east: {f_var_units_OPF};
			case opfor: {f_var_units_OPF};
			case resistance: {f_var_units_RES};
			case independent: {f_var_units_RES};
			case civilian: {f_var_units_CIV};
		};
	};
	case "BOOL" {_objects = (vehicles+allUnits)};
};

// Add all selected objects to curator lists
_curator addCuratorEditableObjects [_objects,true];