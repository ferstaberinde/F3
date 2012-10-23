// F2 - Dynamic View Distance 
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_fromEH","_vehicle","_vehicleRole","_unitToCheck","_str_yourViewDistance"];

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
	player sideChat format ["DEBUG (f\common\f_setViewDistanceGetIn.sqf): _fromEH = %1",_fromEH];
	player sideChat format ["DEBUG (f\common\f_setViewDistanceGetIn.sqf): _vehicle = %1",_vehicle];
	player sideChat format ["DEBUG (f\common\f_setViewDistanceGetIn.sqf): _vehicleRole = %1",_vehicleRole];
	player sideChat format ["DEBUG (f\common\f_setViewDistanceGetIn.sqf): _unitToCheck = %1",_unitToCheck];
};

// ====================================================================================

// SET VIEW DISTANCE
// If the player is in a cargo position, the default view distance is set. If the 
// player is in a non-cargo position within an actual vehicle, the appropriate view 
// distance is set.

if (_vehicleRole == "CARGO") then
{
	setViewDistance f_viewDistance_default;
	_str_yourViewDistance = f_viewDistance_default;
};

if ((_vehicle isKindOf "Helicopter") && (_vehicleRole != "CARGO") && (!(_vehicle isKindOf "ParachuteBase"))) then
{
	setViewDistance f_viewDistance_rotaryWing;
	_str_yourViewDistance = f_viewDistance_rotaryWing;
};

if ((_vehicle isKindOf "Plane") && (_vehicleRole != "CARGO")) then
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
	player sideChat format ["DEBUG (f\common\f_setViewDistance.sqf): _str_yourViewDistance = %1",_str_yourViewDistance];
};

// ====================================================================================

if (true) exitWith {};
