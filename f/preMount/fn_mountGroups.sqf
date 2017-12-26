// F3 - Mount Groups Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE SCRIPT IS ONLY RUN SERVER-SIDE
if (!isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_crew","_vehs","_grps","_all_grps","_fill"];

// ====================================================================================

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

params [["_objects", []], ["_crew", true], ["_fill", false]];
//_objects: Vehicles and units.
//_crew: Mount into crew positions? (optional - default:true)
//_fill: Ignore fireteam cohesion in favor of filling vehicles? (optional - default:false)

// ====================================================================================

// PROCESS UNITS/GROUPS

//Get all non-vehicle groups
_all_grps = _objects select {_x isKindOf "CAManBase"} apply {group _x};
//remove duplicates
_all_grps = _all_grps arrayintersect _all_grps;
//only take groups where at least one unit is not in a vehicle
_grps = _all_grps select { count (units _x) > 0 && {isNull (assignedVehicle _x)} count (units _x) > 0 };

// ====================================================================================

// PROCESS VEHICLES

//Get all vehicles
_vehs = _objects select {!(_x isKindOf "CAManBase")};
//remove duplicates
_vehs = _vehs arrayintersect _vehs;
//Add vehicles from synced units
{
	{
		private _veh = assignedVehicle _x;
		if (!isNull _veh) then {
			_vehs pushBackUnique _veh;
		};
	} forEach (units _x);
} forEach _all_grps;

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
	_grpsT = _grps;
	// As long there are spare seats and groups left

	while {_emptyPositions > 0 && count _grpsT > 0 && locked _veh != 2} do {

		private ["_grp","_units","_run","_unit","_slot","_path"];

		_grp = _grpsT select 0;
		_units = units _grp;
		_run = true;

		// If fireteam cohesion should be kept count the available vehicle slots, compared to the units in the group that would need a seat
		if (!_fill && {{isNull assignedVehicle _x} count _units > _emptyPositions}) then {

			_run = false;

			//Remove groups that would need to be split up
			_grpsT = _grpsT - [_grp];
		};

		if (_run) then {

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

			// Remove the processed group from the temporary array
			_grpsT = _grpsT - [_grp];
		};

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
