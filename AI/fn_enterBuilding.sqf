// WS_fnc_enterBuilding
// Last Update 19.09.2013
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
// Thanks to Rommel's CBA_fnc_taskDefend and Binesi's improved BIS_fnc_taskDefend
//
// FEATURE
// Have a selection of units enter a selection buildings and take position at randomly select spots inside
//
// RETURNS
// Units that haven't been put into a building position

private ["_debug","_units","_building","_treshold","_barray","_bpos","_bposarray","_bposleft","_bUnits","_occupied","_mkr"];
_debug = if !(isNil "ws_debug") then {ws_debug} else {false};

_units = _this select 0;
_barray = _this select 1;
_treshold = if (count _this > 2) then {_this select 2} else {1};	//Percentage of building positions that can be taken before building is considered "full"

if (typename _barray != "ARRAY") then {_barray = [_this select 1]};
if (_treshold <= 0) then {_treshold = 0.1};

// As long we have units and a more than one building we loop through either
while {count _units != 0 && count _barray != 0} do {

	_building = _barray call ws_fnc_selectRandom;
	_bposarray = _building getVariable ["ws_bpos",[]];

	if (count _bposarray == 0) then {_bposarray = [_building] call ws_fnc_getBpos;};

	// Get variables to check if building can be used
	_bUnits = _building getVariable ["ws_bUnits",0];
	_bposleft = _building getVariable ["ws_bPosLeft",_bposarray];

	// Loop until we find a good building
	//||
	while {count _barray > 0 && {count _bposLeft == 0 || (_bUnits / count _bposarray >= _treshold)}} do {
		player globalchat "loop";
		_barray = _barray - [_building];

		_building = _barray call ws_fnc_selectRandom;
		_bposarray = _building getVariable ["ws_bPos",[]];
		if (count _bposleft == 0) then {_bposarray = [_building] call ws_fnc_getBpos;};

		// Get variables in order to check if building can be used
		_bUnits = _building getVariable ["ws_bUnits",0];
		_bposleft = _building getVariable ["ws_bPosLeft",_bposarray];
	};


	// If no good building was found, exit.
	if (count _barray == 0) exitWith {};

	// Otherwise continue to place unit:
	_unit = _units call ws_fnc_selectrandom;
	_units = _units - [_unit];

	//Get a building position and remove it from the array
	_i = floor (random (count _bposleft));
	_bpos = _bposleft select _i;
	_bposleft set [_i,0];			//Workaround as in http://community.bistudio.com/wiki/Array#Subtraction
	_bposleft = _bposleft - [0];

	// Set the new variables for the building
	_building setVariable ["ws_bPosLeft",_bposleft,true];
	_building setVariable ["ws_bUnits",_bUnits+1,true];

	// For the unit spawn code to have it enter the building
	[_unit,_bpos] spawn {
		private ["_unit","_pos","_dir"];

		_unit = _this select 0;
		_pos = _this select 1;

		_unit setVariable ["ws_bpos",_pos,true];

		_unit doMove _pos;
		waitUntil {_pos distance (getPosATL _unit) < 10};
		(group _unit) setSpeedMode "Limited";
		sleep 1;
		_i = 0;

		// Wait 2 minutes for the unit to get ready
		for "_i" from 0 to 120 do {
			if (unitReady _unit) exitWith {sleep 5;};
			sleep 1;
		};

		//Check the distance to the building position and the distance between z-levels (if the unit got stuck)
		if (((getPosATL _unit) select 2) - (_pos select 2) < 0.2) then {
			_unit setPosATL _pos;_unit doMove _pos;

				// Wait another 2 minutes for the unit to get ready
				for "_i" from 0 to 120 do {
					if (unitReady _unit) exitWith {sleep 5;};
					sleep 1;
				};
		};

		dostop _unit;
		if (random 1 > 0.75) then {_unit setunitpos "Middle";} else {_unit setUnitPos "Up"};
		_dir = if (ws_game_A3) then {([_unit,_pos] call BIS_fnc_DirTo) +180} else {random 360};
		_unit setDir _dir;

		(group _unit) setSpeedMode "NORMAL";
	};

	if (_debug) then {
		_mkr = createMarker [format ["%1-bpos",_unit],_bpos];
		_mkr setMarkerSize [0.5,0.5];
		_mkr setMarkerType "mil_dot";
		_mkr setMarkerColor "ColorGreen";
		["ws_fnc_enterbuilding DBG3: ",[_building,(count _bposarray),(count _bposleft)]," - building: bpos/bposleft"] call ws_fnc_debugText;
	};

	// If the building doesn't have any bpos or is filled, it's removed from the building-array
	if (count _bposleft == 0 || (_bUnits+1)/count _bposarray >= _treshold) then {_barray = _barray - [_building]};

};

_units