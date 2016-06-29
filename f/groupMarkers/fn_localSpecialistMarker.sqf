// F3 - Folk Unit Markers for Specialists
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_mkr"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

params["_untName",["_mkrType","b_hq"],"_mkrText",["_mkrColor","ColorBlack"]];

private _mkrName = format ["mkr_%1",_untName];
private _unt = missionNamespace getVariable [_untName, objNull];

// ====================================================================================

// WAIT FOR UNIT TO EXIST IN-MISSION
// We wait for the unit to exist before creating the marker.

if (isNull _unt) then
{
	waitUntil { sleep 3; _unt = missionNamespace getVariable [_untName, objNull]; !(isNull _unt) };
};

// ====================================================================================

// EXIT FOR DEAD UNITS (PART I)
// If the unit is dead, this script exits.

if (!alive _unt) exitWith {};

// ====================================================================================

// CREATE MARKER
// Depending on the value of _mkrType a different type of marker is created.

_mkr = createMarkerLocal [_mkrName,[(getPos _unt select 0),(getPos _unt select 1)]];
_mkr setMarkerShapeLocal "ICON";
_mkrName setMarkerTypeLocal  _mkrType;
_mkrName setMarkerColorLocal _mkrColor;
_mkrName setMarkerSizeLocal [0.8, 0.8];
_mkrName setMarkerTextLocal _mkrText;

// ====================================================================================

// UPDATE MARKER POSITION
// As long as certain conditions are met (the unit is alive) the marker
// position is updated periodically. This only happens locally - so as not to burden
// the server.

while {alive _unt} do
{
	_mkrName setMarkerPosLocal [(getPos _unt select 0),(getPos  _unt select 1)];
	sleep 6;
};

// ====================================================================================

// RESET MARKER FOR RESPAWNING UNITS
// If respawn is enabled we need to reset the marker should the unit die

// Sleep for the set respawn delay plus a small grace period
sleep (getNumber (missionconfigfile >> "RespawnDelay")) + 3;

// Re-compile the unit variable using the initially passed string
waitUntil { sleep 0.1; _unt = missionNamespace getVariable [_untName,objNull]; !(isNull _unt) };

// Check again if the unit is alive, if yes restart the marker function
if (alive _unt) exitWith {
	[_untName, _mkrType, _mkrText, _mkrColor] spawn f_fnc_localSpecialistMarker;
};

