#include "\a3\functions_f_mp_mark\Revive\defines.inc"

_camera = player;
F_UncCC ppEffectEnable false;
_unit = _this select 0;
selectPlayer _unit;

(_unit) setPosATL ([(getposATL (_unit)), 1.2, direction (_unit)] call BIS_fnc_relPos);
[_camera] joinSilent grpNull;
deleteVehicle _camera;
sleep 0.05;
SET_STATE(_unit,STATE_REVIVED);
diag_log format ["%1 ejecting", _unit];
sleep 0.05;
unassignVehicle _unit;
_unit action["eject",vehicle _unit];
sleep 0.05;
SET_STATE(_unit,STATE_INCAPACITATED);