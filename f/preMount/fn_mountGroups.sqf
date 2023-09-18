// F3 - Mount Groups Function
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// MAKE SURE THE SCRIPT IS ONLY RUN SERVER-SIDE
if (!isServer) exitWith {};

// ====================================================================================

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

params [
	["_vehs", [], [[]]],
	["_grps", [], [[]]],
	["_crew", true, [true]],
	["_fill", false, [false]]
];

//_vehs: Array of vehicles    (objects) 
//_grps: Array of group names (as strings)
//_crew: Mount into crew positions? (optional - default:true)
//_fill: Ignore fireteam cohesion in favor of filling vehicles? (optional - default:false)

// ====================================================================================

// CLEAN THE GROUP ARRAY

// First we check if there are illegal groups (non-existent) in the array and remove them.
_grps = _grps select {!isNil _x};
// Remove duplicates
_grps = _grps arrayintersect _grps;
// Transform list of strings to list of groups
_grps = _grps apply {call compile format ["%1",_x]};
// Only take groups where at least one unit is not in a vehicle
_grps = _grps select { count (units _x) > 0 && {isNull (assignedVehicle _x)} count (units _x) > 0 };

// ====================================================================================

// PROCESS VEHICLES
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

//remove duplicates
_vehs = _vehs arrayintersect _vehs;

// ====================================================================================

// MOUNT UNITS
// We loop through all vehicles and assign crew & cargo accordingly

{
	private ["_veh","_grpsT","_emptyPositions","_vehicleRoles"];
	_veh = _x;

	// Calculate the number of spare seats
	_emptyPositions = [typeOf _veh,true] call BIS_fnc_crewCount; // Count all available slots(this includes co-pilot, commander, main-gunner etc.)
	_emptyPositions = _emptyPositions - (count crew _veh); 		// Substract number of crew already present in the vehicle
	_vehicleRoles = (typeOf _veh) call bis_fnc_vehicleRoles;	// All available roles for the vehicle

	// Temporary group array
	_grpsT = +_grps;
	// As long there are spare seats and groups left

	while {_emptyPositions > 0 && count _grpsT > 0 && locked _veh != 2} do {

		private ["_grp","_units","_unit","_slot","_path"];

		_grp = _grpsT select 0;
		_units = units _grp;

		// If fireteam cohesion should be kept count the available vehicle slots, compared to the units in the group that would need a seat
		if (!_fill && {{isNull assignedVehicle _x} count _units > _emptyPositions}) then {
			//Don't process group that would need to be split up, simply remove it from the array.
		} else {
			// Loop through all vehicle roles and place the units in them accordingly
			{
				_unit = _units select 0;
				_slot = _x select 0;
				_path = _x select 1;

				// If the slot is not a cargo slot and crew should be slotted
				if (_crew && {_slot != "CARGO" && isNull assignedVehicle _unit}) then{
					if (_slot == "Driver" && (_veh emptyPositions "Driver") > 0 && !(lockedDriver _veh)) exitWith {_unit assignAsDriver _veh;_unit moveInDriver _veh;};
					if (_slot == "Turret" && !(_veh lockedTurret _path) && isNull (_veh TurretUnit _path)) exitWith {_unit assignAsTurret [_veh,_path];_unit moveInTurret [_veh,_path];};
				};

				if (_slot == "CARGO" && isNull assignedVehicle _unit && !(_veh lockedCargo (_path select 0))) then {
					_unit assignAsCargo _veh; _unit moveInCargo _veh;
				};

				// If the unit was assigned, remove it so we can use the next unit. If it wasn't, use it again to find a useable seat
				if (!isNull (assignedVehicle _unit)) then {
					_units = _units - [_unit];
				};

				// If no units are left, exit
				if (count _units == 0) exitWith {};

			} forEach _vehicleRoles;
		};

		// Remove the processed/skipped group from the temporary array
		_grpsT = _grpsT - [_grp];

		// Check if all units in the group have been assigned a vehicle, remove group from both group arrays
		if ({isNull assignedVehicle _x} count (units _grp) == 0) then {_grpsT = _grpsT - [_grp];_grps = _grps - [_grp]};

		if (count _grpsT == 0) exitWith {};

		// Recalculate the remaining seats on the vehicle
		_emptyPositions = [typeOf _veh,true] call BIS_fnc_crewCount; // Count all available slots(this includes co-pilot, commander, main-gunner etc.)
		_emptyPositions = _emptyPositions - (count crew _veh); // Substract number of crew already present in the vehicle
	};

} forEach _vehs;

// ====================================================================================

// OUTPUT
// We return all groups that weren't fully loaded
_grps
