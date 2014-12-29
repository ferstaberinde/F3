// F3 - ACRE Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// ====================================================================================
// Set channels acording to side.
_ret = ["ACRE_PRC148", str (side player) ] call acre_api_fnc_setDefaultChannels;
_ret = ["ACRE_PRC343", str (side player) ] call acre_api_fnc_setDefaultChannels;
_ret = ["ItemRadio", str (side player) ] call acre_api_fnc_setDefaultChannels;

// if dead, set spectator and exit
if(!alive player) exitWith {[true] call acre_api_fnc_setSpectator;};


_unit = player;

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};
_typeOfUnit = _unit getVariable ["f_var_assignGear", "NIL"];
// REMOVE ALL RADIOS
// Wait for ACRE2 to initialise any radios the unit has in their inventory, and then
// remove them to ensure that duplicate radios aren't added by accident.

// Remove any already assigned radios
_unit unlinkItem "ItemRadio";

// Make sure the player doesn't have a radio in their inventory
if([_unit] call acre_api_fnc_hasRadio) then {

  // Wait for radios to get initialised by ACRE
  waitUntil{(count ([] call acre_api_fnc_getCurrentRadioList)) > 0};

  // Remove initialised radios
  {_unit unlinkItem _x;}foreach ([] call acre_api_fnc_getCurrentRadioList);

};

// ====================================================================================

// ASSIGN RADIOS TO UNITS
// Depending on the loadout used in the assignGear component, each unit is assigned
// a set of radios.

if(_typeOfUnit != "NIL") then {

  // If radios are enabled in the settings
  if(!f_radios_settings_acre2_disableRadios) then {
      // Everyone gets a short-range radio by default
      if(isnil "f_radios_settings_acre2_shortRange") then
      {
        _unit addItem f_radios_settings_acre2_standardSHRadio;
      }
      else
      {
        if(_typeOfUnit in f_radios_settings_acre2_shortRange) then
        {
          _unit addItem f_radios_settings_acre2_standardSHRadio;
        };
      };

      // If unit is in the above list, add a 148
      if(_typeOfUnit in f_radios_settings_acre2_longRange) then {

        _unit addItem f_radios_settings_acre2_standardLRRadio;

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
      [f_radios_settings_acre2_language_blufor select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    };
    case opfor: {
    	f_radios_settings_acre2_language_opfor call acre_api_fnc_babelSetSpokenLanguages;
      [f_radios_settings_acre2_language_opfor select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    };
    case independent: {
    	f_radios_settings_acre2_language_indfor call acre_api_fnc_babelSetSpokenLanguages;
      [f_radios_settings_acre2_language_indfor select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    };
    default {
     	f_radios_settings_acre2_language_indfor call acre_api_fnc_babelSetSpokenLanguages;
      [f_radios_settings_acre2_language_indfor select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    };
};
