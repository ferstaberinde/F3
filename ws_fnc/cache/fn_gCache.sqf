/*
ws_fnc_gCache
Latest: 15.01.2014

based on Black Mamba's work, which in turn is based on Nou and Jaynus' work. (All credit to them)

FEATURE
Disables Simulation and AI behaviour on all units but the group leader (or vehicle crew). Moves all disabled units out of view.
*/

// LOOP THROUGH THE PASSED UNITS
// We loop through the units of the passed group and disable Simulation for those that are not vehicle drivers and are standing still
{

        // Disable simulation based on aggressiveness
        switch (ws_var_cachingAggressiveness) do {
                case 1: {
                  if ((count (assignedVehicleRole _x) == 0 || {"Driver" != (assignedVehicleRole _x) select 0}) && (_x != leader _this)) then {
                            _x enableSimulationGlobal false;
                      };
                };
                case 2: {
                  if (count (assignedVehicleRole _x) == 0 || {"Driver" != (assignedVehicleRole _x) select 0}) then {
                        if ((_x != leader _this) || (_x == leader _this && speed _x == 0)) then {
                              _x enableSimulationGlobal false;
                          };
                      };
                };
                case 3: {_x enableSimulationGlobal false;};
        };

        // All unit's are hidden
        _x hideObjectGlobal true;

        if (ws_var_cachingAggressiveness == 3) then {
          if (vehicle _x != _x) then {(vehicle _x) hideObjectGlobal true};
        };

sleep 0.1;
} forEach units _this;

true