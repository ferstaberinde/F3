/*ws_fnc_createCAS

FEATURE
Creates a CAS run at the given location

USAGE
MinimaL:
[position,direction] call ws_fnc_createCAS

PARAMETERS
1. Center of CAS run (can be unit, marker or position)  	| MANDATORY
2. Direction for CAS to strafe towards						| MANDATORY
3. Type of CAS run. 0: Guns only. 1: Rockets only. 2: Both.	| OPTIONAL - default is 0
4. Class of CAS plane to send.						        | OPTIONAL - default is Wipeout

RETURNS
true
*/

private ["_dummy"];

params [
	["_pos", objNull, ["", objNull, grpNull, locationNull, []]],
	["_dir", 0, [0]],
	["_type", 0, [0]],
	["_class", "B_Plane_CAS_01_F", [""]]
];

_pos = _pos call ws_fnc_getEpos;

_dummy = "LaserTargetCBase" createVehicle _pos;
_dummy enableSimulationGlobal false; _dummy hideObjectGlobal true;
_dummy setVariable ["vehicle",_class];
_dummy setVariable ["type",_type];
_dummy setDir _dir;

[_dummy,nil,true] call BIS_fnc_moduleCAS;

[_dummy] spawn {
	params [["_object", objNull, [objNull]]];
	sleep 10;
	deleteVehicle _object;
};

true
