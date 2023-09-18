// F3 - Folk Group Markers
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

params [
	["_grpName", "", [""]],
	["_mkrType", "b_hq", [""]],
	["_mkrText", "", [""]],
	["_mkrColor","ColorBlack", [""]]
];

private _grp = missionNamespace getVariable [_grpName,grpNull];
private _mkrName = format ["mkr_%1",_grpName];

// ====================================================================================

// WAIT FOR GROUP TO EXIST IN-MISSION

//If the group does not exist in this mission file, then we can exit.
if (isNull _grp) exitWith {};

// We wait for the group to have members before creating the marker.
if (count units _grp == 0) then
{
	waitUntil { sleep 5; _grp = missionNamespace getVariable [_grpName,grpNull]; count units _grp > 0 };
};

// ====================================================================================

// CREATE MARKER
// Depending on the value of _mkrType a different type of marker is created.

_mkrName = createMarkerLocal [_mkrName,[(getPos leader _grp select 0),(getPos leader _grp select 1)]];
_mkrName setMarkerShapeLocal "ICON";
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
