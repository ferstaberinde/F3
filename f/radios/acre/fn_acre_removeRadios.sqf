// F3 - Remove ACRE Radios Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private["_unit"];

_unit = player;

// ====================================================================================

// REMOVE ALL RADIOS
// Wait for ACRE to initialise any radios the unit has in their inventory, and then
// remove them to ensure that duplicate radios aren't added by accident.

// Make sure player has a radio in their inventory
if([_unit] call acre_api_fnc_hasRadio) then {

  // Wait for radios to get initialised by ACRE
  waitUntil{!isNil "acre_sys_radio_currentRadioList"};
  waitUntil{(count acre_sys_radio_currentRadioList) > 0};

  // Remove initialised radios
  {_unit unlinkItem _x;}foreach acre_sys_radio_currentRadioList;

};
// ====================================================================================
