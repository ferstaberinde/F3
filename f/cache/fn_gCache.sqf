// F3 - Caching Script Group Cacher
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// LOOP THROUGH THE PASSED UNITS
// We loop through the units of the passed group and disable Simulation for all of them but the leaders (to make sure that e.g. patrols still work)
{
        if(_x != leader _this && !("Driver" in assignedVehicleRole _x)) then {
                _x enableSimulationGlobal false;
        } else {
                _x enableSimulationGlobal true;
        };

                // All unit's are hidden, and if the unit is inside a vehicle, the vehicle is hidden as well

                _x hideObjectGlobal true;
                if (vehicle _x != _x) then {(vehicle _x) hideObjectGlobal true};

sleep 0.1;
} forEach units _this;

true;