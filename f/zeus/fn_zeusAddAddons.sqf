// F3 Zeus Support - Add Addons
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// DECLARE VARIABLES

private ["_addons","_cfgPatches","_class"];

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

params [
	["_curator", objNull],
	["_mode", true, ["",true,[]]]
];

// ====================================================================================

// RESOLVE CURATOR VARIABLE
// If the passed unit is not in the list of all curators, check whether the curator is assigned to it

if !(_curator in allCurators) then {
	_curator = getAssignedCuratorLogic _curator;
};

// If curator is null or not the correct logic exit with an error message.
if (isNull _curator || typeOf _curator != "ModuleCurator_F") exitWith {
	player GlobalChat format ["DEBUG (f\zeus\fn_zeusAddAddons.sqf): Could not resolve curator properly, is either null or not the correct type. IsNull = %1, _curator type : %2 (should be ModuleCurator_F)",isNull _curator,typeOf _curator];
};

// ====================================================================================

// Decide which addons to add based on passed mode
_addons = [""];

switch (typeName _mode) do {
	case "ARRAY": {_addons = _mode};
	case "STRING": {_addons = [_mode]};
	case "BOOL": {
		if (_mode) then {
			// If the mode is passed as true, set up the curator module as if its Addons drop-down in the editor was set to "All addons (including unofficial)"
			_curator setVariable ["Addons",3,true];
		} else {
			// If the mode is passed as false, set up the curator module as if its Addons drop-down in the editor was set to "No addons"
			_curator setVariable ["Addons",0,true];
		};
	};
};

// Enable addons to the curator
_curator addcuratoraddons _addons;
