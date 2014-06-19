/*ws_fnc_collectObjects
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Collects all existing objects based on the parsed original

USAGE
[object] call ws_fnc_collectObjects

RETURNS
Array of all existing objects following the name

PARAMETERS
1. Object - must be name all other objects are based on.

EXAMPLE
[Cache] call ws_fnc_collectMarkers - returns an array with all objects named Cache, Cache_1, Cache_2... Cache_n
*/

private ["_arr","_done"];

_arr = [_this select 0];
_done = false;
_i = 0;

//Start the loop
while {!_done} do {
	_i = _i + 1;
	_obj = format ["%1_%2",(_arr select 0),_i];	//and form a string that should correspond with a marker name

	if (isNil _obj || _i > 500) exitWith {_done = true};

	// If the object exists, add it to the array
	call compile format ["_arr set [_i,%1]",_obj];
};

_arr