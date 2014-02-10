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
// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================
// too small to deserve its own file.
f_fnc_SetTeamValue =
{
	_unit = _this select 0;
	_color = _this select 1;
	_unit setvariable ["assignedTeam",_color];
};
// launch the subscript for drawing the marker for each unit.
[] spawn {
	f_HandlerGroup = [];
	while{alive player} do
	{
		{
			// check if we already are drawing the FT marker and that _x is alive and that _x is a man.
			if(!(_x in f_HandlerGroup) && alive _x) then
			{
				[_x] execVM "f\common\f_localFTMemberMarker.sqf";
				f_HandlerGroup = f_HandlerGroup  + [_x];
			};
		} forEach units (group player);
	sleep 5;
	};
};
// if the player is the leader he will take charge of updateing the other units of the colorvalue.
if(player == leader (group player)) then
{
	[group player,player] spawn f_fnc_LocalFTMarkerSync;
};
