
    // Retrieve TFR relevant setting
    #include "tfr_settings.sqf"

    // If script is being run on the server
    if(isDedicated) then {

      [] execVM "f\radios\tfr\tfr_serverInit.sqf";

    } else {

      [] execVM "f\radios\tfr\tfr_clientInit.sqf";

      //If locally hosting, run both client and server script
      if((!isDedicated) && (isServer)) then {[] execVM "f\radios\tfr\tfr_serverInit.sqf";};
    };