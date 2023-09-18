/* ws_fnc_getObjectClasses
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Returns array of object classes

USAGE
[objects] call ws_fnc_getObjectClasses

*/

params[
	["_objects", [], [[]]]
];

_objects apply {typeOf _x}
