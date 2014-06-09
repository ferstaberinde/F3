// F3 - TFR Serverside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// WAIT FOR F3 COMMON LOCAL VARIABLES

waitUntil {scriptDone f_script_setLocalVars};

// ====================================================================================

// SET RADIO FREQUENCIES

  [] call f_fnc_tfr_setRadioFrequencies;

// ====================================================================================
/*
// ADD RADIOS TO VEHICLES -- NEED A WAY TO FIGURE OUT TO WHICH FACTION EACH VEHICLE BELONGS
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
        _x addItemCargoGlobal [_radio3, 5];
        _x addItemCargoGlobal [_radio2, 1];
      };

      case "v_tr": {
        _x addItemCargoGlobal [_radio3, 10];
        _x addItemCargoGlobal [_radio2, 5];
        _x addItemCargoGlobal [_radio1, 2];
      };

      case "v_ifv": {
        _x addItemCargoGlobal [_radio3, 5];
        _x addItemCargoGlobal [_radio2, 1];
        _x addItemCargoGlobal [_radio1, 1];
      };

    };

  };

} foreach f_var_vehicles;
*/
// ====================================================================================

// SET INDEP RADIO CODE
// Depending on the setting in tfr_settings.sqf, change INDEP radio code to the faction
// they're friendly to. If friendly to nobody or everybody, use  own code.

if(!f_radios_settings_tfr_indepUseRadioCode) then {

  private["_friendWest","_friendEast","_bluefor","_opfor"];

  _friendWest = (resistance getFriend West);
  _friendEast = (resistance getFriend east);
  _bluefor = tf_west_radio_code;
  _opfor = tf_east_radio_code;

  if ((_friendWest > 0.6) && (_friendEast < 0.6)) then {
    tf_guer_radio_code = _bluefor;
  };

  if ((_friendWest < 0.6) && (_friendEast > 0.6)) then {
    tf_guer_radio_code = _opfor;
  };

};