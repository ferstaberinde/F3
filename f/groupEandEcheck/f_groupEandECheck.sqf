// F3 - Group E&E Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_grp","_obj","_safeDistance","_alive","_safe","_end"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_grp = _this select 0;
_obj = _this select 1;
_safeDistance = _this select 2;
_end = _this select 3;
_safe = 0;

// ====================================================================================

while {true} do
{

// ====================================================================================

// ESTABLISH GROUP SIZE
// We begin by establishing how many units remain alive in the group. We use this to
// establish a baseline value to compare against.

_alive = {alive _x} count (units _grp);
if (_alive == 0) exitWith {};

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\server\f_groupEandECheck.sqf): _alive = %1",_alive];
};

// ====================================================================================

// CHECK PROXIMITY
// We then check how many of the units are within the required proximity to the
// objective; if all units qualify then we exit the script.

{if ((_x distance _obj) < _safeDistance) then {_safe = (_safe + 1)};} forEach units _grp;

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\server\f_groupEandECheck.sqf): _safe = %1",_safe];
};

if (_alive == _safe) exitWith {[_end] call f_fnc_mpEndBroadcast;};
_safe = 0;

// ====================================================================================

sleep 3;
};