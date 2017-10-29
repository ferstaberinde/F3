params ["_unit"];
private _downInVeh = _unit getVariable ["#revDownInVeh", false];
private _originalOwner = _unit getVariable ["#revOwner", -1];

if (_downInVeh && _originalOwner == clientOwner) then {
    F_UncCC ppEffectEnable false;
    private _camera = player;
    selectPlayer _unit;
    [_camera] joinSilent grpNull;
    deleteVehicle _camera;
    [] spawn {
        sleep 0.5;
        [] call f_fnc_activateSpectator;
    }
};
