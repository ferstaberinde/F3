// F3 - Safe Start, Client Hint
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

//Run the hint on all clients
if(!isDedicated) then
{
	//display hint while timer is active
	while {pv_mission_timer > 0} do
	{
		//hintsilent  ["SAFE START\n(s)\n", pv_mission_timer];
		["SafeStart",[format["Time Remaining: %1 min",pv_mission_timer]]] call bis_fnc_showNotification;
		if (pv_mission_timer == 0) exitWith {};
 		sleep 60;
	};

	//Display notification when the mission starts
	["SafeStartMissionStarting",["Mission starting now!"]] call bis_fnc_showNotification;
};
