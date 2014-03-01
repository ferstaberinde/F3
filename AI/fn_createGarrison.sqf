/*ws_fnc_spawnGarrison
Latest: 01/03/2014
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Usage Guide: http://www.folkarps.com/forum/viewtopic.php?f=48&t=1224

FEATURE
Populates the buildings in the given area with the given number of units

USAGE
Minimal:
[center,radius,side] call ws_fnc_createGarrison
Full:
[center,radius,side,integer,array] call ws_fnc_createGarrison

NOTE
Make sure to call this only on the server or headless client. The function itself does not check where it is run.

PARAMETERS:
1. Center of town. Can be marker, object or location     | MANDATORY - string (markername) or object name
2. Radius of area to be considered																				 | MANDATORY - int
3. Side of units to spawn																									 | MANDATORY - side (east, west, resistance)
4. Number of units.																								         | OPTIONAL - integer - default is No. of available buildings/2
5. Array of classes to spawn																		           | OPTIONAL - array w. strings  - default are classes defined below

EXAMPLE
["mkrOutpost",50,resistance] call ws_fnc_createGarrison; - his will create units in buildings 50m around the marker named "mkrOutpost". The number of units will the the number of buildings in the radius divided by 2. The classes of the units will be taken from the default array (by default light riflemen).

[UnitNATO_General,150,west,50,["B_Soldier_AR","B_Soldier_GL"]] call ws_fnc_createGarrison; - Place 50 NATO soldiers in buildings in a 150m radius around the Object (unit) named UnitNATO_General. All of them will be either AT or Grenadier.

RETURNS
array of created units
*/

// Default classes (Arma 3)
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

// Collect buildings and assign building positions
_buildings = [_area,_radius,true,true] call ws_fnc_collectBuildings;

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

// If no amount of units is set, calculate default
if (_int == 0) then {
	_int = round (count _buildings / 2);
};

_grp = createGroup _side;

//Rewrite?
for "_x" from 1 to _int do {

	_b = _buildings call ws_fnc_selectRandom;
	_bpa = _b getVariable ["ws_bPos",false];

	while {typeName _bpa != typeName [] && count _buildings > 0} do {
		_buildings = _buildings - [_b];
		_b = _buildings call ws_fnc_selectRandom;
		_bpa = _b getVariable ["ws_bPos",false];
	};

	while {count _bpa == 0 && count _buildings > 0} do {
		_buildings = _buildings - [_b];
		_b = _buildings call ws_fnc_selectRandom;
		_bpa = _b getVariable ["ws_bPos",false];
	};

	if (count _buildings == 0) exitWith {};

	_i = floor (random (count _bpa));
	_bp = _bpa select _i;

	if (isNil "_bp") then {
			player globalchat format ["%1,%2,%3",_bp,_b,count _bpa];
	};

	// Create a unit and move it into place
  _u = _grp createUnit [_classes call ws_fnc_selectRandom,_area,[],5,"NONE"];
	_u setPosATL _bp;
  dostop _u;

  _dir = if (ws_game_A3) then {([_u,_b] call BIS_fnc_DirTo) +180} else {random 360};

  _u setDir _dir;

    if (random 1 > 0.75) then {_u setunitpos "Middle";} else {_u setUnitPos "UP"};

  _u setVariable ["ws_bpos",_bp];

  if (_debug) then
  	{_mkr = createMarker [format ["%1-bpos",_u],getPos _u];_mkr setMarkerSize [0.5,0.5];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorGreen";};

  // Remove the building position from the array
	_bpa set [_i,0];			//Workaround as in http://community.bistudio.com/wiki/Array#Subtraction
	_bpa = _bpa - [0];
	_b setVariable ["ws_bpos",_bpa];

};

_grp enableAttack false; // Prevent the group leader to issue attack orders to the members, improving their attack from buildings

_units = units _grp;
_units