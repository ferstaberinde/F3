// F2 - Folk Group Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_grp","_mkrType","_mkrText","_mkrColor","_mkrName","_mkr","_grpName"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

call compile format ["
	_grp = %1;
",_this select 0];

_grpName = _this select 0;
_mkrType = _this select 1;
_mkrText = _this select 2;
_mkrColor = _this select 3;
_mkrName = format ["mkr_%1",_grp];


// ====================================================================================

// WAIT FOR GROUP TO EXIST IN-MISSION
// We wait for the group to have members before creating the marker.

if (isNil "_grp") then 
{
	call compile format ["
		waitUntil {sleep 3; count units %1 > 0}; 
		_grp = %1;
		
	",_grpName,_grp];
	_mkrName = format ["mkr_%1",_grp];
};

// ====================================================================================

// EXIT FOR EMPTY GROUPS (PART I)
// If the group is empty, this script exits.

if ((count (units _grp)) == 0) then
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
		
// Platoon HQ
			case 0:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "b_hq";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Fireteam
			case 1:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_INF";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Machineguns (MMG, HMG)
			case 2:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_SUPPORT";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Launchers (MAT, HAT, SAM)
			case 3:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_MOTOR_INF";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Sniper Team
			case 4:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_RECON";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Mortar Team
			case 5:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_MORTAR";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Engineers
			case 6:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_MAINT";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};			
// IFVs and Tanks
			case 7:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_ARMOR";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};
// Transport and Attack Helos
			case 8:
			{
				_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
				_mkr setMarkerShapeLocal "ICON";
				_mkrName setMarkerTypeLocal "B_AIR";
				_mkrName setMarkerColorLocal _mkrColor;
				_mkrName setMarkerSizeLocal [0.8, 0.8];
				_mkrName setMarkerTextLocal _mkrText;
			};				
		};

// ====================================================================================

// UPDATE MARKER POSITION
// As long as certain conditions are met (the group leader is alive) the marker 
// position is updated periodically. This only happens locally - so as not to burden 
// the server.
// head:task:rewrite
		for [{_i=0}, {_i<=10000}, {_i=_i+1}] do
		{
			if (alive leader _grp) then 
			{
			_mkrName setMarkerPosLocal [(getPos leader _grp select 0),(getPos leader _grp select 1)];
			};
			sleep 6;
		};

// ====================================================================================

// EXIT FOR EMPTY GROUPS (PART II)
// If the group is empty, this script exits.

	};

// ====================================================================================

if (true) exitWith {};

		
