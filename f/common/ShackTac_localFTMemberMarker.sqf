// F2 - ShackTactical Fireteam Member Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_unit","_mkrType","_mkrColor","_mkrName","_mkr"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_unit = _this select 0;
_mkrType = _this select 1;
_mkrColor = _this select 2;
_mkrName = Format ["mkr_%1",_unit];

// ====================================================================================

// CREATE MARKER
// Depending on the value of _mkrType a different type of marker is created.

		switch (_mkrType) do
		{
// Normal
			case 0:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos _unit select 0),(getPos _unit select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "MIL_TRIANGLE";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.4, 0.4];
				// _mkrName setMarkerTextLocal (name _unit);
				_mkrName setMarkerDirLocal (direction _unit);
			};
		};

// ====================================================================================

// UPDATE MARKER POSITION
// As long as certain conditions are met (the group leader is alive and holding the
// radio, or radio object placeholder) the marker position is updated periodically.
// This only happens locally - so as not to burden the server.

		for [{_i=0}, {_i<=10000}, {_i=_i+1}] do
		{
			if (alive _unit) then 
			{
				_mkrName setMarkerPosLocal [(getPos _unit select 0),(getPos _unit select 1)];
				_mkrName setMarkerDirLocal (direction _unit);
			}
			else
			{
				_mkrName setMarkerPosLocal [0,0];
			};
			sleep 3;
		};

// ====================================================================================

if (true) exitWith {};

		
