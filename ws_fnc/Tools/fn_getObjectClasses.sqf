/* ws_fnc_getObjectClasses
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Returns array of object classes

USAGE
[ojects] call ws_fnc_getObjectClasses

*/

params["_objects"];
private _arr = [];

{
	_arr pushback (typeOf _x);
} forEach _objects;

_arr