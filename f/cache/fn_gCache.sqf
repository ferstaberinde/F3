// F3 - Caching Script Group Cacher
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// LOOP THROUGH THE PASSED UNITS
// We loop through the units of the passed group and disable Simulation for those that are not vehicle drivers and are standing still
{

	// Disable simulation based on aggressiveness
	switch (f_var_cachingAggressiveness) do {
		case 1: {
			if (!("Driver" in assignedVehicleRole _x) && (_x != leader _this)) then {
                _x enableSimulationGlobal false;
       	 	};
		};
		case 2: {
			if !("Driver" in assignedVehicleRole _x) then {
        		if ((_x != leader _this) || (_x == leader _this && speed _x == 0)) then {
                	_x enableSimulationGlobal false;
           		};
       	 	};
		};
		case 3: {_x enableSimulationGlobal false;};
	};

        // All unit's are hidden
        _x hideObjectGlobal true;

        if (f_var_cachingAggressiveness == 3) then {
          if (vehicle _x != _x) then {(vehicle _x) hideObjectGlobal true};
    	};

sleep 0.1;
} forEach units _this;

true