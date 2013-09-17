// ws_fnc_broadcast
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
/*
FEATURE
Display FPS in hint window

USAGE
[] call ws_fnc_showFPS
[time in seconds] call ws_fnc_showFPS

PARAMETERS
1. Time for the FPS to be measured | OPTIONAL - default is 60 seconds

NOTE
ARMA 3 only
*/

private ["_time"];

_time = [_this,0,60,["SCALAR"]] call BIS_fnc_Param;

[_time,[format ["%1",name player]]] call BIS_fnc_FPS;