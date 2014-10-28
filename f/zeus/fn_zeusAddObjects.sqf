// // F3 Zeus Support - Add Objects
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
_groupLeaders = [_this,2,false] call bis_fnc_param;

// ====================================================================================

// Decide which objects to add based on passed mode

_objects = [];
switch (typeName _mode) do {
	case "ARRAY": {_objects = _mode};
	case "OBJECT": {_objects = [_mode]};
	case "SIDE": {
		_getGlobalVars = [0] execVM "f\common\f_setLocalVars.sqf";
		waitUntil {scriptDone _getGlobalVars};

		_objects = switch (_mode) do {
			case west: {f_var_units_BLU};
			case blufor: {f_var_units_BLU};
			case east: {f_var_units_OPF};
			case opfor: {f_var_units_OPF};
			case resistance: {f_var_units_RES};
			case independent: {f_var_units_RES};
			case civilian: {f_var_units_CIV};
		};
	};
	case "BOOL": {
		 if (_mode) then {
		 	_objects = (vehicles+allUnits);

		 	//Safety check: To prevent unnecessary stress compare the length of the new _objects array to the existing curator objects. If they are identical, reset _objects to an empty array
		 	if (count _objects == count (curatorEditableObjects _curator)) then {
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
			_leaders pushBack _x;
		};
	} forEach _objects;
	_objects = _leaders;
};

// Add all selected objects to curator lists
_curator addCuratorEditableObjects [_objects,true];