/*ws_fnc_collectObjectsNum
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Collects all existing objects that are copies of the original, as indicated by an appended number (Obj,Obj_1,Obj_2 etc.)

USAGE
[Object1,Object2] call ws_fnc_collectObjects

RETURNS
Array of all existing objects that share the name

PARAMETERS
Objects - must be existing and the original object on which the copies are based on

EXAMPLE
[Cache,Church] call ws_fnc_collectObjectsNum - returns an array with all objects with "Cache" and "Church" and those following in a numeric order: [Cache,Cache_1,Cache_2,Church,Church_1,Church_2]
*/

private ["_arr","_done"];

_arr = [];
_done = false;
_i = 0;

//Start the loop
{
	while {!_done} do {
		_i = _i + 1;
		_obj = format ["%1_%2",_x,_i];	//and form a string that should correspond with an object name

		if (isNil _obj || _i > 500) exitWith {_done = true};

		// If the object exists, add it to the array
		call compile format ["_arr set [_i,%1]",_obj];
	};
	_done = false;
} forEach _this;

_arr