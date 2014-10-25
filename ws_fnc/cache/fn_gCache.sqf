/*
ws_fnc_gCache
Latest: 15.01.2014

based on Black Mamba's work, which in turn is based on Nou and Jaynus' work. (All credit to them)

FEATURE
Disables Simulation and AI behaviour on all units but the group leader (or vehicle crew). Moves all disabled units out of view.
*/

// LOOP THROUGH THE PASSED UNITS
// We loop through the units of the passed group and disable Simulation for all of them but the leaders (to make sure that e.g. patrols still work)
{
        if(_x != leader _this && !("Driver" in assignedVehicleRole _x)) then {
                _x enableSimulation false;
                _x allowDamage false;
        } else {
                _x allowDamage true;
                _x enableSimulation true;
        };

                // All unit's are hidden, and if the unit is inside a vehicle, the vehicle is hidden as well

                _x hideObject true;
                if (vehicle _x != _x) then {(vehicle _x) hideObject true};

} forEach units _this;