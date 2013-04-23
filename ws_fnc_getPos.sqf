// GetPos function
// v1 (13.04.2013)
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
// Thanks to Shuko for SHK_pos
//
// FEATURE
// Turn input into legit positional array [x,y,z], returns array
// For a more powerful getPos script look up SHK_pos by Shuko
//
// USAGE
// Minimal:
// [location] call ws_fnc_getPos;
// Full:
// [location,radius (int), road (bool), water (bool)] call ws_fnc_getPos;
//
// OUTPUT
// Array: [x,y,z]
//
// PARAMETERS
// 1. location can be String (Markername), Array [x,y,z] or Objectname		| MANDATORY	
// 2. radius has to be int > 0 and defines the radius around the position 	| OPTIONAL - default is 0
// 3. road (bool) forces unit to be placed on road 							| OPTIONAL - default is false
// 4. water (bool) forces units to be placed on land 						| OPTIONAL - default is true
//
// EXAMPLES
// ["spawnmarker"] call ws_fnc_getPos; - turns the marker location into a position array
// ["spawnmarker",0,true] call ws_fnc_getPos; - gets a position on a road in closest possible distance to the marker location
// [church,250] call ws_fnc_getPos; - gets a position in 250m radius to the object named "church"
// [v1,500,false,true] call ws_fnc_getPos; - gets a position in 50m radius to the object named "v1" and also allows position to be on water
//
// TODO
// implement angle
// check if marker is area, if yes place pos within

private ["_debug","_count","_posloc","_pos","_posradius","_dir","_road","_water","_posX","_posY"];

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};   //Debug mode. If ws_debug is globally defined it overrides _debug

//Declaring variables
_count = count _this;
_posloc = _this select 0;
_pos = [0,0,0];
_posradius = 0;
_road = false;
_water = false;

//Optional variables parsed
if (_count > 1) then {_posradius = _this select 1;};
//if (_count > 2) then {_dir = _this select 2;} else {};
if (_count > 2) then {_road = _this select 2;};
if (_count > 3) then {_water = _this select 3;};

_dir = random 360;

//Interpreting variables   
//Creating the array for the spawnpos

//Getting a good position from the parsed values
switch (typename _posloc) do {
	case "STRING": {_pos = getMarkerPos _posloc};
	case "OBJECT": {_pos = getPos _posloc;};
	case "ARRAY": {_pos = _posloc};
	default {[_posloc,["ARRAY","OBJECT","STRING"],"ws_fnc_getPos"] call ws_fnc_typecheck;};
};

_posX = (_pos select 0);
_posY = (_pos select 1);
_pos set [2,0];

//Fault checks
//Checking the variables we have against what we should have
{[_x,["ARRAY"],"ws_fnc_getPos"] call ws_fnc_typecheck;}  forEach [_pos];
{[_x,["SCALAR"],"ws_fnc_getPos"] call ws_fnc_typecheck;} forEach [_posradius,_dir,_posX,_posY];  
{[_x,["BOOL"],"ws_fnc_getPos"] call ws_fnc_typecheck;} forEach [_road,_water];

if (_posradius > 0) then {
	_newX = _posX + ((random _posradius) * sin _dir);
	_newY = _posY + ((random _posradius) * cos _dir);
	_pos = [_newX,_newY,0];
};

player sidechat format ["%1",_pos select 1];

//If the position has to be on dry land
if (!_water && !_road && (surfaceIsWater _pos)) then {
	_i = 0;
	_distance = 0;
	_done = false;
	while {!_done && _i <= 50} do {
		for "_x" from 0 to 340 step 20 do {
			_distance = _distance + 100;
			_pos set [0,_posX + (_distance * sin _x)];
			_pos set [1,_posY + (_distance * cos _x)];
			if !(surfaceIsWater _pos) exitWith {_done = true};
		};
		_i = _i + 1;
	};
};

//If the position is supposed to be on a road
if (_road) then {
	_i = 0;
	_distance = 5;
	_done = false;
	while {!_done && _i <= 20} do {
		_roads = _pos nearroads _distance;
		if (count _roads > 0) then {
			_pos = getPos (_roads call ws_fnc_selectRandom);
			_done = true;
		} else {
		_distance = _distance + 100;
		_i = _i + 1;
		};
	};
};

if (_debug) then {
player globalchat format ["DEBUG: ws_fnc_getPos done. Pos is %1, direction is %2",_pos,_dir];
  _mkr = createMarker [format ["%1",_pos], _pos];
  _mkr setMarkerType "mil_dot";
  _mkr setMarkerColor "ColorGreen";
  //_mkr setMarkerText format ["DBG:Pos %1",_pos];
  _mkr setMarkerSize [0.5,0.5];
};

//Return the new position
_pos