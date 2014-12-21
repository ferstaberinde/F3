// F3 Zeus Support - Sync Curators
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private ["_curator"];

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_curator = [_this,0,objNull] call bis_fnc_param;

// ====================================================================================

// RESOLVE CURATOR VARIABLE
// If the passed unit is not in the list of all curators, check whether the curator is assigned to it

if !(_curator in allCurators) then {
	_curator = getAssignedCuratorLogic _curator;
};

// If _curator is null or not the correct logic exit with an error message.
if (isNull _curator || typeOf _curator != "ModuleCurator_F") exitWith {
	player GlobalChat format ["DEBUG (f\zeus\fn_zeusSyncCurators.sqf): Could not resolve curator properly, is either null or not the correct logic. IsNull = %1, _curator type: %2",isNull _curator,typeOf _curator];
};

// ====================================================================================

// Add existing units from other curators to the selected curators list and set up the EHs
{
	_curator addCuratorEditableObjects [curatorEditableObjects _x,true];
	_x addEventHandler ['CuratorObjectPlaced',{_curator addCuratorEditableObjects [(_this select 1),true];}];
} forEach allCurators - [_curator];