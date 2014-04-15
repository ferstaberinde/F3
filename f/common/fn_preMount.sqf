// MAKE SURE THE SCRIPT IS ONLY RUN SERVER-SIDE
if (!isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_objects","_crew","_vehs","_grps","_units"];

// ====================================================================================

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

_objects = _this select 0;
_crew = _this select 1;

// ====================================================================================

// PROCESS VARIABLES
// Split the parsed units into vehicles and groups
_vehs = [];
_grps = [];
{
 if (_x isKindOf "CAManBase") then {
 	if !(group _x in _grps) then {_grps set [(count _grps),group _x]};
 } else {
 	_vehs set [(count _vehs),_x];
 };
} forEach _objects;

// ====================================================================================

// MOUNT UNITS
// We loop through all vehicles and assign crew & cargo accordingly

{
	_veh = _x;
	_crew = _this select 1;

	{
		_units = units _x;
		_run = true;

		while {_run} do {
			_unit = _units select 0;

			if (_crew) then {
				if ((_veh emptyPositions "Driver") > 0) exitWith {_unit assignAsDriver _veh;_unit moveInDriver _veh;};
				if ((_veh emptyPositions "Gunner") > 0) exitWith {_unit assignAsGunner _veh; _unit moveInGunner _veh;};
				if ((_veh emptyPositions "Commander") > 0) exitWith {_unit assignAsCommander _veh; _unit moveInCommander _veh;};
				_crew = false;
			};

			if !(_crew) then {

				// To maintain fireteam cohesion we only add units to the cargo if there's enough room for the entire fireteam
				if (count _units <= _veh emptyPositions "CARGO") then {
					_unit moveInCargo _veh; _unit assignAsCargo _veh;
				} else {_run = false;}
			};

			_units = _units - [_unit];
			if (count _units == 0) then {_run = false;_grps = _grps - [_x]};

		};
	} forEach _grps;

} forEach _vehs;

/*

// MOUNT UNITS
// We loop through all vehicles and assign crew & cargo accordingly
{
	_veh = _x;
	_run = true;

	while {_run} do {
		_unit = _units select 0;
		_units = _units - [_unit];

		if (_crew) then {
			player globalchat format ["%1",_crew];
			if ((_veh emptyPositions "Driver") > 0) exitWith {_unit assignAsDriver _veh;_unit moveInDriver _veh;};
			if ((_veh emptyPositions "Gunner") > 0) exitWith {_unit assignAsGunner _veh; _unit moveInGunner _veh;};
			if ((_veh emptyPositions "Commander") > 0) exitWith {_unit assignAsCommander _veh; _unit moveInCommander _veh;};
			_crew = false;
			player globalchat format ["%1",_crew];
		};


		if !(_crew) then {

			// To maintain fireteam cohesion we only add units to the cargo if there's enough room for the entire fireteam
			if ((count units group (_unit)) <= _veh emptyPositions "CARGO") then {
				{_x moveInCargo _veh; _x assignAsCargo _veh;} forEach (units group _unit); _units = _units - units group _unit;
			} else {_run = false};
		};

		if (count units group _unit == 0 ||_veh emptyPositions "CARGO" == 0) then {_run = false};

	};

} forEach _vehs;
// ====================================================================================

// OUTPUT
// We return all units that were *not* put in a cargo seat
_units