// F3 - Safe Start
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================
//	This script inits the Mission Timer and the Safe Start, has the server setup the publicVariable
//      while the client waits, sets units invincibility and displays hints, then disables it.

//Setup the variables
if (isNil "f_param_mission_timer") then {
	f_param_mission_timer = ["f_param_mission_timer",0] call BIS_fnc_getParamValue;
};

// ====================================================================================

// BEGIN SAFE-START LOOP
// If a value was set for the mission-timer, begin the safe-start loop and turn on invincibility

if (f_param_mission_timer > 0) then
{
	// The server will handle the loop and notifications
	if (isServer) then {
		[] execVM "f\safeStart\f_safeStartLoop.sqf";
	};

	// Enable invincibility for players
	if (!isDedicated) then {
		[true] call f_fnc_safety;
	};
};