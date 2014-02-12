// F3 - Caching Script Group Cacher
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

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

sleep 0.1;
} forEach units _this;

true;