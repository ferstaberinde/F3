// F3 - Mission Maker Teleport
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// SET KEY VARIABLES

f_var_mapClickTeleport_telePos = nil;
f_var_mapClickTeleport_MapClosed = false;
if (isNil "f_var_mapClickTeleport_Used") then {f_var_mapClickTeleport_Used = 0};

// ====================================================================================
// Eventhandler to detect closing of the map
// in case the player has not clicked on the map to select a teleport position.

f_var_mapClickTeleport_EHMap = addMissionEventHandler ["Map", {
	params ["_mapIsOpened", ""];
	if (!_mapIsOpened) exitWith {
		f_var_mapClickTeleport_MapClosed = true;
	};
}];

// ====================================================================================

// TELEPORT FUNCTIONALITY
// Open the map for the player and display a notification, then set either the player's vehicle
// or the unit to the new position. If the group needs to be teleported too, set the group's position
// as well.

["MapClickTeleport",[f_var_mapClickTeleport_textSelect]] call BIS_fnc_showNotification;

["mapClickTeleportEH", "onMapSingleClick", {f_var_mapClickTeleport_telePos = _pos;}] call BIS_fnc_addStackedEventHandler;
openMap [true, false];
waitUntil {f_var_mapClickTeleport_MapClosed || !isNil "f_var_mapClickTeleport_telePos"};
["mapClickTeleportEH", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

removeMissionEventHandler ["Map", f_var_mapClickTeleport_EHMap];

//Exit if the map was closed without selecting a position.
if (f_var_mapClickTeleport_MapClosed) exitWith {};

//Select units to be teleported
private _units = [player];
if (f_var_mapClickTeleport_GroupTeleport) then {
	_units = units group player;
};

// Move player/group
// If the player is in a vehicle and not HALO-ing, the complete vehicle is moved.
// Otherwise the players are teleported individually.

// Note:
// Vehicles from other group members are not teleported,
// because there are too many edge-cases and we would need to make sure
// that the vehicles don't end up on top of each other (because they cannot be steered)
// e.g. We don't know if that other vehicle has another group leader,
// which could teleport their vehicle themself and we don't want to hijack
// it in that case.
// Also, vehicles that are loaded in cargo should not be teleported.
if (vehicle player != player) then {
	if (! isNull isVehicleCargo vehicle player) exitWith {};


	// Filter for units that are not in the group-leader's vehicle
	// These units still need to be teleported separately.
	_units = _units select {vehicle _x != vehicle player};

	// Teleport the crew outside of the vehicle if HALO-ing and f_var_mapClickTeleport_SaferVehicleHALO is set
	if (f_var_mapClickTeleport_Height > 0 && f_var_mapClickTeleport_SaferVehicleHALO) then {
		_units append (crew vehicle player);
	};

	// Add the vehicle itself
	_units pushBack (vehicle player);
};

{
	// Teleport unit/vehicle
	[_x, f_var_mapClickTeleport_telePos, f_var_mapClickTeleport_Height] remoteExec ["f_fnc_mapClickTeleportSetPos", _x];

	// Remove the teleport action from all teleported units
	{
		[_x] remoteExec ["f_fnc_mapClickTeleportRemoveAction", _x];
	} forEach crew vehicle _x;
} forEach _units;

openMap [false, false];
