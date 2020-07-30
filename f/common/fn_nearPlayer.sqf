// F3 - Near Player Function
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
private ["_pos","_players"];

params [
	["_obj", objNull, [objNull]], 
	["_distance", 0, [0]]
];

_pos = getPosATL _obj;

// ====================================================================================

// Create a list of all players
_players = playableUnits select {isPlayer _x};

// ====================================================================================

// Check whether a player is in the given distance - return true if yes
if (({_x distance _pos < _distance} count _players) > 0) exitWith {true};
false
