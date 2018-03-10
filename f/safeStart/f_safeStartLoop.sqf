// F3 - Safe Start, Server Loop
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

// Run the loop only on the server
if !(isServer) exitWith {};

// Redundant sleep to give everything a second to settle
sleep 2;

//Intervals for checking the timer and for sending notifications
private _intervalCheck = 10;
private _intervalNotification = _intervalCheck * 6; //Must be a multiple of _intervalCheck

private _started = false;
while {f_param_mission_timer > 0} do {

	// Broadcast remaining time to players
	if (!_started || f_param_mission_timer % _intervalNotification == 0) then {
		["SafeStart",[format["Time Remaining: %1 min",(f_param_mission_timer / 60) toFixed 1]]] remoteExec ["bis_fnc_showNotification", 0];
		_started = true;
	};

	uisleep _intervalCheck; // Sleep _intervalCheck seconds

	// If mission timer has been terminated by admin briefing, simply exit
	if (f_param_mission_timer < 0) exitWith {};

	// Reduce the mission timer by _intervalCheck seconds
	f_param_mission_timer = f_param_mission_timer - _intervalCheck;
	publicVariable "f_param_mission_timer";
};

//Once the mission timer has reached 0, disable the safeties
if (f_param_mission_timer == 0) then {
		// Broadcast message to players
		["SafeStartMissionStarting",["Safe start ended!"]] remoteExec ["bis_fnc_showNotification", 0];

		// Remotely execute script to disable safety for all selectable units
		[false] remoteExec ["f_fnc_safety", playableUnits + switchableUnits];
};
