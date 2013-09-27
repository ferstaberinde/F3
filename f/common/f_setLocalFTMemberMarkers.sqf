// F3 - Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// compiles function used for syncing the team color state.
// This sets the color variable in form of markerColors "ColorRed" etc..
f_setLocalMarkerVar =
{
_unit = _this select 0;
_color = _this select 1;
_unit setvariable ["assignedTeam",_color];
};
// getVersion.
f_getLocalMarkerVar =
{
_unit = _this select 0;
_color = _unit getvariable ["assignedTeam","ColorWhite"];
_color
};
// Converts assignedTeam output to Colors.
// Main is default. eg white.
f_getColorMarker =
{
private ["_color"];
_color = "ColorWhite";
switch (_this) do
{
  case "MAIN": {_color = "ColorWhite"};
  case "RED": {_color = "ColorRed"};
  case "GREEN": {_color = "ColorGreen"};
  case "BLUE": {_color = "ColorBlue"};
  case "YELLOW": {_color = "ColorYellow"};
};
_color
};

// Compiles the sync function used for the teamleader to broadcast updates to his members.
f_TeamLeaderSync = compile preprocessFileLineNumbers "f\common\f_localFTMarkerSync.sqf";

// launch the subscript for drawing the marker for each unit.
[] spawn {
	_handlerGroup = [];
	while{alive player} do
	{
		{
			if(!(_x in _handlerGroup) && alive _x) then
			{
				[_x] execVM "f\common\f_localFTMemberMarker.sqf";
				_handlerGroup = _handlerGroup  + [_x];
			};
		} forEach units (group player);
	sleep 5;
	};
};
// if the player is the leader he will take charge of updateing the other units of the colorvalue.
if(player == leader (group player)) then
{
	[group player,player] spawn f_TeamLeaderSync;
};
