// F3 - Folk Unit Markers for Specialists 
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_unt","_mkrType","_mkrText","_mkrColor","_mkrName","_mkr","_untName"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

call compile format ["
if(!isnil '%1') then
{
	_unt = %1;
};
",_this select 0];

_untName = _this select 0;
_mkrType = _this select 1;
_mkrText = _this select 2;
_mkrColor = _this select 3;
_mkrName = format ["mkr_%1",_untName];


// ====================================================================================

// WAIT FOR UNIT TO EXIST IN-MISSION
// We wait for the unit to exist before creating the marker.

if (isNil "_unt") then 
{
	call compile format ["
		waitUntil {
		sleep 3;
		!isnil '%1'
		};
		_unt = %1;
		
	",_untName];
};

// ====================================================================================

// EXIT FOR DEAD UNITS (PART I)
// If the unit does not exist, this script exits.

if (!alive _unt ) then
	{
	if (true) exitWith {};
	}
	else
	{

// ====================================================================================

// CREATE MARKER
// Depending on the value of _mkrType a different type of marker is created.

		switch (_mkrType) do
		{
		
// Medics
			case 0:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos _unt select 0),(getPos _unt select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_MED";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.5, 0.5];
				_mkrName setMarkerTextLocal _mkrText;
			};

		};

// ====================================================================================

// UPDATE MARKER POSITION
// As long as certain conditions are met (the unit is alive) the marker 
// position is updated periodically. This only happens locally - so as not to burden 
// the server.

		for [{_i=0}, {_i<=10000}, {_i=_i+1}] do
		{
			if (alive _unt) then 
			{
			_mkrName setMarkerPosLocal [(getPos _unt select 0),(getPos  _unt select 1)];
			};
			sleep 6;
		};

// ====================================================================================

// EXIT FOR DEAD UNITS (PART II)
// If the unit is dead, this script exits.

	};

// ====================================================================================

if (true) exitWith {};

		
