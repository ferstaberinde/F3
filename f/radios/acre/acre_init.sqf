// F3 - ACRE Init
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// Retrieve ACRE relevant settings
#include "acre_settings.sqf"

// If script is being run on the server
if(isDedicated) then {

  [] execVM "f\radios\acre\acre_serverInit.sqf";

} else {

  [] execVM "f\radios\acre\acre_clientInit.sqf";

  // If locally hosting, run both client and server scripts
  if((!isDedicated) && (isServer)) then {[] execVM "f\radios\acre\acre_serverInit.sqf";};

};