// WS_fnc_taskCrew
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
// Thanks to Binesi's improved BIS_fnc_taskDefend
/*
FEATURE
Send a group of units to man empty statics and gunner-less vehicles in a given radius

USAGE
[group, radius] call ws_fnc_taskCrew
*/

_group = _this select 0;
_radius = _this select 1;

//Get nearby vehicles to start populating the static weapons
_vehicles =  [];
{
_vehicles = _vehicles + nearestObjects [_pos,[_x],_radius];
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
		_staticarray = _staticarray + [_x];
	};
} forEach _vehicles;

//Man the statics
if (count _staticarray > 0) then {
while {(count _staticarray > 0) && (count _units > 2)} do {
			_static = _staticarray select 0;
			_staticarray = _staticarray - [_static];
			["ws_taskCrew DBG: ",[_static,count _staticarray],""] call ws_fnc_debugText;
			_unit = _units2 call ws_fnc_selectRandom;
			_unit assignasgunner _static;
			[_unit] ordergetin true;
			waitUntil {isNil format ["%1",(gunner _static)]};
			if (gunner _static == _unit) then {
				_units = _units - [_unit];
				_units2 = _units2 - [_unit];
			};
	};
};

true