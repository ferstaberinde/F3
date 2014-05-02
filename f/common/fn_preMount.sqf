// MAKE SURE THE SCRIPT IS ONLY RUN SERVER-SIDE
if (!isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_objects","_crew","_vehs","_grps","_units"];

// ====================================================================================

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

_vehs = _this select 0;
_grps = _this select 1;
_crew = if (count _this > 2) then {_this select 2} else {true};
_fill = if (count _this > 3) then {_this select 3} else {false};

// ====================================================================================

// CLEAN THE GROUP ARRAY
// First we check if there are illegal groups in the array and fix it accordingly

if ({isNil _x} count _grps > 0) then {
	{
		if (isNil _x) then {
			_grps set [_forEachIndex,grpNull];
		};

	} forEach _grps;
	_grps = _grps - [grpNull];
};

// ====================================================================================

// PROCESS VARIABLES
// We make sure that there are only vehicles in the vehicle array
// If a soldier-unit is in the array then we check if we can use the vehicle he's in
{
 if (_x isKindOf "CAManBase") then {
 	if (vehicle _x != _x) then {
 		_vehs set [_forEachIndex,vehicle _x];
 	} else {
 		_vehs = _vehs - [_x];
 	};
 };
} forEach _vehs;


// We check the passed groups to make sure none of them is empty and they have at least one unit that's not inside a vehicle
{
	_grp = call compile format ["%1",_x];
	_grps set [_forEachIndex,_grp];

	if (count (units _grp) == 0 || {isNull (assignedVehicle _x)} count (units _grp) == 0) then {
	 	_grps = _grps - [_grp];
	};

} forEach _grps;

// ====================================================================================

// CHECK ARRAY COUNT
// If any of the arrays is empty we don't need to execute the function and exit with a warning message.

if (count _vehs == 0 || count _grps == 0) exitWith {
	player globalchat format ["f_fnc_preMount DBG: No vehicles and/or groups were parsed! _vehicles: %1,_grps: %2",_vehs,_grps];
	diag_log format ["f_fnc_preMount DBG: No vehicles and/or groups were parsed! _vehicles: %1,_grps: %2",_vehs,_grps];
};

// ====================================================================================

// MOUNT UNITS
// We loop through all vehicles and assign crew & cargo accordingly

{
	private ["_veh","_grpsT","_emptyPositions"];
	_veh = _x;
	_crew = if (count _this > 2) then {_this select 2} else {true};

	// Check if there are any spare seats.
	_emptyPositions = 0;
	{_emptyPositions = _emptyPositions + (_veh emptyPositions _x)} forEach ["driver","commander","gunner","cargo"];

	_grpsT = _grps; 			// We need a temporary copy of the groups array

	// As long there are spare seats and groups left
	while {_emptyPositions > 0 && count _grpsT > 0 && locked _veh < 2} do {
		private ["_grp","_units","_run"];

		_grp = _grpsT select 0;
		_units = units _grp;
		_run = true;

		// If fireteam cohesion should be kept count the available vehicle slots, compared to the units in the group that would need a seat
		if (!_fill && {{isNull (assignedVehicle _x)} count _units > _emptyPositions}) then {
			_run = false;
			_grpsT = _grpsT - [_grp];
		};

	   	if (_run) then {

	  	 {
		   	private ["_unit","_cargo"];
			_unit = _x;

				if (_crew && {isNull (assignedVehicle _x)}) then {
						if ((_veh emptyPositions "Driver") > 0 && !(lockedDriver _veh)) exitWith {_unit assignAsDriver _veh;_unit moveInDriver _veh;};
						if ((_veh emptyPositions "Gunner") > 0 && !(_veh lockedTurret [0])) exitWith {_unit assignAsGunner _veh; _unit moveInGunner _veh;};
						if ((_veh emptyPositions "Commander") > 0 && !(_veh lockedTurret [1])) exitWith {_unit assignAsCommander _veh; _unit moveInCommander _veh;};
						_crew = false;
				};

				_cargo = _veh emptyPositions "Cargo";
				if (!_crew && {_cargo > 0 && isNull (assignedVehicle _x) && !(_veh lockedCargo (_cargo - 1))}) then {
					_unit moveInCargo _veh; _unit assignAsCargoIndex [_veh,(_cargo - 1)];
				};

			} forEach _units;
			_grpsT = _grpsT - [_grp];
		};

		// Check if all units in the group have been assigned a vehicle, if yes, remove the group from the array.
		if ({isNull (assignedVehicle _x)} count units _grp == 0) then {_grps = _grps - [_grp];_grpsT = _grpsT - [_grp];};

		// Recalculate the remaining seats on the vehicle
		_emptyPositions = 0;
		{_emptyPositions = _emptyPositions + (_veh emptyPositions _x)} forEach ["driver","commander","gunner","cargo"];

	};

} forEach _vehs;

// ====================================================================================

// OUTPUT
// We return all groups that weren't fully loaded
_grps