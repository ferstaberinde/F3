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

private ["_debug","_units","_building","_treshold","_barray","_bpos","_bposarray","_bposleft","_occupied"];
_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};

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

//["ws_fnc_enterbuilding DBG0: ",[_building,(count _bposleft),_occupied],""] call ws_fnc_debugText;

if !(_occupied && (count _bposleft > 0) && (count _units > 0)) then {

	["ws_fnc_enterbuilding DBG1: ",[_building,(count _bposleft),_bposleft],""] call ws_fnc_debugText;

	_unit = _units call ws_fnc_selectrandom;
	_units = _units - [_unit];
	_i = floor (random (count _bposleft));
	_bpos = _bposleft select _i;
	if (isNil "_bpos") exitWith {};

	_bposleft set [_i,0];			//Workaround as in http://community.bistudio.com/wiki/Array#Subtraction
	_bposleft = _bposleft - [0];
	_building setVariable ["ws_bpos",_bposleft];

	//["ws_fnc_enterbuilding DBG2: ",[_unit,typeOf _building,_bpos,_bposleft],""] call ws_fnc_debugText;
	[_unit,_bpos] spawn {
		private ["_unit","_pos"];
		//doStop (_this select 0);
		//[_this select 0] joinSilent grpNull;
		_unit = _this select 0;
		_pos = _this select 1;

		[_unit] joinSilent grpNull;
		_unit doMove _pos;
		waitUntil {_pos distance (getPos _unit) < 10};
		(group _unit) setSpeedMode "Limited";
		sleep 1;
		waituntil {unitready _unit};
		if ((getPos _unit select 2) != (_pos select 2)) then {_unit setPos _pos;_unit doMove _pos;waituntil {unitready _unit};}; //Silly fix to make sure units are on the correct z-level. For some reason they don't like stairs when using doMove
		dostop _unit;
		if (random 1 > 0.5) then {_unit setunitpos "Middle";};
		//_unit setDir (getDir _unit - 180);
		(group _unit) setSpeedMode "NORMAL";
		_unit setVariable ["ws_bpos",_pos];
		//[_unit] call ws_fnc_clearView;
	};

	if (count _bposleft <= _treshold) then {_building setVariable ["ws_occupied",true];_barray = _barray - [_building]};
	if (_debug) then {_mkr = createMarker [format ["%1-bpos",_bpos],_bpos];_mkr setMarkerSize [1,1];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorGreen";["ws_fnc_enterbuilding DBG3: ",[_building,(count _bposleft)],""] call ws_fnc_debugText;};
	};
};

_units