// F3 - Caching Script Group Cacher
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// LOOP THROUGH THE PASSED UNITS
// We loop through the units of the passed group and disable Simulation for those that are not vehicle drivers and are standing still

params [
	["_group", grpNull, [grpNull]],
	["_aggressiveness", f_var_cachingAggressiveness, [0]]
];

{

	// Disable simulation based on aggressiveness
	switch (_aggressiveness) do {

		case 1: {
			if ((count (assignedVehicleRole _x) == 0 || {"Driver" != (assignedVehicleRole _x) select 0}) && (_x != leader _group)) then {
				_x enableSimulationGlobal false;
			};
		};
		case 2: {
			if (count (assignedVehicleRole _x) == 0 || {"Driver" != (assignedVehicleRole _x) select 0}) then {
				if ((_x != leader _group) || (_x == leader _group && speed _x == 0)) then {
					_x enableSimulationGlobal false;
				};
			};
		};
		case 3: {_x enableSimulationGlobal false;};
		default {systemchat format ["f_fnc_gCache DBG: f_var_cachingAggressiveness is not an accepted value: %1",f_var_cachingAggressiveness];};
	};

	// All units are hidden
	_x hideObjectGlobal true;

	if (_aggressiveness == 3) then {
		if (vehicle _x != _x) then {
			(vehicle _x) hideObjectGlobal true;
		};
	};

	sleep 0.1;
} forEach units _group;

true
