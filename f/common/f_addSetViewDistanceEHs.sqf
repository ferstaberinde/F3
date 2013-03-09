// F3 - Dynamic View Distance 
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_vehicles","_str_vehicles","_vehicle"];

// ====================================================================================

// WAIT FOR COMMON LOCAL VARIABLES TO BE SET
// Before executing this script, we wait for the script 'f_setLocalVars.sqf' to run:

waitUntil {scriptDone f_script_setLocalVars};

// ====================================================================================

// SET KEY VARIABLES
// Using a common variable, we will create an array containing all vehicles.

_vehicles = f_var_vehicles;

// DEBUG
if (f_var_debugMode == 1) then
{
	_str_vehicles = str _vehicles;
	player sideChat format ["DEBUG (f\common\f_addSetViewDistanceEHs.sqf): _vehicles = %1",_str_vehicles];
};

// ====================================================================================

// ADD EVENT HANDLERS
// Event handlers are added to all units in the array _vehicles.

{_x addEventHandler ["GetIn", {[_this] execVM "f\common\f_setViewDistanceGetIn.sqf"}]} forEach _vehicles;
{_x addEventHandler ["GetOut", {[_this] execVM "f\common\f_setViewDistanceGetOut.sqf"}]} forEach _vehicles;

// ====================================================================================

// SET VIEW DISTANCE
// If the player is in a cargo position, the default view distance is set. If the 
// player is in a non-cargo position within an actual vehicle, the appropriate view 
// distance is set.

_vehicle = vehicle player;
setViewDistance f_viewDistance_default;
_str_yourViewDistance = f_viewDistance_default;

if ((_vehicle isKindOf "Helicopter") && ((driver _vehicle == player) || (gunner _vehicle == player)) && (!(_vehicle isKindOf "ParachuteBase"))) then
{
	setViewDistance f_viewDistance_rotaryWing;
	_str_yourViewDistance = f_viewDistance_rotaryWing;
};

if ((_vehicle isKindOf "Plane") && ((driver _vehicle == player) || (gunner _vehicle == player))) then
{
	setViewDistance f_viewDistance_fixedWing;
	_str_yourViewDistance = f_viewDistance_fixedWing;
};

if ((_vehicle isKindOf "Tank") && ((commander _vehicle == player) || (driver _vehicle == player) || (gunner _vehicle == player))) then
{
	setViewDistance f_viewDistance_tank;
	_str_yourViewDistance = f_viewDistance_tank;
};

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\common\f_addSetViewDistanceEHs.sqf): _str_yourViewDistance = %1",_str_yourViewDistance];
};

// ====================================================================================

if (true) exitWith {};
