/* ws_fnc_NearestLandPos
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

USAGE
[pos] call ws_fnc_NearestLandPos
[pos,distance,increment] call ws_fnc_NearestLandPos

FEATURE
Return nearest pos on dry land in distance x (default 10), If no position is found increase by increment x (default 50)
If no dry land in radius increment*50 is found the original position is returned and an error put out.

RETURNS
positional array
*/

private ["_i","_done","_pos2"];

params [
	["_pos", [0,0,0], [[]], [2,3]],
	["_distance", 10, [0]],
	["_increment", 50, [0]]
];

_i = 0;
_done = false;

if !(surfaceIsWater _pos) exitWith {_pos};

while {!_done && _i <= 50} do {
	_distance = _distance + _increment;
	for "_x" from 0 to 340 step 20 do {
		_pos2 = _pos vectorAdd [_distance * sin _x, _distance * cos _x, 0];
		if !(surfaceIsWater _pos2) exitWith {_pos = _pos2;_done = true};
	};
	_i = _i + 1;
	if (_i == 50) exitWith {["ws_fnc_NearestLandPos ERROR: No dry land found in radius of",_distance,""] call ws_fnc_DebugText};
};

_pos
