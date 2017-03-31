/*ws_fnc_collectObjectsNum
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Collects all existing objects that are copies of the original, as indicated by an appended number (Obj,Obj_1,Obj_2 etc.)

USAGE
[Object1,Object2] call ws_fnc_collectObjectsNum

RETURNS
Array of all existing objects that share the name

PARAMETERS
Objects - must be existing and the original object on which the copies are based on

EXAMPLE
[Cache,Church] call ws_fnc_collectObjectsNum - returns an array with all objects with "Cache" and "Church" and those following in a numeric order: [Cache,Cache_1,Cache_2,Church,Church_1,Church_2]
*/

private ["_arr","_done"];

_arr = [];

//Start the loop
_i = 0;
_done = false;

if (typeName _this != typeName []) then {
	_this = [_this];
};

{
	while {true} do {
		_obj = "";

		if (_i > 0) then {
			_obj = format ["%1_%2",_x,_i];
		} else {
			_obj = format ["%1",_x];
		};

		if (isNil _obj || _i > 500) exitWith {_i = 0;};

		// If the object exists, add it to the array
		call compile format ["_arr append [%1]",_obj];
		_i = _i + 1;
	};
} forEach _this;

_arr