// F3 - Multiplayer Ending Controller
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_ending"];

_ending = _this;

// ====================================================================================

// SERVER DELAY
// If this script is executing on the server a small delay is used.

if (isServer) then
{
	sleep 3;
// DEBUG
	if (f_var_debugMode == 1) then
	{
		player sideChat "DEBUG (f_fnc_mpEndReciever): This is the server.";
	};
};

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f_fnc_mpEndReciever): _ending = %1",_ending];
};

// ====================================================================================

// CLEAN-UP OBJECTIVES & TRIGGER CUT-SCENES ETC.
// This is an opportunity to set all objectives to pass/fail, trigger cut-scenes etc.
// depending on the ending that has been selected. Initially, we identify the desired
// ending using the parsed value. If an invalid value has
// been broadcast a sidechat will be displayed and the script will exit (by default
// allowed values are: 1,2,3,4,5,6).


switch (_ending) do
{
// Ending #1
	case 1:
	{
// Place any custom code for ending #1 after this line:



// Do not allow custom code for ending #1 to continue after this comment.
	"end1" call BIS_fnc_endMission;
	};
// Ending #2
	case 2:
	{
// Place any custom code for ending #2 after this line:



// Do not allow custom code for ending #2 to continue after this comment.
	"end2" call BIS_fnc_endMission;
	};
// Ending #3
	case 3:
	{
// Place any custom code for ending #3 after this line:



// Do not allow custom code for ending #3 to continue after this comment.
	"end3" call BIS_fnc_endMission;
	};
// Ending #4
	case 4:
	{
// Place any custom code for ending #4 after this line:



// Do not allow custom code for ending #4 to continue after this comment.
	"end4" call BIS_fnc_endMission;
	};
// Ending #5
	case 5:
	{
// Place any custom code for ending #5 after this line:



// Do not allow custom code for ending #5 to continue after this comment.
	"end5" call BIS_fnc_endMission;
	};
// Ending #6
	case 6:
	{
// Place any custom code for ending #6 after this line:



// Do not allow custom code for ending #6 to continue after this comment.
	"end6" call BIS_fnc_endMission;
	};

	default
	{
		player sideChat format ["DEBUG (f_fnc_mpEndReciever.sqf): _ending = %1 (INVALID)",_ending];
		exit;
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

if (true) exitWith {};