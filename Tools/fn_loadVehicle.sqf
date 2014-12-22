/* ws_fnc_loadVehicle
Latest: 12.11.2014
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Based on my work for the F3 preMount component

FEATURE
loads units of specified group(s) into vehicle, filling all important positions before cargo is filled
units that are already in a vehicle are ignored

USAGE
Minimal:
[[veh1],["Grp1","Grp2"]] call ws_fnc_loadVehicle

Full:
[[veh1],["Grp1","Grp2"],boolean,boolean] call ws_fnc_loadVehicle

RETURNS
Units that weren't loaded. If all units were loaded an empty array is returned
*/

// DECLARE VARIABLES AND FUNCTIONS

private ["_objects","_crew","_vehs","_grps","_units"];

// ====================================================================================

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

_vehs = _this select 0;												// Array of vehicles    (objects)
_grps = _this select 1;												// Array of group names (as strings)
_crew = if (count _this > 2) then {_this select 2} else {true};		// Mount into crew positions? (optional - default:true)
_fill = if (count _this > 3) then {_this select 3} else {false};	// Ignore fireteam cohesion in favor of filling vehicles? (optional - default:false)

// ====================================================================================

// CLEAN THE GROUP ARRAY
// First we check if there are illegal groups (non-existent) in the array and fix it by replacing it with a null-group.
// At the end we remove all null-groups are removed and the array is clean

if ({isNil _x} count _grps > 0) then {
	{
		if (isNil _x) then {
			_grps set [_forEachIndex,grpNull];
		};

	} forEach _grps;
	_grps = _grps - [grpNull];
};

// We check the passed groups to make sure none of them is empty and they have at least one unit that's not inside a vehicle
{
	_grp = call compile format ["%1",_x];
	_grps set [_forEachIndex,_grp];

	if (count (units _grp) == 0 || {isNull (assignedVehicle _x)} count (units _grp) == 0) then {
	 	_grps set [_forEachIndex,grpNull];
	};

} forEach _grps;
_grps = _grps - [grpNull];

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

	// Calculate the number of spare seats
	_emptyPositions = [typeOf _veh,true] call BIS_fnc_crewCount; // Count all available slots(this includes co-pilot, commander, main-gunner etc.)
	_emptyPositions = _emptyPositions - (count crew _veh); 		// Substract number of crew already present in the vehicle
	_vehicleRoles = (typeOf _veh) call bis_fnc_vehicleRoles;	// All available roles for the vehicle

	// Temporary group array
	_grpsT = _grps;
	// As long there are spare seats and groups left

	while {_emptyPositions > 0 && count _grpsT > 0 && locked _veh < 2} do {

		private ["_grp","_units","_run"];

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
