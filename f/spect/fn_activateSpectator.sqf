[] spawn {
    sleep 0.5;
    BIS_DeathBlur ppEffectEnable false;
};

diag_log "activating spect";
["Initialize", [player, [], true, true, true, false, true, true, true, true]] call BIS_fnc_EGSpectator;
