// F2 - Automatic Body Removal
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_men","_str_Men","_str_menLessExempt"];

f_abrAddToFIFO = objNull;

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

// REMOVE EXEMPT GROUPS
// Units from groups named in the global array f_doNotRemoveBodies are removed from
// the array _men.

{if ((group _x) in f_doNotRemoveBodies) then {_men = _men - [_x]}} forEach _men;

// DEBUG
if (f_var_debugMode == 1) then
{
	_str_menLessExempt = str _men;
	player sideChat format ["DEBUG (f\common\f_addRemoveBodyEH.sqf): _menLessExempt = %1",_str_menLessExempt];
};

// ====================================================================================

// ADD EVENT HANDLER
// A killed event handler is added to all units in the array _men.

if (count _this == 0) then
{
	//delay method
	{_x addEventHandler ["killed", {_this execVM "f\common\f_removeBody.sqf"}]} forEach _men;
}else
{
	//FIFO method
	{
		_x addEventHandler ["killed", 
		{
			if (isServer) then
			{
				f_abrFIFO = f_abrFIFO + [_this select 0];
			} else
			{
				_this execVM "f\common\f_abrAddToFIFO.sqf"	
			};
		}]
	} forEach _men;
	// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat "DEBUG (f\common\f_addRemoveBodyEH.sqf): FIFO EHs added";
	};
};

// ====================================================================================

if (true) exitWith {};
