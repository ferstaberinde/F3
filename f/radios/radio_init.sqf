// F3 - Radio Framework initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN RELEVANT SCRIPTS, DEPENDING ON SYSTEM IN USE
// Each radio modification requires a different set of scripts to be used, and so we
// split into a seperate script file for initialisation of each mod, on both the
// server and client.

// Wait for parameter to be initialised
waitUntil{!isNil "f_var_radios"};

// If any radio system selected
if(f_var_radios != 0) then {

  switch (f_var_radios) do {
  // ACRE
  case 1: {
    [] execVM "f\radios\acre\acre_init.sqf";
  };

  // TFR
  case 2: {
    [] execVM "f\radios\tfr\tfr_init.sqf";
  };
  // acre2
  case 3: {
    [] execVM "f\radios\acre2\acre2_init.sqf";
  };

  };
};

// ====================================================================================
