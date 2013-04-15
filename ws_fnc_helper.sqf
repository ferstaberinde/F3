// Various functions used by other scripts or functions

//Does not work
/*
//Credits to zorilya
ws_fnc_clearview = {
_eyes = eyepos _unit;
_dir = 0;
_cansee = false;
_hyp = 5;

while {!(_cansee) || (_dir != 360)} do {
_angle = (getdir _unit);
_adj = _hyp * (cos _angle);
_opp = sqrt ((_hyp*_hyp) - (_adj * _adj));

_infront = if ((_angle) >=  180) then {
	[(_eyes select 0) - _opp,(_eyes select 1) + _adj,(_eyes select 2)]
} else {
	[(_eyes select 0) + _opp,(_eyes select 1) + _adj,(_eyes select 2)]
};

_obstruction = (lineintersectswith [_eyes,_infront,_unit]) select 0;
	if (isnil("_obstruction")) then {
	_cansee = true;
	} else {
	_cansee = false;
	_dir = _dir + 10;
	_unit setDir _dir;
	_unit setUnitPos "UP";_unit setUnitPos "AUTO";
	};
};

_cansee
};
*/

// Thanks to Rommel's CBA_fnc_taskDefend and Binesi's improved BIS_fnc_taskDefend
ws_fnc_getBpos = {
private ["_debug","_building","_bposarray","_i","_occupied"];
_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};

_building = _this select 0;
_bposarray = _building getVariable ["ws_bpos",[]];
_occupied = _building getVariable ["ws_occupied",false];
_i = 0;
if (count _bposarray == 0 && !_occupied) then {
	while {str(_building buildingpos _i) != "[0,0,0]"} do {
	_bposarray = _bposarray + [(_building buildingpos _i)];
	_i = _i + 1;
	};
	_building setVariable ["ws_bpos",_bposarray];
};

//["ws_fnc_getBpos DBG1: ",[_building,(_building getVariable "ws_bpos"),_occupied],""] call ws_fnc_debugText;

if (_debug) then {{_mkr = createMarker [format ["%1-bpos",_x],_x];_mkr setMarkerSize [0.3,0.3];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorRed";} forEach _bposarray;};
_bposarray
};

// Thanks to Rommel's CBA_fnc_taskDefend and Binesi's improved BIS_fnc_taskDefend
ws_fnc_enterbuilding = {
private ["_debug","_units","_building","_treshold","_barray","_bpos","_bposarray","_bposleft","_occupied"];
_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};

_units = _this select 0;
_barray = _this select 1;
_treshold = _this select 2;
if (typename _barray != "ARRAY") then {_barray = [_this select 1]};

while {count _units != 0 && count _barray != 0} do {
_building = _barray call ws_fnc_selectRandom;
_occupied = _building getVariable ["ws_occupied",false];
_bposarray = [_building] call ws_fnc_getBpos;
_bposleft = _building getVariable "ws_bpos";
if (_occupied || (count _bposarray == 0)) then {_barray = _barray - [_building];};
if (count _bposarray != count _bposleft) exitWith {["ws_fnc_enterBuilding ERROR: ",[_bposarray,_bposleft], " are not equal! Exiting..."] call ws_fnc_debugText;};

//["ws_fnc_enterbuilding DBG0: ",[_building,(count _bposleft),_occupied],""] call ws_fnc_debugText;

if !(_occupied && (count _bposleft > 0) && (count _units > 0)) then {
	 
	//["ws_fnc_enterbuilding DBG1: ",[_building,(count _bposleft),_bposleft],""] call ws_fnc_debugText;
	_unit = _units call ws_fnc_selectrandom;
	_units = _units - [_unit];
	_i = floor (random (count _bposleft));
	_bpos = _bposleft select _i;
	_bposleft set [_i,0];			//Workaround as in http://community.bistudio.com/wiki/Array#Subtraction
	_bposleft = _bposleft - [0];
	_building setVariable ["ws_bpos",_bposleft];
	
	//["ws_fnc_enterbuilding DBG2: ",[_unit,_building,_bpos,_bposleft],""] call ws_fnc_debugText;
	
		[_unit,_bpos] spawn {
			private ["_unit","_pos"];
			//doStop (_this select 0);
			//[_this select 0] joinSilent grpNull;
			_unit = _this select 0;
			_pos = _this select 1;
			if (surfaceIsWater _pos) exitwith {};
			_unit doMove _pos;
			sleep 1;
			waituntil {unitready _unit};
			_unit disableai "move";
			dostop _unit;
			waituntil {!(unitready _unit)};
			_unit enableai "move";
			sleep 5;
			if (random 1 > 0.5) then {_unit setunitpos "Middle";};
			//_unit setDir (getDir _unit - 180);
			_unit setVariable ["ws_bpos",_pos];
			//[_unit] call ws_fnc_clearView;
		};
	if (count _bposleft < _treshold) then {_building setVariable ["ws_occupied",true];_barray = _barray - [_building]};
	if (_debug) then {_mkr = createMarker [format ["%1-bpos",_bpos],_bpos];_mkr setMarkerSize [1,1];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorGreen";["ws_fnc_enterbuilding DBG3: ",[_building,(count _bposleft)],""] call ws_fnc_debugText;};
	};
};

_units
};

