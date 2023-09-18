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
// Note: GetInMan is still needed due to a bug where PlayerViewChanged doesn't fire for
//       non-server players when they enter a vehicle they haven't entered before.
//       Because of this, when entering a vehicle the code is sometimes run twice.
f_ehIndex_dynamicViewDistance_0 = addMissionEventHandler ['PlayerViewChanged', f_fnc_ehSetViewDistance];
f_ehIndex_dynamicViewDistance_1 = player addEventHandler ['SeatSwitchedMan',   f_fnc_ehSetViewDistance];
f_ehIndex_dynamicViewDistance_2 = player addEventHandler ['GetInMan',          f_fnc_ehSetViewDistance];

if (f_param_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\dynamicViewDistance\f_setViewDistanceInit.sqf): Added Event Handler PlayerViewChanged ID: %1", f_ehIndex_dynamicViewDistance_0];
	player sideChat format ["DEBUG (f\dynamicViewDistance\f_setViewDistanceInit.sqf): Added Event Handler SeatSwitchedMan ID: %1",   f_ehIndex_dynamicViewDistance_1];
	player sideChat format ["DEBUG (f\dynamicViewDistance\f_setViewDistanceInit.sqf): Added Event Handler GetInMan ID: %1",          f_ehIndex_dynamicViewDistance_2];
};
