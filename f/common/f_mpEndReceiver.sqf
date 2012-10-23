// F2 - Multiplayer Ending Controller 
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_validEndings"];

// ====================================================================================

// SERVER DELAY
// If this script is executing on the server a small delay is used.

if (isServer) then
{
	sleep 3;
// DEBUG
	if (f_var_debugMode == 1) then
	{
		player sideChat "DEBUG (f\server\f_mpEndBroadcast.sqf): This is the server.";
	};
};

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\server\f_mpEndBroadcast.sqf): f_endSelected = %1",f_endSelected];
};

// ====================================================================================

// CREATE LOCAL END TRIGGER
// Dynamically alter the trigger f_trgEndReceiver so that it becomes an End trigger.

f_trgEndReceiver setTriggerType format ["End%1",f_endSelected];
f_trgEndReceiver setTriggerStatements [format ["f_fireEnd%1",f_endSelected],"",""];

// ====================================================================================

// CLEAN-UP OBJECTIVES & TRIGGER CUT-SCENES ETC.
// This is an opportunity to set all objectives to pass/fail, trigger cut-scenes etc.
// depending on the ending that has been selected. Initially, we identify the desired
// ending using the value of f_endSelected. If an invalid value for f_endSelected has
// been broadcast a sidechat will be displayed and the script will exit (allowed values
// are: 1,2,3,4,5,6).

_validEndings = [1,2,3,4,5,6];
if (!(f_endSelected in _validEndings)) then 
{
	player sideChat format ["DEBUG (f\common\f_mpEndReciever.sqf): f_endSelected = %1 (INVALID)",f_endSelected];
	exit; 	
};

switch (f_endSelected) do
{
// Ending #1
	case 1:
	{
// Place any custom code for ending #1 after this line:
		
		
		
	};
// Ending #2
	case 2:
	{
// Place any custom code for ending #2 after this line:
		
		
		
	};
// Ending #3
	case 3:
	{
// Place any custom code for ending #3 after this line:
		
		
		
	};
// Ending #4
	case 4:
	{
// Place any custom code for ending #4 after this line:
		
		
		
	};
// Ending #5
	case 5:
	{
// Place any custom code for ending #5 after this line:
		
		
		
	};
// Ending #6
	case 6:
	{
// Place any custom code for ending #6 after this line:
		
				
		
	};
};

// ====================================================================================

// EXIT THE SPECTATOR SCRIPT IF IS OPEN
// Clients just "hang" if the mission has ended but are still inside the
// spectator script.
if (dialog) then
{
	closeDialog 0;
};

// ====================================================================================

// CREATE VARIABLE TO FIRE APPROPRIATE LOCAL END TRIGGER
// Using the value of f_endSelected a new variable is created (local to the client).
// The new variable will fire the end trigger on the client.

switch (f_endSelected) do
{
	case 1:
	{
		f_fireEnd1 = true;
	};
	case 2:
	{
		f_fireEnd2 = true;
	};
	case 3:
	{
		f_fireEnd3 = true;
	};
	case 4:
	{
		f_fireEnd4 = true;
	};
	case 5:
	{
		f_fireEnd5 = true;
	};
	case 6:
	{
		f_fireEnd6 = true;
	};
};

// ====================================================================================

if (true) exitWith {};
