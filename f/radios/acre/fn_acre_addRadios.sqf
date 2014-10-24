// F3 - Add ACRE Radios Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private["_unit", "_typeOfUnit", "_longRange"];

_unit = player;

_typeOfUnit = _unit getVariable ["f_var_assignGear", "NIL"];

// ====================================================================================

// ASSIGN RADIOS TO UNITS
// Depending on the loadout used in the assignGear component, each unit is assigned
// a set of radios.

if(_typeOfUnit != "NIL") then {

  // If radios are enabled in the settings
  if(!f_radios_settings_acre_disableRadios) then {

      // Everyone gets a short-range radio by default
      _unit linkItem "ACRE_PRC343";

      // Set the list of units that get a 148
      _longRange = ["co", "dc", "m", "mmgg", "matg", "mtrg", "sn","vc", "pp", "eng", "engm", "uav", "div"];

      // If unit is in the above list, add a 148
      if(_typeOfUnit in _longRange) then {

        _unit addItem "ACRE_PRC148";

        // If unit is in the list of units that receive an extra long-range radio, add another 148
        if(_typeOfUnit in f_radios_settings_acre_extraRadios) then {
          _unit addItem "ACRE_PRC148";
        };

      };

  };
};

// ====================================================================================
