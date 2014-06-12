// F3 - ACRE Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// WAIT FOR ACRE
// Give ACRE some time to initialise

sleep 3;

// ====================================================================================

// CARRY OUT CLEANUP PROCEDURE, FREQUENCY SETUP AND RADIO HANDOUT
// Clear the unit's inventory of any added radios, just in case the defaults change 
// or a mistake is made with loadouts. Then, set the frequency network up according
// to the settings in acre_settings.sqf and assign radios depending on unit loadout.

// Check player is alive
if(alive player) then {

  // Remove all existing radios
  [] call f_fnc_acre_removeRadios;

  // Set frequencies for each side
  [] call f_fnc_acre_setRadioFrequencies;

  // Wait for gear assignation to take place
  waitUntil{(player getVariable ["f_var_assignGear_done", false])};

  // Add radios to each unit
  [] call f_fnc_acre_addRadios;

  // Configure spectator chat
  [] call f_fnc_acre_configureSpectatorChat;

} else {

  // No need to fix radios, just move into spectator chat
  [] call f_fnc_acre_configureSpectatorChat;

};

// ====================================================================================
