// F3 Zeus Support - Add Objects
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private ["_curator","_mode","_objects","_getGlobalVars"];

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_curator = [_this,0,objNull] call bis_fnc_param;
_mode = [_this,1,[],[true,west,objNull,[]]] call bis_fnc_param;
_groupleaders = [_this,2,false] call bis_fnc_param;

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

// Decide which objects to add based on passed mode

_objects = [];
switch (typeName _mode) do {
	case "ARRAY": {_objects = _mode};
	case "OBJECT": {_objects = [_mode]};
	case "SIDE": {
		{if (side _x == _mode && {!(vehicle _x in _objects)}) then {_objects pushback (vehicle _x)}} forEach allUnits;
	};
	case "BOOL": {
		 if (_mode) then {
		 	_objects = allMissionObjects "";

		 	//To prevent unnecessary stress on the network compare the the new _objects array to the existing curator objects. If they are identical, reset _objects to an empty array
		 	if (_objects isEqualTo (curatorEditableObjects _curator)) then {
		 		_objects = [];
		 	};

		 }
		 else {
		 	_curator removeCuratorEditableObjects [curatorEditableObjects _curator,true];
		 };

	 };
};

// Reduce list to group-leaders and empty vehicles if desired
_leaders = [];
if (_groupLeaders) then {
	{
		if ((isNull group _x) || _x == leader group _x) then {
			_leaders pushBack (vehicle _x);
		};
	} forEach _objects;
	_objects = _leaders;
};

// Add all selected objects to curator lists
_curator addCuratorEditableObjects [_objects,true];