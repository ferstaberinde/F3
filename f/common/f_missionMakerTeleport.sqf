// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_textAction"];

// ====================================================================================

// CHECK IF COMPONENT SHOULD BE ENABLED
// We end the script if it is not running on a player's machine, or if debug mode is
// not enabled, or if the global variable f_missionMakerTeleport has not been set to 
// the value 1 in init.sqf.

if (!local player || f_var_debugMode == 0 && f_missionMakerTeleport == 0) exitWith {};

// ====================================================================================

// SET KEY VARIABLES

_textAction = localize "STR_f_mapClickTeleportAction";

// ====================================================================================

// ADD TELEPORT ACTION TO PLAYER ACTION MENU
// Whilst the player is alive we add the teleport action to the player's action menu.
// If the player dies we wait until he is alive again and re-add the action.

while {true} do
{
	F2_mapClickTeleportAction = player addaction [_textAction,"f\common\f_mapClickTeleport.sqf","", 0, false, true];
	waitUntil {!alive player};
	waitUntil {alive player};
	sleep 0.01;
};
	