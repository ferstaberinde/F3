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

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// DEFINE HELPER-FUNCTION
// Define a small function to set a unit's team color

f_fnc_SetTeamValue =
{
	_unit = _this select 0;
	_color = _this select 1;
	_unit setvariable ["assignedTeam",_color];
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
				f_var_HandlerGroup set [count f_var_HandlerGroup,_x];
			};
		} forEach units (group player);
	sleep 5;
	};

	//f_var_HandlerGroup = [];
};

// ====================================================================================

// SYNCHRONIZE TEAM COLORS
// If the player is the groupleader he will take charge of updateing the other units of the colorvalue.

if(player == leader (group player)) then
{
	[group player,player] spawn f_fnc_LocalFTMarkerSync;
};
