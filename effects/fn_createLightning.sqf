/*ws_fnc_createCAS

FEATURE
Creates a CAS run at the given location

USAGE
[position] call ws_fnc_createLightning

PARAMETERS
1. Center of Lightning strike (can be unit, marker or position)	| MANDATORY

RETURNS
true
*/

_pos = _this call ws_fnc_getEPos;
[_pos,nil,true] call BIS_fnc_moduleLightning;

true