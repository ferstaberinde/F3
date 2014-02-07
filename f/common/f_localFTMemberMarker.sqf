// F3 - Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_unit","_mkrType","_mkrColor","_mkrName","_mkr","_mkrBorder","_pos"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_unit = _this select 0;
_mkrName = Format ["mkr_%1",_unit];
_mkrborderName = Format ["mkrB_%1",_unit];

// ====================================================================================

// Creater markers

// this marker is slightly bigger and abused in such a way to make it seem like the next maker has a border
_pos = getpos _unit;
_mkrBorder = createMarkerLocal [_mkrborderName,_pos];
_mkrBorder setMarkerShapeLocal "ICON";
_mkrBorder setMarkerTypeLocal "MIL_TRIANGLE";
_mkrBorder setMarkerColorLocal "ColorBlack";
_mkrBorder setMarkerSizeLocal [0.60, 0.60];
_mkrBorder setMarkerDirLocal (direction _unit);

// This marker is the real marker
_mkr = createMarkerLocal [_mkrName,_pos];
_mkr setMarkerShapeLocal "ICON";
_mkr setMarkerTypeLocal "MIL_TRIANGLE";
_mkr setMarkerColorLocal (_unit getvariable ["assignedTeam","ColorWhite"]);
_mkr setMarkerSizeLocal [0.45, 0.45];
_mkr setMarkerDirLocal (direction _unit);



// ====================================================================================

// We shall run the loop!

while{alive _unit && (_unit in f_HandlerGroup)} do
{
	_pos = getpos _unit;
	_dir = (direction _unit);
	if (alive _unit && {_unit in units group player}) then
	{
		_mkrBorder setMarkerPosLocal _pos;
		_mkrBorder setMarkerDirLocal _dir;
		_mkr setMarkerPosLocal _pos;
		_mkr setMarkerDirLocal _dir;
		// makes a call to the function defined in f_setLocalFTMemberMarkers.sqf
		// retreives the stored color from the unit.
		_mkr setMarkerColorLocal (_unit getvariable ["assignedTeam","ColorWhite"]);
	} else {
		f_HandlerGroup = f_HandlerGroup - [_unit];
	};
	sleep 3;

};
// ====================================================================================
//He's dead jim, lets clean up.
deleteMarkerLocal _mkrBorder;
deleteMarkerLocal _mkr;

