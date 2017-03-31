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
[center,radius,side,number,number,array] call ws_fnc_createGarrison

NOTE
Make sure to call this only on the server or headless client. The function itself does not check where it is run.

PARAMETERS:
1. Center of town. Can be marker, object or location     | MANDATORY - string (markername) or object name
2. Radius of area to be considered																				 | MANDATORY - int
3. Side of units to spawn																						 | MANDATORY - side (east, west, independent, civilian)
4. Number of units.																								 | OPTIONAL - number - default is No. of available buildings/4
5. threshold of building positions that can be occupied in the buildings in the area							 | OPTIONAL - number between 1 (=100%) and 0, default is set below
6. Array of classes to spawn																		           	 | OPTIONAL - array w. strings  - default are classes defined below

EXAMPLE
["mkrOutpost",50,resistance] call ws_fnc_createGarrison; - his will create units in buildings 50m around the marker named "mkrOutpost". The number of units will the the number of buildings in the radius divided by 2. The classes of the units will be taken from the default array (by default light riflemen).

[UnitNATO_General,150,west,50,0.7,["B_Soldier_AR","B_Soldier_GL"]] call ws_fnc_createGarrison; - Place 50 NATO soldiers in buildings in a 150m radius around the Object (unit) named UnitNATO_General. All of them will be either AT or Grenadier. Only fill the buildings to 70% percent.

RETURNS
array of created units
*/

// DECLARE VARIABLES
private ["_garrisonWest","_garrisonEast","_garrisonIndp","_garrisonCIV","_threshold","_debug","_area","_radius","_side","_int","_thrsh","_classes","_buildings","_grp"];

_threshold = 0.8; // Default percentage of building positions that can be taken in any given building (1=all)

// Default classes (Arma 3)
// To change which units are spawned for which side, replace the array or add additional units to it

// NATO
_garrisonWest = ["B_Soldier_lite_F","B_Soldier_F"];

// CSAT
_garrisonEast = ["O_Soldier_lite_F","O_Soldier_F"];

// AAF
_garrisonIndp = ["I_Soldier_lite_F","I_Soldier_F"];

// CIVILIAN
_garrisonCIV = [""];

// NATO PAcific
// ["B_T_Soldier_F"]

// CSAT Pacific
// ["O_T_Soldier_F"];

// Syndikat Paramilitary
// ["I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_7_F"];

// Syndikat Bandit
// ["I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_5_F"];

// FIA
// ["B_G_Soldier_lite_F","B_G_Soldier_F"];

// Debug. If ws_debug is globally defined it overrides _debug
_debug = if !(isNil "ws_debug") then {ws_debug} else {false};

// Declare Variables
_area = (_this select 0) call ws_fnc_getEPos;
_radius = _this select 1;
_side = (_this select 2);
_int = if (count _this > 3) then {_this select 3} else {0};
_thrsh = if (count _this > 4) then {_this select 4} else {_threshold};
_classes = if (count _this > 5) then {_this select 5} else {[]};

//Fault checks
//Checking the variables we have against what we should have
{[_x,["SIDE"],"ws_fnc_createGarrison"] call ws_fnc_typecheck;} forEach [_side];
{[_x,["SCALAR"],"ws_fnc_createGarrison"] call ws_fnc_typecheck;} forEach [_int,_radius];
{[_x,["ARRAY"],"ws_fnc_createGarrison"] call ws_fnc_typecheck;} forEach [_classes,_area];

// If default classes are being used, select the corresponding array
if (count _classes == 0) then {
	_classes = switch (_side) do {
		case west: {_garrisonWest};
		case blufor: {_garrisonWest};
		case east: {_garrisonEast};
		case opfor: {_garrisonEast};
		case resistance: {_garrisonIndp};
		case independent: {_garrisonIndp};
		case civilian: {_garrisonCIV};
	};
};

// Collect buildings and assign building positions
_buildings = [_area,_radius,true,true] call ws_fnc_collectBuildings;

if (count _buildings == 0) exitWith {["ws_fnc_createGarrison DBG: no buildings found at ",[_area],""] call ws_fnc_debugText};

// If no amount of units is set, calculate default
if (_int == 0) then {
	_int = round (count _buildings / 4);
};

if (_thrsh <= 0) then {_thrsh = 0.1};

// Create a new group
_grp = createGroup _side;

// Give the group a hold waypoint as otherwise ASR_AI might call them outside
[_grp,_area,["hold"]] call ws_fnc_addWaypoint;

for "_x" from 1 to _int do {
	private ["_b","_bpa","_bpl","_bu","_i","_u","_dir"];

	_b = _buildings call ws_fnc_selectRandom;
	_bpa = _b getVariable "ws_bPos";
	_bpl = _b getVariable ["ws_bPosLeft",_bpa];
	_bu = _b getVariable ["ws_bUnits",0];

	// Loop until we get a building that has building positions at all
	// Mostly a safety, not sure if there even are any buildings with no building positions in the game

	while {count _bpa == 0 && {count _buildings > 0}} do {
		_buildings = _buildings - [_b];

		if (count _buildings == 0) exitWith {};

		_b = _buildings call ws_fnc_selectRandom;
		_bpa = _b getVariable "ws_bPos";
		_bpl = _b getVariable ["ws_bPosLeft",_bpa];
		_bu = _b getVariable ["ws_bUnits",0];
	};

	// Loop until we have a building with enough free building positions
	while {count _buildings > 0 && {count _bpl == 0 || _bu / count _bpa >= _thrsh}} do {
		_buildings = _buildings - [_b];

		if (count _buildings == 0) exitWith {};

		_b = _buildings call ws_fnc_selectRandom;
		_bpa = _b getVariable "ws_bPos";
		_bpl = _b getVariable ["ws_bPosLeft",_bpa];
		_bu = _b getVariable ["ws_bUnits",0];
	};

	// If no buildings are left, exit
	if (count _buildings == 0) exitWith {};

	// Get a building position
	_i = floor (random (count _bpl));
	_bp = _bpl select _i;

	// Remove the building position from the array
	_bpl set [_i,0];			//Workaround as in http://community.bistudio.com/wiki/Array#Subtraction
	_bpl = _bpl - [0];

	// Create a unit and move it into place
  	_u = _grp createUnit [_classes call ws_fnc_selectRandom,_area,[],5,"NONE"];
	_u setPosATL _bp;
  	dostop _u;

	_u spawn ws_fnc_setInsidePos; // SetInsidePos is fairly expensive, thus spawned

	//_u setDir _dir;
	// if (random 1 > 0.75) then {_u setunitpos "Middle";} else {_u setUnitPos "UP"};

    // Set new variables
  	_u setVariable ["ws_bpos",_bp,true];
  	_b setVariable ["ws_bUnits",_bu + 1,true];
	_b setVariable ["ws_bPosLeft",_bpl,true];

  	if (_debug) then {_mkr = createMarker [format ["%1-bpos",_u],getPos _u];_mkr setMarkerSize [0.5,0.5];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorGreen";};
};

// Prevent the group leader to issue attack orders to the members, improving their attack from buildings
_grp enableAttack false;

// Set the group's attack mode and stance
[_grp,"AWARE","YELLOW"] call ws_fnc_setAIMode;

// Return created unis
(units _grp)