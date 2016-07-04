// F3 - Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE PRIVATE VARIABLES

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

params["_grpName",["_mkrType","b_hq"],"_mkrText",["_mkrColor","ColorBlack"]];

private _grp = missionNamespace getVariable [_grpName,grpNull];
private _mkrName = format ["mkr_%1",_grpName];

// ====================================================================================

// WAIT FOR GROUP TO EXIST IN-MISSION
// We wait for the group to have members before creating the marker.

if (isNull _grp) then
{
	waitUntil { sleep 3; _grp = missionNamespace getVariable [_grpName,grpNull]; count (units _grp) > 0 };
};

// ====================================================================================

// EXIT FOR EMPTY GROUPS (PART I)
// If the group is empty, this script exits.

if (isnil "_grp") exitWith {};

// ====================================================================================

// CREATE MARKER
// Depending on the value of _mkrType a different type of marker is created.

_mkr = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
_mkr setMarkerShapeLocal "ICON";
_mkrName setMarkerTypeLocal  _mkrType;
_mkrName setMarkerColorLocal _mkrColor;
_mkrName setMarkerSizeLocal [0.8, 0.8];
_mkrName setMarkerTextLocal _mkrText;

// ====================================================================================

// UPDATE MARKER POSITION
// As long as certain conditions are met (the group exists) the marker
// position is updated periodically. This only happens locally - so as not to burden
// the server.

while {{!isNull _x} count units _grp > 0} do
{
	_mkrName setMarkerPosLocal [(getPos leader _grp select 0),(getPos leader _grp select 1)];
	sleep 6;
};


// ====================================================================================


