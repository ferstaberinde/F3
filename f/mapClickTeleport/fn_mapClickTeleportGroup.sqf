// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_pos","_units","_textDone"];

// ====================================================================================

// SET KEY VARIABLES

_pos = getPosATL (leader _this);
_units = (units _this) - [leader _this];
_textDone = localize "STR_f_mapClickTeleportDone";

// ====================================================================================

// TELEPORT UNITS
// Loop through the group's units (excluding the leader) and check if they are local, if true teleport
// them next to the leader and display a notification for players

{
	if (local _x) then {
		_x setPos [((_pos select 0) + 3 + random 3),((_pos select 1) + 3 + random 3),(_pos select 2)];

		// Display a notification for players
		if (_x == vehicle player) then {["MapClickTeleport",[_textDone]] call BIS_fnc_showNotification};
	};
} forEach _units;



