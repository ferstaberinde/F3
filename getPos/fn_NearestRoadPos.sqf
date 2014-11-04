/* ws_fnc_NearestRoadPos
Latest: 10.10.2013
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

USAGE
[pos] call ws_fnc_NearestRoadPos
[pos,distance,increment] call ws_fnc_NearestRoadPos

FEATURE
Return nearest road in distance x (default 10), If no road is found increase by increment x (default 50)
If no roads in radius increment*20 are found the original position is returned and an error put out.

RETURNS
positional array
*/

private ["_i","_distance","_increment","_roads","_done"];

_pos = (_this select 0) call ws_fnc_getEPos;

_i = 0;
_distance = 10;
if (count _this > 1) then {_distance = _this select 1};
_increment = 50;
if (count _this > 2) then {_increment = _this select 2};
_done = false;

while {!_done && _i <= 20} do {
	_roads = _pos nearroads _distance;
	if (count _roads > 0) then {
		_pos = getPosATL (_roads call ws_fnc_selectRandom);
		_done = true;
	} else {
	_distance = _distance + _increment;
	_i = _i + 1;
	if (_i == 20) exitWith {_pos = _this select 0; ["ws_fnc_NearestRoadPos ERROR: No roads found in radius of",(_increment*20),""] call ws_fnc_DebugText};
	};
};

[_pos select 0,_pos select 1,0]