// F2 - Mission Maker Teleport
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_textSelect","_textDone"];

// ====================================================================================

// SET KEY VARIABLES

f_telePositionSelected = false;
_textSelect = localize "STR_f_mapClickTeleportSelect";
_textDone = localize "STR_f_mapClickTeleportDone";

// ====================================================================================

// TELEPORT FUNCTIONALITY
// When the script is activated the player is asked to click on the map at the desired
// target location for the teleport. On clicking, the player is teleported to that 
// location and given a message to confirm that the teleport has taken place.

titletext [_textSelect,"plain", 0.4];
onMapSingleClick "player setPos _pos; f_telePositionSelected = true";
waitUntil {f_telePositionSelected};
titletext [_textDone,"plain", 0.3];
