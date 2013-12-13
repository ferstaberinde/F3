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

