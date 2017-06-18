#include "\a3\functions_f_mp_mark\Revive\defines.inc"

_camera = player;
F_UncCC ppEffectEnable false;
_unit = _this select 0;
selectPlayer _unit;

[_camera] joinSilent grpNull;
_unit setVariable ["#revDownInVeh", false, true];
deleteVehicle _camera;
[_unit ] spawn {
    _unit = _this select 0;
    sleep 0.05;
    moveOut _unit;
    diag_log format ["%1 ejecting", _unit];
    sleep 0.2;
    (_unit) setPosATL ([(getPosATL (_unit)), 0.6, direction (_unit)] call BIS_fnc_relPos);
    SET_STATE(_unit,STATE_INCAPACITATED);
};