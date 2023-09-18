/* ws_fnc_isWallInDir
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Checks if object is facing a building wall in given direction, distance and height

USAGE
Minimal
[Object,direction] call ws_fnc_isWallInDir

Full
[Object,direction,distance,height] call ws_fnc_isWallInDir

PARAMETERS
1. Unit or Object	| Mandatory - any object, uses eyepos for "CAMANBASE"
2. Direction		| Mandatory	- 0 - 360
3. Distance			| Optional	- default 15m
4. Height			| Optional	- default 0m

RETURNS
bool - true if unit is facing a wall, false if unit is outside or facing a window

EXAMPLES
[TestUnit,GetDir TestUnit] ws_fnc_isWallInDir - returns true if TestUnit is facing a wall
[TestUnit,0,0,25] ws_fnc_isWallInDir - returns true if TestUnit is under a roof
*/

private ["_pos","_relpos","_posASL","_intersects"];

params [
	["_obj", objNull, [objNull]],
	["_dir", 0, [0]],
	["_dis", 15, [0]],
	["_height", 0, [0]]
];

_pos = getPos _obj;
_posASL = if (_obj isKindOF "CAMANBASE") then [{eyePos _obj},{GetPosASL (_obj)}];

_relpos = [_pos select 0,_pos select 1,(_pos select 2) + _height] getPos [_dis, _dir];

_intersects = lineIntersectsObjs [_posASL,ATLTOASL _relpos];
if (count _intersects > 0 && {(({(_x isKindOf "HouseBase" || _x isKindOf "BagBunker_base_F")} count _intersects) > 0)}) then [{true},{false}];
