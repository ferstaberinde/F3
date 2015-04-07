// F3 Zeus Support - Add Addons
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private ["_curator","_mode","_addons","_cfgPatches","_class"];

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_curator = [_this,0,objNull] call bis_fnc_param;
_mode = [_this,1,true,["",true,[]]] call bis_fnc_param;

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
_curator setVariable ["Addons",0,true];

switch (typeName _mode) do {
	case "ARRAY": {_addons = _mode};
	case "STRING": {_addons = [_mode]};
	case "BOOL": {
		if (_mode) then {
			_curator setVariable ["Addons",3,true];
			// If true was passed, add all available addons to curator list
			_cfgPatches = configfile >> "cfgpatches";
			for "_i" from 0 to (count _cfgPatches - 1) do {
				_class = _cfgPatches select _i;
				if (isclass _class) then {_addons pushBack (configname _class);};
			};
			_addons call bis_fnc_activateaddons;
			removeallcuratoraddons _curator;
		} else {
			_curator setVariable ["Addons",0,true];
			removeallcuratoraddons _curator;
		};
	};
};

// Enable addons to the curator
_curator addcuratoraddons _addons;