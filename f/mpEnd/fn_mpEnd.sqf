// F3 - Multiplayer Ending Controller
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
// Not used.

// ====================================================================================

// SERVER CHECK
// Make sure that the script is only run on the server

if (!isServer) exitWith {};

// SET ENDING & BROADCAST
// The desired ending # is taken from the arguments passed to this script.
// Using remoteExec the function mpEndReceiver is being spawned on all clients (and server),
// with the passed ending # as parameter.
// Once an ending has been triggered, no other ending is possible.

if (isNil "f_var_EndingTriggered") then {
	_this remoteExec ["f_fnc_mpEndReceiver", 0];
};
f_var_EndingTriggered = true;

// ====================================================================================
