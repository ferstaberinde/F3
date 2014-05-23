// F3 - Multiplayer Ending Controller
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
// Not used.

// ====================================================================================

// SERVER CHECK
// Make sure that the script is only run on the server

if (!isServer) exitWith {};

// SET ENDING & BROADCAST
// The desired ending # is taken from the arguments passed to this script.
// Using BIS_fnc_MP the function mpEndReceiver is being spawned on all clients (and server),
// with the passed ending # as parameter

	[_this,"f_fnc_mpEndReceiver",true] spawn BIS_fnc_MP;

// ====================================================================================


