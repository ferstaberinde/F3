// F3 - Dynamic View Distance 
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_str_yourViewDistance"];

// ====================================================================================

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

_fromEH = _this select 0;
_vehicle = _fromEH select 0;
_vehicleRole = _fromEH select 1;
_unitToCheck = _fromEH select 2;

// ====================================================================================

// EXIT IF INVOKING UNIT IS NOT PLAYER
// The rest of this SQF file should not run if the player is not the one triggering
// the event handler.

if (player != _unitToCheck) exitWith {};

// ====================================================================================

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\common\f_setViewDistanceGetOut.sqf): _fromEH = %1",_fromEH];
	player sideChat format ["DEBUG (f\common\f_setViewDistanceGetOut.sqf): _vehicle = %1",_vehicle];
	player sideChat format ["DEBUG (f\common\f_setViewDistanceGetOut.sqf): _vehicleRole = %1",_vehicleRole];
	player sideChat format ["DEBUG (f\common\f_setViewDistanceGetOut.sqf): _unitToCheck = %1",_unitToCheck];
};

// ====================================================================================

// SET VIEW DISTANCE
// If the player is on foot (i.e. the player vehicle is the player itself), or in a
// cargo position, the default viewdistance is set.

setViewDistance f_viewDistance_default;
_str_yourViewDistance = f_viewDistance_default;

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\common\f_setViewDistance.sqf): _str_yourViewDistance = %1",_str_yourViewDistance];
};

// ====================================================================================

if (true) exitWith {};
