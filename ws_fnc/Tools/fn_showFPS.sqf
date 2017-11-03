// ws_fnc_showFPS
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

params [["_time", 60, [0]]];

[_time,[format ["%1",name player]]] call BIS_fnc_FPS;
