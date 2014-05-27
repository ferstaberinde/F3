// F3 - Radio Framework initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// EXIT IF RADIO FRAMEWORK IS DISABLED
// ====================================================================================

if (f_var_radios != 0) exitWith {};

// RUN RELEVANT SCRIPTS, DEPENDING ON SYSTEM IN USE
// Each radio modification requires a different set of scripts to be used, and so we
// split into a seperate script file for initialisation of each mod, on both the
// server and client.

switch (f_var_radios) do {

  // ACRE
  case 1: {

    // Retrieve ACRE relevant settings
    #include "acre_settings.sqf"

    // If script is being run on the server
    if(isDedicated) then {

      [] execVM "f\radios\acre_serverInit.sqf";

    } else {

      [] execVM "f\radios\acre_clientInit.sqf";

      // If locally hosting, run both client and server scripts
      if((!isDedicated) && (isServer)) then {[] execVM "f\radios\acre_serverInit.sqf";};

    };

  };

  // TFR
  case 2: {

    // Retrieve TFR relevant setting
    #include "tfr_settings.sqf"

    // If script is being run on the server
    if(isDedicated) then {

      [] execVM "f\radios\tfr_serverInit.sqf";

    } else {

      [] execVM "f\radios\tfr_clientInit.sqf";

      //If locally hosting, run both client and server script
      if((!isDedicated) && (isServer)) then {[] execVM "f\radios\tfr_serverInit.sqf";};
    };

  };

};

// ====================================================================================
