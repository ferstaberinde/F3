// F3 - Determine Virtual Faction Function
// Scope: Argument Global, Effect Local
// Credits: Please see the FA3 online manual (https://github.com/folkarps/F3/wiki)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_obj"];

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

params [["_obj", objNull, [objNull]]];

// DETERMINE VIRTUAL FACTION
// Get the virtual faction name variable of the object. If it is unset, return the output of `faction` instead
_obj getVariable ["f_var_internal_virtualFactionName", faction _obj];
