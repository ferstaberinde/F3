// F3 - Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================
f_setLocalMarkerVar = 
{
_unit = _this select 0;
_color = _this select 1;
_unit setvariable ["assignedTeam",_color];
};
f_getLocalMarkerVar = 
{
_unit = _this select 0;
_color = _unit getvariable ["assignedTeam","ColorWhite"];
_color
};
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
f_TeamLeaderSync = compile preprocessFileLineNumbers "f\common\f_localFTMarkerSync.sqf";

{
	[_x] execVM "f\common\f_localFTMemberMarker.sqf";
}
forEach units (group player);

if(player == leader (group player)) then
{
[group player,player] spawn f_TeamLeaderSync;
};
