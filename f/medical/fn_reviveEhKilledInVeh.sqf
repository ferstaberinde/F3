_unit = _this select 0;
_downInVeh = _unit getVariable ["#revDownInVeh", false];

diag_log format["down in veh %1", _downInVeh];
if (_downInVeh) then {
    diag_log "remoteExecing back to client";
    [_unit] remoteExec ["f_fnc_clientKilledEh", (_unit getVariable ["#revOwner", 2])]
};