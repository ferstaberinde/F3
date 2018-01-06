/*
ws_fnc_listPlayers

FEATURE
Lists all players

USAGE
[] call ws_fnc_listPlayers

RETURNS
array containing all players
*/

playableUnits select {isPlayer _x}
