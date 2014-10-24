// F3 - Safe Start, Server Loop
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

// Run the loop only on the server
if !(isServer) exitWith {};

// Redundant sleep to give everything a second to settle
sleep 1;

// Timer for the mission setup
for [{_i = pv_mission_timer;},{_i > 0;},{_i = _i - 1;}] do
{
	[["SafeStart",[format["Time Remaining: %1 min",pv_mission_timer]]],"bis_fnc_showNotification",true] call BIS_fnc_MP;
	uisleep 60;
	pv_mission_timer = pv_mission_timer - 1;
	publicVariable "pv_mission_timer";

	//Once the mission timer has reached 0, disable the safeties
	if (pv_mission_timer == 0) exitWith {
		[["SafeStartMissionStarting",["Mission starting now!"]],"bis_fnc_showNotification",true] call BIS_fnc_MP;
		[{false execVM "f\safeStart\f_safety.sqf"},"BIS_fnc_spawn",true]  call BIS_fnc_MP;
	};
};

