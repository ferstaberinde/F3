/*
ws_fnc_nearPlayer
Latest: 15.01.2014

Based on CBA_fnc_listPlayer

FEATURE
Checks if player is within distance of unit

USAGE
[unit,distance] call ws_fnc_nearPlayer

PARAMETERS
1. Entitiy to be checked from 										| MANDATORY
2. Distance to unit to be checked for player			| MANDATORY

RETURNS
true or false
*/

_ent = _this select 0;
_distance = _this select 1;

private ["_pos","_players"];
_pos = _ent call ws_fnc_getEPos;
_players = [] call ws_fnc_listPlayers;


{
	if (_pos distance _x < _distance) exitWith {true};
	false;
} forEach _players;
