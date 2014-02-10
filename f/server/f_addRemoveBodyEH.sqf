// F3 - Automatic Body Removal
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN THE SCRIPT ONLY SERVER SIDE AND ON HEADLESS CLIENT

if (!isServer && hasInterface) exitWith {};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_men","_str_Men","_handle"];

// ====================================================================================

// SET KEY VARIABLES
// Using a common variable, we will create an array containing all men, minus playable units.

_men = allUnits - playableUnits;

// DEBUG
if (f_var_debugMode == 1) then
{
	_str_men = str _men;
	player sideChat format ["DEBUG (f\common\f_addRemoveBodyEH.sqf): _men = %1",_str_men];
};

// ====================================================================================

// PREVENT UNTIS FROM BEING REMOVED
// All units in the corresponding array are flagged to never be removed
if (isNil "f_doNotRemoveBodies") then {f_doNotRemoveBodies = []};

{
	if (!isNil format ["%1",_x]) then {_x setVariable ["f_removeBodyEH",true];};
} forEach f_doNotRemoveBodies;

// ====================================================================================

// ADD EVENT HANDLER
// A killed event handler is added to all units in the array _men that are not part of the exempt group

{
_handle = _x getVariable ["f_removeBodyEH",false];
if !(_handle && local _x) then {
	_x addEventHandler ["killed", {(_this select 0) spawn f_fnc_removeBody}];
	_x setVariable ["f_removeBodyEH",true];
	};
} forEach _men;


// ====================================================================================

if (true) exitWith {};
