// F3 - Medical Framework initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN RELEVANT SCRIPTS, DEPENDING ON SYSTEM IN USE
// Each medical modification requires a different set of scripts to be used, and so we
// split into a seperate script file for initialisation of each mod, on both the
// server and client.

// Wait for parameter to be initialised
waitUntil{!isNil "f_var_medical"};

// If any radio system selected
call {
    
  // Default Arma Healing
  if (f_var_medical == 0) exitWith {

    

    };

  };

  // F3 Simple Wounding System
  if (f_var_medical == 1) exitWith {
    
    

  };

  // Authentic Gameplay Modification
  if (f_var_medical == 2) exitWith {
    
    

  };

};

// ====================================================================================
