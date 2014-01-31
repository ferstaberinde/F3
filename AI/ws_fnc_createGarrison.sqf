/*ws_fnc_spawnGarrison
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Populates the buildings in the given area with the given number of units

USAGE
Minimal:
[center,radius,side] call ws_fnc_createGarrison
Full:
[center,radius,side,integer,array] call ws_fnc_createGarrison

PARAMETERS:
1. Center of town. Can be ellipse/rectangle marker, object or location     | MANDATORY - string (markername) or object name
2. Radius of area to be considered																				 | MANDATORY - int
3. Side of units to spawn																									 | MANDATORY - side (east, west, resistance)
4. Number of units.																								         | OPTIONAL - integer - default is No. of buildings/4
5. Array of classes to spawn																		           | OPTIONAL - array w. strings  - default are classes defined below

EXAMPLE

RETURNS
array of created units
*/

// Default classes
// BLUFOR
_wclasses = ["B_Soldier_lite_F"];
// OPFOR
_eclasses = ["O_Soldier_lite_F"];
// INDEPENDENT
_iclasses = ["I_Soldier_lite_F"];

// Debug. If ws_debug is globally defined it overrides _debug
_debug = true;  if !(isNil "ws_debug") then {_debug = ws_debug};

// Declare Variables
_area = (_this select 0) call ws_fnc_getEPos;
_radius = _this select 1;
_side = _this select 2;
_int = if (count _this > 3) then {_this select 3} else {0};
_classes = if (count _this > 4) then {_this select 4} else {[]};
//Fault checks
//Checking the variables we have enough against what we should have
{[_x,["SIDE"],"ws_fnc_createGarrison"] call ws_fnc_typecheck;} forEach [_side];
{[_x,["SCALAR"],"ws_fnc_createGarrison"] call ws_fnc_typecheck;} forEach [_int,_radius];
{[_x,["ARRAY"],"ws_fnc_createGarrison"] call ws_fnc_typecheck;} forEach [_classes,_area];

_buildings = [_area,_radius] call ws_fnc_collectBuildings;

// If no amount of units is set, calculate default
if (_int == 0) then {
	_int = round (count _buildings / 4);
};

// If default classes are being used, select the corresponding array
if (count _classes == 0) then {
	switch (_side) do {
		case west: {_classes = _wclasses};
		case blufor: {_classes = _wclasses};
		case east: {_classes = _eclasses};
		case opfor: {_classes = _eclasses};
		case resistance: {_classes = _iclasses};
		case independent: {_classes = _iclasses};
	};
};

// Generate building positions

{
	[_x] call ws_fnc_getBPos;
} forEach _buildings;


_grp = createGroup _side;
_units = units _grp;

for "_x" from 1 to _int do {
	_bpos = [];
	_b = _buildings call ws_fnc_selectRandom;

	while {count _bpos == 0 && count _buildings > 0} do {
		_bpos = _b getVariable ["ws_bpos",false];

		while {!(typeName _bpos == typename []) && (count _buildings > 0)} do {
				_buildings = _buildings - [_b];
				_b = _buildings call ws_fnc_selectRandom;
				_bpos = _b getVariable ["ws_bpos",false];
		};

		if (count _bpos == 0 || (typeName _bpos != typename [])) then {_buildings = _buildings - [_b];};
		_b = _buildings call ws_fnc_selectRandom;
	};

	// Create a unit and move itin place
  _u = _grp createUnit [_classes call ws_fnc_selectRandom,_area,[],5,"NONE"];

  _i = floor (random (count _bpos));
  _bp = _bpos select _i;

	_u setPosATL _bp;
  dostop _u;

  if (_debug) then {_mkr = createMarker [format ["%1-bpos",_u],getPos _u];_mkr setMarkerSize [0.5,0.5];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorGreen";};

  // Remove the building position from the array
	_bpos set [_i,0];			//Workaround as in http://community.bistudio.com/wiki/Array#Subtraction
	_bpos = _bpos - [0];
	_b setVariable ["ws_bpos",_bpos];

};

_grp enableAttack false; // Prevent the group leader to issue attack orders to the members, improving their attack from buildings

_units