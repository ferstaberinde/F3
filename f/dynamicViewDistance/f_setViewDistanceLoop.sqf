// F3 - Dynamic View Distance
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// PLAYER-ONLY COMPONENT
// No need to run this on the server

if (isDedicated) exitWith {};

// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_veh","_vd","_seat","_sleep"];

// ====================================================================================

// SETUP KEY VARIABLES
// The sleep governs how often the scripts checks if the player has changed the vehicle

_sleep = 3;

// ====================================================================================

// SET VIEW DISTANCE
// If the player is in a cargo position, the default view distance is set. If the
// player is in a non-cargo position within an actual vehicle, the appropriate view
// distance is set.

while {!isNull player} do {
	_veh = vehicle player;
	_seat = "";
	_vd = f_var_viewDistance_default;

	if (_veh != player) then {
		if (_veh isKindOf "Car") then {_vd = f_var_viewDistance_car;};
		if (_veh isKindOf "Tank") then {_vd = f_var_viewDistance_tank;};
		if (_veh isKindOf "Helicopter_Base_F") then {_vd = f_var_viewDistance_rotaryWing;};
		if (_veh isKindOf "Plane") then {_vd = f_var_viewDistance_fixedWing;};

		_seat = (assignedVehicleRole player select 0);
		if (_seat == "CARGO" && f_var_viewDistance_crewOnly) then {_vd = f_var_viewDistance_default;};
	};

	setViewDistance _vd;

		// DEBUG
		if (f_var_debugMode == 1) then
		{
			player sideChat format ["DEBUG (f\setViewDistance\f_addSetViewDistanceEHs.sqf): Viewdistance set to: = %1",_vd];
		};

	// Wait until player changes the vehicle or changes seats. Sleep 1s between every check.
	while {_veh == vehicle player} do {

		// Check if the player has changed seats.
		if (_veh != player && {_seat != (assignedVehicleRole player select 0)}) exitWith {};

		sleep _sleep;
	};
};
