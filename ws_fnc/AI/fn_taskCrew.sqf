/*WS_fnc_taskCrew
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
/*
FEATURE
Send a group of units to man empty statics and gunner-less vehicles in a given radius

USAGE
[group, radius] call ws_fnc_taskCrew

RETURNS
Array of units that didn't take a gunner seat
*/

private ["_pos","_vehicles","_staticarray","_units2","_locked","_units","_unit"];

params [
	["_group", grpNull, [grpNull]],
	["_radius", 0, [0]]
];

_pos = (_group) call ws_fnc_getEPos;

//Get nearby vehicles to start populating the static weapons
_vehicles =  [];
{
	_vehicles append nearestObjects [_pos,[_x],_radius];
} forEach ["StaticWeapon","Tank","Car"];

_staticarray = [];
_units = units _group;
_units2 = _units - [leader _group];

//Create an array containing all vehicles in the area that are uncrewed and have a free gunner seat
{
	//BI changed the value returned by locked in A3. See http://community.bistudio.com/wiki/locked
	_locked = false;
	if !(ws_game_a3) then {_locked = locked _x} else {if (locked _x >= 2) then {_locked = true};};

	if ((_x emptyPositions "gunner") > 0 && !(_locked) && ((count crew _x) == 0)) then
	{
		_staticarray pushBack _x;
	};
} forEach _vehicles;

//Man the statics
{
	// Make sure it doesn't have a gunner yet
	if (isNull (gunner _x) && isNUll (_x getVariable ["ws_StaticCrew",objNull])) then {
		_unit = selectRandom _units2;
		_unit assignasgunner _x;
		[_unit] ordergetin true;
		_units = _units - [_unit];
		_units2 = _units2 - [_unit];

		_x setVariable ["ws_StaticCrew",_unit,true];
	};
} forEach _staticarray;

_units
