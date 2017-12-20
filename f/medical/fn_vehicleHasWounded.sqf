#include "\a3\functions_f_mp_mark\Revive\defines.inc"

params ["_vehicle"];

private _return = false;

{
	if (IS_DISABLED(_x)) exitWith {_return = true};
} forEach crew _vehicle;

_return;