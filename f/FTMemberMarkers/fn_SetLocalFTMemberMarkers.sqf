// 	F3 - Fireteam Member Markers
// 	Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//  Description: Launches the main part of the FireTeam Member markers.
//  Parameters
//		Nothing.
//	Returns:
//		Nothing.
// 	Example:
// 		[] call f_fnc_SetLocalFTMemberMarker;
//
// ====================================================================================

if (!hasInterface) exitWith {};

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then
{
	waitUntil {sleep 0.1; !isNull player};
};

// Don't run this for zeus and virtual spectators
if (side player isEqualto sideLogic) exitWith {};

// ====================================================================================

// DEFINE HELPER-FUNCTION
// Define a small function to get/set a unit's team color
// This function updates the assignedTeam variable
// if assignedTeam returns a new team(color).

f_fnc_GetUpdatedTeamValue =
{
	params["_unit"];
	private _team = assignedTeam _unit;
	private _color = _unit getvariable ["assignedTeam","ColorWhite"];
	//_team can be nil if the player is controlling another unit (uav, zeus).
	if(!isNil "_team") then
	{
		private _colorNew = [_team] call f_fnc_GetMarkerColor;
		if(_color != _colorNew) then
		{
			_unit setVariable ["assignedTeam",_colorNew];
			_color = _colorNew;
		};
	};
	_color
};


// ====================================================================================

// START DRAWING MARKERS
// launch the subscript for drawing the marker for each unit.

[] spawn {
	f_var_HandlerGroup = [];
	while{!isNull player} do
	{
		{
			// check if we already are drawing the FT marker and that _x is alive
			if(!(_x in f_var_HandlerGroup) && alive _x) then
			{
				[_x] execVM "f\FTMemberMarkers\f_localFTMemberMarker.sqf";
				f_var_HandlerGroup pushBack _x;
			};
		} forEach units (group player);
		sleep 5;
	};
};
