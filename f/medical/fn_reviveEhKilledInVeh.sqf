_unit = _this select 0;
_downInVeh = _unit getVariable ["#revDownInVeh", false];
_originalOwner = _unit getVariable ["#revOwner", -1];

diag_log format["down in veh %1", _downInVeh];
if (_downInVeh && _originalOwner == clientOwner) then {
    F_UncCC ppEffectEnable false;
    _camera = player;
    selectPlayer (_this select 0);
    [_camera] joinSilent grpNull;
    deleteVehicle _camera;
    [] spawn {
        sleep 0.5;
        [] spawn f_fnc_activateSpectator;
    }
};