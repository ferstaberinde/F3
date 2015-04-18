// F3 - ACRE Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// ====================================================================================
// Set up the radio presets according to side.
_presetName = switch(side player) do {
	case west:{"default2"};
	case east:{"default3"};
	case resistance:{"default4"};
	default {"default"};
};
if (f_radios_settings_acre2_disableFrequencySplit) then {
	_presetName = "default";
};

_ret = ["ACRE_PRC343", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ACRE_PRC148", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ACRE_PRC152", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ACRE_PRC117F", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ItemRadio", _presetName ] call acre_api_fnc_setPreset;


// if dead, set spectator and exit
if(!alive player) exitWith {[true] call acre_api_fnc_setSpectator;};

_unit = player;

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

// ====================================================================================

// RADIO ASSIGNMENT

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};
_typeOfUnit = _unit getVariable ["f_var_assignGear", "NIL"];

// REMOVE ALL RADIOS
// Wait for ACRE2 to initialise any radios the unit has in their inventory, and then
// remove them to ensure that duplicate radios aren't added by accident.
waitUntil{uiSleep 0.3; !("ItemRadio" in (items _unit + assignedItems _unit))};
uiSleep 1;

waitUntil{[] call acre_api_fnc_isInitialized};
{_unit removeItem _x;} forEach ([] call acre_api_fnc_getCurrentRadioList);
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
		if (_unit canAdd f_radios_settings_acre2_standardSHRadio) then
		{
			_unit addItem f_radios_settings_acre2_standardSHRadio;
		} else {
			f_radios_settings_acre2_standardSHRadio call f_radios_acre2_giveRadioAction;
		};
      }
      else
      {
        if(_typeOfUnit in f_radios_settings_acre2_shortRange) then
        {
			if (_unit canAdd f_radios_settings_acre2_standardSHRadio) then
			{
				_unit addItem f_radios_settings_acre2_standardSHRadio;
			} else {
				f_radios_settings_acre2_standardSHRadio call f_radios_acre2_giveRadioAction;
			};
        };
      };

      // If unit is in the above list, add a 148
      if(_typeOfUnit in f_radios_settings_acre2_longRange) then {
		if (_unit canAdd f_radios_settings_acre2_standardLRRadio) then
		{
			_unit addItem f_radios_settings_acre2_standardLRRadio;
		} else {
			f_radios_settings_acre2_standardLRRadio call f_radios_acre2_giveRadioAction;
		};

        // If unit is in the list of units that receive an extra long-range radio, add another 148
        if(_typeOfUnit in f_radios_settings_acre2_extraRadios) then {
			if (_unit canAdd f_radios_settings_acre2_extraRadio) then
			{
				_unit addItem f_radios_settings_acre2_extraRadio;
			} else {
				f_radios_settings_acre2_extraRadio call f_radios_acre2_giveRadioAction;
			};
        };

      };

  };
};
