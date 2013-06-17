// SwitchLights function
// v1 (17.06.2013)
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
//
// FEATURE
// Flip on/off streetlights in a given area
//
// USAGE
// [switch,center,radius] call ws_fnc_switchLights;
//
// PARAMETERS
// 1. Switch can be "ON" or "OFF"								| MANDATORY	
// 2. Center can be markername, object or positional array		| MANDATORY	
// 3. Radius has to be integer		| MANDATORY	
//
// EXAMPLES
// ["OFF",church,1000] call ws_fnc_switchLights; - turn off all lights in 1k radius around the object named "church"
// ["ON",player,20] call ws_fnc_switchLights; - turn on all lights in 20m radius around the player
//
// TODO
// make sure all light classes are implemented

_types = ["Land_PowLines_WoodL", "Land_PowLines_ConcL", "Land_lampa_ind_zebr", "Land_lampa_sidl_3", "Land_lampa_vysoka", "Land_lampa_ind", "Land_lampa_ind_b", "Land_lampa_sidl"];

_switch = _this select 0;
_center = _this select 1;
_radius = _this select 2;

[_switch,["STRING"],"ws_fnc_getPos"] call ws_fnc_typecheck;
[_radius,["SCALAR"],"ws_fnc_getPos"] call ws_fnc_typecheck;


_pos = [_center,0,false,true,true] call ws_fnc_getPos;

for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
	{
		_lamps = _pos nearObjects [_types select _i, _radius];
		sleep 0.5;
		{_x switchLight _switch} forEach _lamps;
	};