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

private ["_debug","_units","_building","_treshold","_barray","_bpos","_bposarray","_bposleft","_occupied","_mkr"];
_debug = if !(isNil "ws_debug") then {ws_debug} else {false};

_units = _this select 0;
_barray = _this select 1;
_treshold = _this select 2;	//How many building positions can be empty to consider the building "occupied" (no more new units taking position)

if (typename _barray != "ARRAY") then {_barray = [_this select 1]};

while {count _units != 0 && count _barray != 0} do {

_building = _barray call ws_fnc_selectRandom;
_occupied = _building getVariable ["ws_occupied",false];
_bposarray = [_building] call ws_fnc_getBpos;
_bposleft = _building getVariable ["ws_bpos",[]];
if (_occupied || (count _bposarray == 0)) then {_barray = _barray - [_building];};
if (count _bposarray != count _bposleft) exitWith {["ws_fnc_enterBuilding ERROR: ",[_bposarray,_bposleft], " are not equal! Exiting..."] call ws_fnc_debugText;};


if !(_occupied && (count _bposleft > 0) && (count _units > 0)) then {

	//["ws_fnc_enterbuilding DBG1: ",[_building,(count _bposleft),_bposleft],""] call ws_fnc_debugText;

	_unit = _units call ws_fnc_selectrandom;
	_units = _units - [_unit];
	_i = floor (random (count _bposleft));
	_bpos = _bposleft select _i;
	if (isNil "_bpos") exitWith {};

	_bposleft set [_i,0];			//Workaround as in http://community.bistudio.com/wiki/Array#Subtraction
	_bposleft = _bposleft - [0];
	_building setVariable ["ws_bpos",_bposleft,true];

	//["ws_fnc_enterbuilding DBG2: ",[_unit,typeOf _building,_bpos,_bposleft],""] call ws_fnc_debugText;
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
				// Wait 2 minutes for the unit to get ready
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
		["ws_fnc_enterbuilding DBG3: ",[_building,(count _bposleft)],""] call ws_fnc_debugText;
	};

	if (count _bposleft <= _treshold) exitWith {_building setVariable ["ws_occupied",true,true];_barray = _barray - [_building]};

	};


};

_units