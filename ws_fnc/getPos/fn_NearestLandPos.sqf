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

private ["_i","_distance","_increment","_roads","_done"];

_pos = _this select 0;

_i = 0;
_distance = 10;
if (count _this > 1) then {_distance = _this select 1};
_increment = 50;
if (count _this > 2) then {_increment = _this select 2};

_done = false;
while {!_done && _i <= 50} do {
	for "_x" from 0 to 340 step 20 do {
		_distance = _distance + _increment;
		_pos set [0,_posX + (_distance * sin _x)];
		_pos set [1,_posY + (_distance * cos _x)];
		if !(surfaceIsWater _pos) exitWith {_done = true};
	};
	_i = _i + 1;
	if (_i == 50) exitWith {_pos = _this select 0; ["ws_fnc_NearestLandPos ERROR: No dry land found in radius of",(_increment*20),""] call ws_fnc_DebugText};
};

_pos
