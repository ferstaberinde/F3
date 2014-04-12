/*ws_fnc_createOrdnance

FEATURE
Creates Ordnance over the given area

USAGE
[position,type] call ws_fnc_createOrdnance

PARAMETERS
1. Center of ordnance strike (can be unit, marker or position)  | MANDATORY
2. Class of ordnance - any type of artillery ammo				| MANDATORY

AMMO TYPES (examples):
"Sh_82mm_AMOS" - HE mortar
"Sh_155mm_AMOS_LG" - 155mm artillery
"R_230mm_HE" - 230mm HE rocket

RETURNS
true
*/

private ["_pos","_class","_type","_dir","_dummy"];

_pos = (_this select 0) call ws_fnc_getEPos;
_class = (_this select 1);

_dummy = "LaserTargetCBase" createVehicle _pos;
_dummy enableSimulation false; _dummy hideObject true;
_dummy setVariable ["type",_class];

[_dummy,nil,true] call BIS_fnc_moduleProjectile;

[_dummy] spawn {
	sleep 10;

	deleteVehicle (_this select 0);
};

true