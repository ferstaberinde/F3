// F3 - Disable Thermals
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_allowedList", "_allowedTypes", "_allowedUnits"];

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

params [["_allowedList", [], [[]]]];

f_var_disableThermals_enabled = true;

// INTERPRET RESTRICTED ARRAY
// Loop through the array containing the allowed classes and units and split them into two

_allowedTypes = [];
_allowedUnits = [];
{
	if (_x isEqualType "") then {_allowedTypes pushBack _x};
	if (_x isEqualType objNull) then {_allowedUnits pushBack _x};
} forEach _allowedList;

// PERFORM CHECKS
// Check if any vehicle is one of the allowed vehicles or in the allowed types, if not, disable their thermals.
if (isServer) then {
	{
		private _vehicleToCheck = _x;

		if (_vehicleToCheck in _allowedUnits || {{_vehicleToCheck isKindOf _x} count _allowedTypes > 0}) then {
			// This is an allowed vehicle, ignore it
		} else {
			_vehicleToCheck disableTIEquipment true;
			_vehicleToCheck setVariable ["f_var_TIDisabled",true,true];
		}
	} foreach vehicles;
};

// HANDLE ASSEMBLED VEHICLES
// Create event handler to disable thermals on assembled vehicles (e.g. UAV) unless that type is allowed to have thermals

// Need to export _allowedTypes so that the event handler can access it
f_var_disableThermals_allowedTypes = _allowedTypes;

if (hasinterface && isNil "f_eh_disableThermals") then {
	f_eh_disableThermals = player addEventHandler ["WeaponAssembled", {
		params ["", ["_assembled", objNull, [objNull]]];

		if ({_assembled isKindOf _x} count f_var_disableThermals_allowedTypes == 0) then {
			_assembled disableTIEquipment true;
			_vehicleToCheck setVariable ["f_var_TIDisabled",true,true];
		}
	}];
};
