// F3 - Multiplayer Ending Controller
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
// Not used.

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if (isServer) then
{
// SET ENDING & BROADCAST
// The desired ending # is taken from the arguments passed to this script.
// Using BIS_fnc_MP the function mpEndReceiver is being called on all clients (and server),
// with the passed ending # as parameter

	[_this select 0,"f_fnc_mpEndReceiver",true,true] spawn BIS_fnc_MP;

// DEBUG
	if (f_var_debugMode == 1) then
	{
		player sideChat format ["DEBUG (f_fnc_mpEndBroadcast.sqf): f_endSelected = %1",f_endSelected];
	};
};

// ====================================================================================

if (true) exitWith {};
