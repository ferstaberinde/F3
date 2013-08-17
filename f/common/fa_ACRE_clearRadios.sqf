// F3 - ACRE Clear Radios
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

_unit = _this select 1;

// ====================================================================================

// CHECK FOR RADIO INITIALISATION
// Wait until ACRE has assigned all radio items their own unique IDs, and populated the currentRadioList.

waitUntil{!isNil "acre_sys_radio_currentRadioList"};
waitUntil{(count acre_sys_radio_currentRadioList) > 0};

// ====================================================================================

// REMOVE ALL EXISTING RADIOS
// Check for any radios that haven't been converted into unique items yet, due to errors or server-lag.

{ _isRadio = [_x] call acre_api_fnc_isRadio;
if(_isRadio) then {_unit removeItem _x};
} foreach items _unit;	

// Remove all initialised radios.

{_unit unassignItem _x; _unit removeItem _x;} foreach acre_sys_radio_currentRadioList;

waitUntil {count acre_sys_radio_currentRadioList < 1};				// Wait until radio list updated.

// ====================================================================================

// SET CUSTOM FREQUENCIES (CURRENTLY DISABLED)
// For TvTs, both sides need to have seperated radio channels, for gameplay purposes. 
// This script adds a predetermined value (0.2, 0.4 or 0.6) to each radio frequency, depending on the player's side.

_setFreqsHandle = _this execVM "f\common\fa_ACRE_setFrequencies.sqf";

// Wait until the custom frequencies per side are set before handing out more radios.

waitUntil{scriptDone _setFreqsHandle};

// ====================================================================================