// F3 - Set Virtual Faction Function
// Scope: Argument Global, Effect Local
// Credits: Please see the FA3 online manual (https://github.com/folkarps/F3/wiki)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_obj", "_virtualFactionName"];

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

params [
    ["_obj", objNull, [objNull]],
    ["_virtualFactionName", "", [""]]
];

// SPECIAL CASE: UNSET VIRTUAL FACTION
// Unset the virtual faction name when the passed name if the empty string
if (_virtualFactionName == "") exitWith {
    _obj setVariable ["f_var_internal_virtualFactionName", nil];
};

// SET VIRTUAL FACTION
// Set the case-insensitive virtual faction name variable of the object.
_obj setVariable ["f_var_internal_virtualFactionName", toLower _virtualFactionName];
