/*ws_fnc_collectMarkers
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Collect all existing markers based on the parsed naming scheme

USAGE
["markerName"] call ws_fnc_collectMarkers

RETURNS
Array of all existing markers

PARAMETERS
1. Marker name (string) - must be name all other markers are based on.

EXAMPLE
["mkrCache","mkrHouse"] call ws_fnc_collectMarkers - returns an array with all markers named mkrCache and mkrHouse ["mkrCache","mkrCache_1","mkrCache_2","mkrHouse_Defend","mkrHouse_Hold"]
*/

private ["_arr"];

_arr = [];

if (typeName _this != typeName []) then {
	_this = [_this];
};

{
	_marker = _x;
	{
	    if (_x find _marker != -1) then {
	       _arr append [_x];
	    };
	} forEach allMapMarkers;
} forEach _this;

_arr