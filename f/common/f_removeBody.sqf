// F3 - Automatic Body Removal
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
// Not used.

// ====================================================================================

// SET KEY VARIABLES
// The body to remove is passed to this script by the event handler itself.

_body = _this select 0;

// ====================================================================================

// PAUSE THEN REMOVE BODY
// Using the value of f_removeBodyDelay we pause, then delete the body.

sleep f_removeBodyDelay;
deletevehicle _body;

// ====================================================================================

if (true) exitWith {};
