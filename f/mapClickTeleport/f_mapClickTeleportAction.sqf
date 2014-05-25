// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_textAction"];

// ====================================================================================

// SET UP VARIABLES
// Make sure all global variables are initialized
if (isNil "f_var_mapClickTeleport_Uses") then {f_var_mapClickTeleport_Uses = 0};
if (isNil "f_var_mapClickTeleport_TimeLimit") then {f_var_mapClickTeleport_TimeLimit = 0};
if (isNil "f_var_mapClickTeleport_GroupTeleport") then {f_var_mapClickTeleport_GroupTeleport = false};
if (isNil "f_var_mapClickTeleport_Units") then {f_var_mapClickTeleport_Units = []};

// Make sure that no non-existing units have been parsed
{
	if (isNil format ["%1",_x]) then {
		f_var_mapClickTeleport_Units set [_forEachIndex,objNull];
	};
} forEach f_var_mapClickTeleport_Units;

f_var_mapClickTeleport_Units = f_var_mapClickTeleport_Units - [objNull];

// ====================================================================================

// CHECK IF COMPONENT SHOULD BE ENABLED
// We end the script if it is not running on a server or if only group leaders can use
// the action and the player is not the leader of his/her group

if (isDedicated) exitWith {};
if (count f_var_mapClickTeleport_Units > 0 && !(player in f_var_mapClickTeleport_Units)) exitWith {};
if (f_var_mapClickTeleport_GroupTeleport && player != leader group player)  exitWith {};

// ====================================================================================

// SET KEY VARIABLES

_textAction = localize "STR_f_mapClickTeleportAction";

// ====================================================================================

// ADD TELEPORT ACTION TO PLAYER ACTION MENU
// Whilst the player is alive we add the teleport action to the player's action menu.
// If the player dies we wait until he is alive again and re-add the action.

f_mapClickTeleportAction = player addaction [_textAction,{[] spawn f_fnc_mapClickTeleportUnit},"", 0, false,true,"","_this == player"];

if (f_var_mapClickTeleport_TimeLimit > 0) then {
	sleep f_var_mapClickTeleport_TimeLimit;
	player removeAction f_mapClickTeleportAction;
};