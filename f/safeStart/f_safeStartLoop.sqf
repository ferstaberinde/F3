// F3 - Safe Start, Server Loop
// Credits and documentation: https://github.com/folkarps/F3/wiki
//=====================================================================================

// Run the loop only on the server
if !(isServer) exitWith {};

// Redundant sleep to give everything a second to settle
sleep 2;

//Intervals for checking the timer and for sending notifications
//_intervalCheck should be a small number to avoid a delay when the
//safeStart is being ended using the briefing page.
private _intervalCheck = 2;
private _intervalNotification = _intervalCheck * 30; //Must be a multiple of _intervalCheck

private _started = false;
while {f_param_mission_timer > 0} do {

	// Broadcast remaining time to players
	// The _started flag makes sure it is shown at the beginning of the mission.
	if (!_started || f_param_mission_timer % _intervalNotification == 0) then {
		["SafeStart",[format["Time Remaining: %1 min",(f_param_mission_timer / 60) toFixed 1]]] remoteExec ["bis_fnc_showNotification", 0];
		_started = true;
	};

	uisleep _intervalCheck; // Sleep _intervalCheck seconds

	// Reduce the mission timer by _intervalCheck seconds
	f_param_mission_timer = f_param_mission_timer - _intervalCheck;
	publicVariable "f_param_mission_timer";
};

//Once the mission timer has reached 0, disable the safeties
if (f_param_mission_timer <= 0) then {
		// Broadcast message to players
		["SafeStartMissionStarting",["Safe start ended!"]] remoteExec ["bis_fnc_showNotification", 0];

		// Remotely execute script to disable safety for all selectable units
		[false] remoteExec ["f_fnc_safety", playableUnits + switchableUnits];
};
