// F3 - F3 Common Local Variables
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// ====================================================================================
// DEBUG DEFINES

#define DEBUG_OUTPUT(ARG) if (f_param_debugMode == 1) then { systemChat format ["DEBUG (f\common\f_setLocalVars.sqf): %1 = %2", #ARG, ARG]; };

// ====================================================================================

// COMMON VARIABLE: f_var_units
// We will create an array containing all units.

f_var_units = allUnits + vehicles;

DEBUG_OUTPUT(f_var_units);

// ====================================================================================

// COMMON VARIABLE: f_var_units_BLU
// Using f_var_units we will create an array containing all BLUFOR units.

f_var_units_BLU = f_var_units select { (side _x) == west };

DEBUG_OUTPUT(f_var_units_BLU);

// ====================================================================================

// COMMON VARIABLE: f_var_units_RES
// Using f_var_units we will create an array containing all resistance units.

f_var_units_RES = f_var_units select { (side _x) == resistance };

DEBUG_OUTPUT(f_var_units_RES);

// ====================================================================================

// COMMON VARIABLE: f_var_units_OPF
// Using f_var_units we will create an array containing all OPFOR units.

f_var_units_OPF = f_var_units select { (side _x) == east };

DEBUG_OUTPUT(f_var_units_OPF);

// ====================================================================================

// COMMON VARIABLE: f_var_units_CIV
// Using f_var_units we will create an array containing all civilian units.

f_var_units_CIV = f_var_units select { (side _x) == civilian };

DEBUG_OUTPUT(f_var_units_CIV);

// ====================================================================================

// COMMON VARIABLE: f_var_men
// Using the master trigger we will create an array containing all men.

f_var_men = f_var_units select { _x isKindOf "CAManBase" };

DEBUG_OUTPUT(f_var_men);

// ====================================================================================

// COMMON VARIABLE: f_var_men_BLU
// Using f_var_men we will create an array containing all BLUFOR men.

f_var_men_BLU = f_var_men select { (side _x) == west };

DEBUG_OUTPUT(f_var_men_BLU);

// ====================================================================================

// COMMON VARIABLE: f_var_men_RES
// Using f_var_men we will create an array containing all resistance men.

f_var_men_RES = f_var_men select { (side _x) == resistance };

DEBUG_OUTPUT(f_var_men_RES);

// ====================================================================================

// COMMON VARIABLE: f_var_men_OPF
// Using f_var_men we will create an array containing all OPFOR men.

f_var_men_OPF = f_var_men select { (side _x) == east };

DEBUG_OUTPUT(f_var_men_OPF);

// ====================================================================================

// COMMON VARIABLE: f_var_men_CIV
// Using f_var_men we will create an array containing all civilian men.

f_var_men_CIV = f_var_men select { (side _x) == civilian };

DEBUG_OUTPUT(f_var_men_CIV);

// ====================================================================================

// COMMON VARIABLE: f_var_men_players
// Using f_var_men we will create an array containing all players.

f_var_men_players = f_var_men select { isPlayer _x };

DEBUG_OUTPUT(f_var_men_players);

// ====================================================================================

// COMMON VARIABLE: f_var_groups_BLU
// We will create an array containing all BLUFOR groups.

f_var_groups_BLU = allGroups select {side _x == west};

DEBUG_OUTPUT(f_var_groups_BLU);

// ====================================================================================

// COMMON VARIABLE: f_var_groups_RES
// We will create an array containing all resistance groups.

f_var_groups_RES = allGroups select {side _x == resistance};

DEBUG_OUTPUT(f_var_groups_RES);

// ====================================================================================

// COMMON VARIABLE: f_var_groups_OPF
// We will create an array containing all OPFOR groups.

f_var_groups_OPF = allGroups select {side _x == east};

DEBUG_OUTPUT(f_var_groups_OPF);

// ====================================================================================

// COMMON VARIABLE: f_var_groups_CIV
// We will create an array containing all civilian groups.

f_var_groups_CIV = allGroups select {side _x == civilian};

DEBUG_OUTPUT(f_var_groups_CIV);

// ====================================================================================

// COMMON VARIABLE: f_var_groups
// We will create an array containing all groups.

f_var_groups = allGroups;

DEBUG_OUTPUT(f_var_groups);

// ====================================================================================

// COMMON VARIABLE: f_var_groups_players
// We will create an array containing all groups with at least one player.

f_var_groups_players = f_var_groups select { {isPlayer _x} count units _x >= 1 };

DEBUG_OUTPUT(f_var_groups_players);

// ====================================================================================

// COMMON VARIABLE: f_var_vehicles
// We will create an array containing all vehicles.

f_var_vehicles = vehicles;

DEBUG_OUTPUT(f_var_vehicles);

// ====================================================================================

// COMMON VARIABLE: f_var_vehicles_BLU
// Using f_var_vehicles we will create an array containing all BLUFOR vehicles.

f_var_vehicles_BLU = f_var_vehicles select {side _x == west};

DEBUG_OUTPUT(f_var_vehicles_BLU);

// ====================================================================================

// COMMON VARIABLE: f_var_vehicles_RES
// Using f_var_vehicles we will create an array containing all resistance vehicles.

f_var_vehicles_RES = f_var_vehicles select {side _x == resistance};

DEBUG_OUTPUT(f_var_vehicles_RES);

// ====================================================================================

// COMMON VARIABLE: f_var_vehicles_OPF
// Using f_var_vehicles we will create an array containing all OPFOR vehicles.

f_var_vehicles_OPF = f_var_vehicles select {side _x == east};

DEBUG_OUTPUT(f_var_vehicles_OPF);

// ====================================================================================

// COMMON VARIABLE: f_var_vehicles_CIV
// Using f_var_vehicles we will create an array containing all civilian vehicles.

f_var_vehicles_CIV = f_var_vehicles select {side _x == civilian};

DEBUG_OUTPUT(f_var_vehicles_CIV);
