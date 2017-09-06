/*ws_fnc_createLightning

FEATURE
Creates a ZEUS lighting at the given location

USAGE
position call ws_fnc_createLightning

PARAMETERS
1. Center of Lightning strike (can be unit, marker or position)	| MANDATORY

RETURNS
true
*/

private ["_pos","_dummy"];

_pos = _this call ws_fnc_getEPos;

_dummy = "LaserTargetCBase" createVehicle _pos;
_dummy enableSimulationGlobal false; _dummy hideObjectGlobal true;

[_dummy,nil,true] call BIS_fnc_moduleLightning;

[_dummy] spawn {
	sleep 10;

	deleteVehicle (_this select 0);
};

true