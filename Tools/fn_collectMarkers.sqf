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
["mkrCache"] call ws_fnc_collectMarkers - returns an array with all markers named mkrCache, mkrCache_1, mkrCache_2, mkrCache_n
*/

private ["_markers","_done"];

_markers = [_this select 0];
_done = false;
_i = 0;

//Start the loop
while {!_done} do {
	_i = _i + 1;						//increment index
	_mkr = format ["%1_%2",(_markers select 0),_i];	//and form a string that should correspond with a marker name
	if (str(getMarkerPos _mkr) == "[0,0,0]" || _i > 500) exitWith {_done = true};  //if the marker doesn't exist (has position [0,0,0]) or for some reason we've been looping too long it exits
	_markers = _markers + [_mkr];		//if it doesn't exit the marker must exist and we add it to the array
};

_markers