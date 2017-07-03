#include "\a3\functions_f_mp_mark\Revive\defines.inc"

params ["_unit"];
_camera = player;
F_UncCC ppEffectEnable false;
selectPlayer _unit;

[_camera] joinSilent grpNull;
_unit setVariable ["#revDownInVeh", false, true];
deleteVehicle _camera;
[_unit ] spawn {
    params ["_unit"];
    sleep 0.05;
    moveOut _unit;
    sleep 0.2;
    (_unit) setPosATL (_unit getPos [0.6, direction _unit]);
    SET_STATE(_unit,STATE_INCAPACITATED);
};
