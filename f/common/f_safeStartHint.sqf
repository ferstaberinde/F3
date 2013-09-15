// F3 - Safe Start, Client Hint
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

//Run the hint on all clients
if(!isDedicated) then
{
	while {pv_mission_timer > 0;} do
	{
		hintsilent format ["Mission Setup\nTime Remaining: %1\n", pv_mission_timer];
		sleep 5;
	};
};
