// F3 - ACRE Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// if dead, set spectator and exit
if(!alive player) exitWith {[true] call acre_api_fnc_setSpectator;};


_unit = player;


// REMOVE ALL RADIOS
// Wait for ACRE2 to initialise any radios the unit has in their inventory, and then
// remove them to ensure that duplicate radios aren't added by accident.

// Make sure player has a radio in their inventory
if([_unit] call acre_api_fnc_hasRadio) then {

  // Wait for radios to get initialised by ACRE
  waitUntil{(count ([] call acre_api_fnc_getCurrentRadioList)) > 0};

  // Remove initialised radios
  {_unit unlinkItem _x;}foreach ([] call acre_api_fnc_getCurrentRadioList);

};
// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

_typeOfUnit = _unit getVariable ["f_var_assignGear", "NIL"];

// ====================================================================================

// ASSIGN RADIOS TO UNITS
// Depending on the loadout used in the assignGear component, each unit is assigned
// a set of radios.

if(_typeOfUnit != "NIL") then {

  // If radios are enabled in the settings
  if(!f_radios_settings_acre2_disableRadios) then {
      // Everyone gets a short-range radio by default
      _unit linkItem "ACRE_PRC343";

      // Set the list of units that get a 148
      _longRange = ["co", "dc", "m", "mmgg", "matg", "mtrg", "sn","vc", "pp", "eng", "engm", "uav", "div"];

      // If unit is in the above list, add a 148
      if(_typeOfUnit in _longRange) then {

        _unit addItem "ACRE_PRC148";

        // If unit is in the list of units that receive an extra long-range radio, add another 148
        if(_typeOfUnit in f_radios_settings_acre2_extraRadios) then {
          _unit addItem f_radios_settings_acre2_extraRadio;
        };

      };

  };
};
// ====================================================================================

// Set language of the units depending on side (BABEL API)
switch (side _unit) do {
    case blufor: {
    	f_radios_settings_acre2_language_blufor call acre_api_fnc_babelSetSpokenLanguages;
      f_radios_settings_acre2_language_blufor call acre_api_fnc_babelSetSpeakingLanguage;
    };
    case opfor: {
    	f_radios_settings_acre2_language_opfor call acre_api_fnc_babelSetSpokenLanguages;
      f_radios_settings_acre2_language_opfor call acre_api_fnc_babelSetSpeakingLanguage;
    };
    case independent: {
    	f_radios_settings_acre2_language_indfor call acre_api_fnc_babelSetSpokenLanguages;
      f_radios_settings_acre2_language_indfor call acre_api_fnc_babelSetSpeakingLanguage;
    };
    default {
     	f_radios_settings_acre2_language_indfor call acre_api_fnc_babelSetSpokenLanguages;
      f_radios_settings_acre2_language_indfor call acre_api_fnc_babelSetSpeakingLanguage;
    };
};
systemChat "DONE";