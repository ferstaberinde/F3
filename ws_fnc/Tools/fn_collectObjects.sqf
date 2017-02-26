/*ws_fnc_collectObjects
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Collects all existing objects that contain the strings parsed.

NOTE
This command can be taxing in missions with a lot of objects. Use collectObjectsNum alternatively.

USAGE
["Name1","Name2"] call ws_fnc_collectObjects

RETURNS
Array of all existing objects that share the name

PARAMETERS
String - must be part of all object names that should be collected

EXAMPLE
["Cache","Church"] call ws_fnc_collectObjects - returns an array with all objects with "Cache" and "Church" in their name: [Cache,Cache_1,Cache_2,Church_Attack,Church_Hold]
*/

private ["_arr"];

_arr = [];

{
	_obj = _x;
	{
	    if ([_obj, format ["%1",_x]] call BIS_fnc_inString) then {
	       _arr append [_x];
	    };
	} forEach allMissionObjects "ALL";
} forEach _this;

_arr