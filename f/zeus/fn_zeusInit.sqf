// F3 Zeus Support  - Initialization
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES

private ["_curator"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

params [
	["_unit", objNull],
	["_addons", true, ["",true,[]]],
	["_objects", [], [objNull,true,[],west]],
	["_announce", false, [true]]
];

// ====================================================================================

// SETUP CURATOR

// Exit if no unit was passed
if (isNull _unit) exitWith {};

// Make sure a side logic exists, if not create it
if (isNil "f_var_sideCenter") then {
	f_var_sideCenter = createCenter sideLogic;
	publicVariable "f_var_sideCenter";
};

//Check if the passed variable _unit is a curator object.
private _unitIsCurator = (typeof _unit) isEqualTo "ModuleCurator_F";

if (_unitIsCurator) then {
	// The curator object (ModuleCurator_F) was passed as "_unit",
	// because this happens in the zeus module initialization.
	// NOTE: We cannot use getAssignedCuratorUnit to get the unit during the module initialization,
	//       so we don't have access to the unit itself in this case.
	_curator = _unit;
} else {

	// Exit if the unit is not a player
	if (!(isPlayer _unit)) exitWith {
		diag_log   format ["DEBUG (f\zeus\fn_zeusInit.sqf): Did not assign ZEUS to %1 because it is not under control of a player.",_unit];
		systemchat format ["DEBUG (f\zeus\fn_zeusInit.sqf): Did not assign ZEUS to %1 because it is not under control of a player.",_unit];
	};

	//Exit if the unit already has a curator logic assigned.
	if !(isNull (getAssignedCuratorLogic _unit)) exitWith {
		diag_log   format ["DEBUG (f\zeus\fn_zeusInit.sqf): ZEUS already assigned to %1.",_unit];
		systemchat format ["DEBUG (f\zeus\fn_zeusInit.sqf): ZEUS already assigned to %1.",_unit];
	};

	// Create a new curator logic
	_curator = (createGroup f_var_sideCenter) createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];

	// Assign the new curator logic to the passed unit
	_unit assignCurator _curator;

};

//Add desired addons
[_curator,_addons] spawn f_fnc_zeusAddAddons;

//Add desired objects
[_curator,_objects] spawn f_fnc_zeusAddObjects;

// Reduce costs for all actions
_curator setCuratorWaypointCost 0;
{_curator setCuratorCoef [_x,0];} forEach ["place","edit","delete","destroy","group","synchronize"];

// Wait until the curator module is linked with its (playable) unit:
[_curator] spawn {
	params [
		["_curator", objNull]
	];

	waitUntil {sleep 1; ! isNull getAssignedCuratorUnit _curator};

	// Run local code. e.g. event handler for placed units
	[_curator] remoteExec ['f_fnc_zeusInitLocal', _curator, true];
};

// If announce is set to true, the new curator will be announced to all players
if (_announce && !_unitIsCurator) then {
	_curator setVariable ["owner",format["%1",_unit],true];
	["Alert",[format ["%1 has become curator!",name _unit]]] remoteExec ["BIS_fnc_showNotification", 0];
};

// ====================================================================================

// Return the newly created curator
_curator
