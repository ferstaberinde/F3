// F3 - Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_unit","_mkrType","_mkrColor","_mkrName","_mkr"];
_getColorMarker = 
{
private ["_color"];
_color = "ColorWhite";
switch (_this) do 
{ 
  case "MAIN": {_color = "ColorWhite"}; 
  case "RED": {_color = "ColorRed"};
  case "GREEN": {_color = "ColorGreen"}; 
  case "BLUE": {_color = "ColorBlue"}; 
  case "YELLOW": {_color = "ColorYellow"}; 
};
_color
};
// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_unit = _this select 0;
_mkrName = Format ["mkr_%1",_unit];
_mkrborderName = Format ["mkrB_%1",_unit];

// ====================================================================================

// Creater markers

// this marker is slightly bigger and abused in such a way to make it seem like the next maker has a border
_mkrBorder = createMarkerLocal [_mkrborderName,[(getPos _unit select 0),(getPos _unit select 1)]];
_mkrBorder setMarkerShapeLocal "ICON";
_mkrBorder setMarkerTypeLocal "MIL_TRIANGLE";
_mkrBorder setMarkerColorLocal "ColorBlack";
_mkrBorder setMarkerSizeLocal [0.60, 0.60];
_mkrBorder setMarkerDirLocal (direction _unit);

// This marker is the real marker
_mkr = createMarkerLocal [_mkrName,[(getPos _unit select 0),(getPos _unit select 1)]];
_mkr setMarkerShapeLocal "ICON";
_mkr setMarkerTypeLocal "MIL_TRIANGLE";
_mkr setMarkerColorLocal ((assignedTeam _unit) call _getColorMarker);
_mkr setMarkerSizeLocal [0.45, 0.45];
//_mkr setMarkerTextLocal (name _unit);
_mkr setMarkerDirLocal (direction _unit);



// ====================================================================================

// We shall run the loop!

while{alive _unit} do
{
	_pos = getpos _unit;
	_dir = (direction _unit);
	if (alive _unit) then 
	{
		_mkrBorder setMarkerPosLocal _pos;
		_mkrBorder setMarkerDirLocal _dir;
		_mkr setMarkerPosLocal _pos;
		_mkr setMarkerDirLocal _dir;
		_mkr setMarkerColorLocal ((assignedTeam _unit) call _getColorMarker);
	};
	sleep 3;

};
// ====================================================================================
//He's dead, lets clean up.
deleteMarkerLocal _mkrBorder;
deleteMarkerLocal _mkr;

