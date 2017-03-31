/*
ws_fnc_listPlayers
Latest: 16.01.2014

FEATURE
Lists all players

USAGE
[] call ws_fnc_listPlayers

RETURNS
array containing all players
*/

_players = [];

{
	if (isPlayer _x) then {_players append (_x)};
} forEach playableUnits;

_players