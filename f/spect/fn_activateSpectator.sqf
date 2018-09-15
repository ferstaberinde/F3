if (f_param_debugMode == 1) then {
    diag_log "activating spectator";
};

// 'Cinematic' delay before spectator activates
sleep 3;

// Disable post-processing effects
// Borrowed from BIS_fnc_respawnSpectator
waitUntil {missionnamespace getvariable ["BIS_fnc_feedback_allowDeathScreen", true]};
BIS_fnc_feedback_allowPP = false;

// Create a new (alive) unit to prevent draw3D bug with floating head tags
// Credit to SilentSpike: https://github.com/acemod/ACE3/pull/5868
private _cameraUnit = (createGroup sideLogic) createUnit ["VirtualMan_F", player, [], 0, "NONE"];
_cameraUnit enableSimulation false;
selectPlayer _cameraUnit;

["Initialize", [player, [], true, true, true, false, true, true, true, true]] call BIS_fnc_EGSpectator;
