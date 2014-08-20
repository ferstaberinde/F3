// F3 - ACRE Serverside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// WAIT FOR F3 COMMON LOCAL VARIABLES

waitUntil {scriptDone f_script_setLocalVars};

// ====================================================================================

// ADD RADIOS TO VEHICLES
// Depending on the type of the vehicle, add a number of backup radios to the cargo
// of each vehicle.

// For each vehicle
{

  // Fetch vehicle type
  _typeOfVehicle = _x getVariable ["f_var_assignGear","NIL"];

  // If vehicle was assigned gear
  if(_typeOfVehicle != "NIL") then {

    switch (_typeOfVehicle) do {

      case "v_car": {
        _x addItemCargoGlobal ["ACRE_PRC343", 5];
      };

      case "v_tr": {
        _x addItemCargoGlobal ["ACRE_PRC343", 5];
        _x addItemCargoGlobal ["ACRE_PRC148", 10];
      };

      case "v_ifv": {
        _x addItemCargoGlobal ["ACRE_PRC343", 5];
        _x addItemCargoGlobal ["ACRE_PRC148", 5];
      };

    };

  };

} foreach f_var_vehicles;

// ====================================================================================
