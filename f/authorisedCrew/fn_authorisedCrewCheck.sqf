// F3 - Authorised Crew Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_warningMsg","_restrictedTypes","_restrictedUnits"];

// ====================================================================================

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

params [
	["_fromEH", [], [[]]],
	["_restrictedList", [], [[]]],
	["_restrictcargo", false, [false]]
];

_fromEH params [
	["_vehicle", objNull, [objNull]],
	["_vehicleRole", "", [""]],
	["_unitToCheck", objNull, [objNull]]
];

_warningMsg = localize "STR_f_UnauthorisedCrew_Warning";

// DEBUG
if (f_param_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\authorisedCrew\f_isAuthorisedCrew.sqf): _fromEH = %1",_fromEH];
	player sideChat format ["DEBUG (f\authorisedCrew\f_isAuthorisedCrew.sqf): _vehicle = %1",_vehicle];
	player sideChat format ["DEBUG (f\authorisedCrew\f_isAuthorisedCrew.sqf): _vehicleRole = %1",_vehicleRole];
	player sideChat format ["DEBUG (f\authorisedCrew\f_isAuthorisedCrew.sqf): _unitToCheck = %1",_unitToCheck];
	player sideChat format ["DEBUG (f\authorisedCrew\f_isAuthorisedCrew.sqf): _warningMsg = %1",_warningMsg];
};

// ====================================================================================

// PERFORM CHECKS I
// We do not need to perform all of this script on all clients simulaneously, so if
// the unit triggering the the event handler is local to another client or entering the vehicle in a cargo slot, we exit the
// script.

if !(local _unitToCheck) exitWith {};
if (_vehicleRole == "CARGO" && !_restrictcargo) exitWith {};

// ====================================================================================

// INTERPRET RESTRICTED ARRAY
// Loop through the array containing the allowed classes and units and split them into two

_restrictedTypes = _restrictedList select {_x isEqualType ""};
_restrictedUnits = _restrictedList select {_x isEqualType objNull};

// ====================================================================================

// PERFORM CHECKS II
// Check if the unit is one of the allowed units or in the allowed types, if not, eject it from the vehicle.

if (_unitToCheck in _restrictedUnits || ({_unitToCheck isKindOf _x} count _restrictedTypes == 1)) exitWith {};

["UnauthorisedCrew",[_warningMsg]] call BIS_fnc_showNotification;
_unitToCheck action ["getout",_vehicle];
