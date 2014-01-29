/*
ws_fnc_gUncache
Latest: 15.01.2014

based on Black Mamba's work, which in turn is based on Nou and Jaynus' work. (All credit to them)

FEATURE
Enables Simulation and AI behaviour on all units but the group leader (or vehicle crew). Moves all disabled units out of view.
*/

 {
if(_x != leader _this && !("Driver" in assignedVehicleRole _x)) then {

                if (vehicle _x == _x) then {

                                        // Workaround for ws_taskDefend:
                                        // For some reason units moved by taskDefend get assigned formationPosition z-level -100 after caching
                                        _pos = _x getVariable ["ws_bpos",formationPosition _x];

                                        _x setPosATL _pos;
                };
                                _x allowDamage true;
                                _x enableSimulation true;

                                _x enableAI "TARGET";
                                _x enableAI "AUTOTARGET";
                                _x enableAI "MOVE";
                                _x enableAI "ANIM";
                                _x enableAI "FSM";
                };
} forEach units _this;

true