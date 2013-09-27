// F3 - Automatic Body Removal
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_men","_str_Men","_str_menLessExempt"];

// ====================================================================================

// WAIT FOR COMMON LOCAL VARIABLES TO BE SET
// Before executing this script, we wait for the script 'f_setLocalVars.sqf' to run:

waitUntil {scriptDone f_script_setLocalVars};

// ====================================================================================

// SET KEY VARIABLES
// Using a common variable, we will create an array containing all men.

_men = f_var_men;

// DEBUG
if (f_var_debugMode == 1) then
{
	_str_men = str _men;
	player sideChat format ["DEBUG (f\common\f_addRemoveBodyEH.sqf): _men = %1",_str_men];
};

// ====================================================================================

// ADD EVENT HANDLER
// A killed event handler is added to all units in the array _men that are not part of the exempt group

{
if !(_x in f_doNotRemoveBodies) then {
	_x addEventHandler ["killed", {(_this select 0) execVM "f\server\f_removeBody.sqf"}]
	};
} forEach _men;

// ====================================================================================

if (true) exitWith {};
