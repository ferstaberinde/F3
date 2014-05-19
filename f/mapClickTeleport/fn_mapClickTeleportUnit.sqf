// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_textSelect","_textDone"];

// ====================================================================================

// SET KEY VARIABLES

f_telePositionSelected = false;
if (isNil "f_var_mapClickTeleport_Used") then {f_var_mapClickTeleport_Used = 0};
_textSelect = localize "STR_f_mapClickTeleportSelect";
_textDone = localize "STR_f_mapClickTeleportDone";
_textAction = localize "STR_f_mapClickTeleportAction";

// ====================================================================================

// TELEPORT FUNCTIONALITY
// Open the map for the player and display a notification, then set either the player's vehicle
// or the unit to the new position. If the group needs to be teleported too, set the group's position
// as well.

["MapClickTeleport",[_textSelect]] call BIS_fnc_showNotification;
openMap [true, false];
onMapSingleClick "f_var_mapClickTeleport_telePos = _pos; f_telePositionSelected = true";
waitUntil {f_telePositionSelected};

if (vehicle player != player) then {
	(vehicle player) setPos f_var_mapClickTeleport_telePos;
} else {
	player setPos f_var_mapClickTeleport_telePos;
	if (f_var_mapClickTeleport_GroupTeleport) then {
		sleep 0.1;
		[group player,"f_fnc_mapClickTeleportGroup",units group player] spawn BIS_fnc_MP;
	};
};

openMap false;
["MapClickTeleport",[_textDone]] call BIS_fnc_showNotification;

// ====================================================================================

// REMOVE AND READ ACTION
// Remove the action and re-add if we have uses left (or if they are infinite)

player removeAction f_mapClickTeleportAction;
f_var_mapClickTeleport_Used = f_var_mapClickTeleport_Used + 1;

if (f_var_mapClickTeleport_Uses == 0 || f_var_mapClickTeleport_Used < f_var_mapClickTeleport_Uses) then {
	f_mapClickTeleportAction = player addaction [_textAction,{[] spawn f_fnc_mapClickTeleportUnit},"", 0, false,true,"","_this == player"];
};
