

[] spawn {

    if (f_param_debugMode == 1) then {
        diag_log "waiting to disable BIS death blur";
    };
    waitUntil {sleep 0.1; ppEffectEnabled BIS_DeathBlur};

    if (f_param_debugMode == 1) then {
        diag_log "diabling BIS death blur";
    };
    BIS_DeathBlur ppEffectEnable false;
};
if (f_param_debugMode == 1) then {
    diag_log "activating spectator";
};
[] spawn {
    sleep 3;
    ["Initialize", [player, [], true, true, true, false, true, true, true, true]] call BIS_fnc_EGSpectator;
};
//Remove the bird
deleteVehicle (_this select 0);
