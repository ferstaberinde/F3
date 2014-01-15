/*
ws_fnc_nearPlayer
Latest: 15.01.2014

Based on CBA_fnc_listPlayer

FEATURE
Checks if player is within distance of unit

USAGE
[unit,distance] call ws_fnc_cInit in init.sqf or unit init

To exclude a group from being cached:
a) In unit init: (group this) setVariable ["ws_cacheExcl",true];
b) Anywhere: Groupname setVariable ["ws_cacheExcl",true];

PARAMETERS
1. Unit to be checked from 										| MANDATORY
2. Distance to unit to be checked for player	| OPTIONAL - default is 1000

RETURNS
true or false
*/


_unit = _this select 0;
_distance = if (count _this > 1) then [{_this select 1},{1000}];

private ["_position"];
_position = [_unit] call ws_fnc_getpos;
{
	if ((_position distance _x) < _distance) exitWith { true };
	false;
} forEach ([] call BIS_fnc_listPlayers);