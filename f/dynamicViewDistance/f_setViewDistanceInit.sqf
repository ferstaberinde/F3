// FA3 - Dynamic View Distance
// ====================================================================================

if (!hasInterface) exitWith {};

if (!isDedicated && (isNull player)) then
{
	waitUntil {sleep 0.1; !isNull player};
};

//Set view distance in case the player starts in vehicle
[player, objNull, vehicle player] spawn f_fnc_ehSetViewDistance;

// Add event handlers:
// Note: Using PlayerViewChanged instead of GetInMan and GetOutMan to cover UAVs as well.
f_ehIndex_dynamicViewDistance_0 = player addEventHandler ['SeatSwitchedMan',   f_fnc_ehSetViewDistance];
f_ehIndex_dynamicViewDistance_1 = addMissionEventHandler ['PlayerViewChanged', f_fnc_ehSetViewDistance];

if (f_param_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\dynamicViewDistance\f_setViewDistanceInit.sqf): Added Event Handler SeatSwitchedMan ID: %1", f_ehIndex_dynamicViewDistance_0];
	player sideChat format ["DEBUG (f\dynamicViewDistance\f_setViewDistanceInit.sqf): Added Event Handler PlayerViewChanged ID: %1", f_ehIndex_dynamicViewDistance_1];
};
