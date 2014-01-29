/*
ws_fnc_gCache
Latest: 15.01.2014

based on Black Mamba's work, which in turn is based on Nou and Jaynus' work. (All credit to them)

FEATURE
Disables Simulation and AI behaviour on all units but the group leader (or vehicle crew). Moves all disabled units out of view.
*/

{
private["_pos"];
if(_x != leader _this && !("Driver" in assignedVehicleRole _x)) then {
        _x disableAI "TARGET";
        _x disableAI "AUTOTARGET";
        _x disableAI "MOVE";
        _x disableAI "ANIM";
        _x disableAI "FSM";

        _x enableSimulation false;
        _x allowDamage false;

        if (vehicle _x == _x) then {
                _pos = getPosATL _x;
                _pos set [2, -100];
                _x setPosATL _pos;
        };
} else {
        _x allowDamage true;
        _x enableSimulation true;

        _x enableAI "TARGET";
        _x enableAI "AUTOTARGET";
        _x enableAI "MOVE";
        _x enableAI "ANIM";
        _x enableAI "FSM";
};
} forEach units _this;