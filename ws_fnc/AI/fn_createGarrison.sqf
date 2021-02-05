/*ws_fnc_createGarrison
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Usage Guide: http://www.folkarps.com/forum/viewtopic.php?f=48&t=1224

FEATURE
Populates the buildings in the given area with the given number of units

USAGE
Minimal:
[center,radius,side] call ws_fnc_createGarrison
Full:
[center,radius,side,number,number,array,bool] call ws_fnc_createGarrison
or
[center,radius,side,number,number,string,bool,string] call ws_fnc_createGarrison

NOTE
Make sure to call this only on the server or headless client. The function itself does not check where it is run.

PARAMETERS:
1. Center of town. Can be marker, object, location or list of buildings                | MANDATORY - string (markername) or object name or list of buildings
2. Radius of area to be considered                                                     | MANDATORY - int (will be ignored if list of buildings is provided)
2. ALTERNATIVE: Array with min and max radius. e.g. [50,100]                           | MANDATORY - array of two numbers.
3. Side of units to spawn                                                              | MANDATORY - side (east, west, independent, civilian)
4. Number of units.                                                                    | OPTIONAL - number - default is No. of available buildings/4
5. threshold of building positions that can be occupied in the buildings in the area   | OPTIONAL - number between 1 (=100%) and 0, default is set below
6. Array of classes to spawn                                                           | OPTIONAL - array w. strings  - default are classes defined below
6. ALTERNATIVE: Faction to spawn                                                       | OPTIONAL - string - faction name
7. Only garrison empty buildings                                                       | OPTIONAL - bool - true, if only empty buildings should be garrisoned. This is useful for overlappnig garrison radii.
8. assignGear AI faction to useful													   | OPTIONAL - string - faction name listed in assignGear.sqf. If this is defined, assignGear AI will be run on the spawned units automatically using this faction.

EXAMPLE
["mkrOutpost",50,resistance] call ws_fnc_createGarrison;
This will create units in buildings 50m around the marker named "mkrOutpost". 
The number of units will the the number of buildings in the radius divided by 4.
The classes of the units will be taken from the default array (by default light riflemen).

[UnitNATO_General,150,west,50,0.7,["B_Soldier_AR","B_Soldier_GL"]] call ws_fnc_createGarrison;
Place 50 NATO soldiers in buildings in a 150m radius around the Object (unit) named UnitNATO_General. 
All of them will be either AT or Grenadier. Only fill the buildings to 70% percent.

["mkrOutpost",50,opfor,0,0.8,"gendarmerie","3ifb"] call ws_fnc_createGarrison;
This will create units in buildings 50m around the marker named "mkrOutpost". 
The number of units will the the number of buildings in the radius divided by 4.
The classes of the units will be Gendarmerie and their side opfor.
AssignGear AI will be run on the spawned units, giving them the loadouts defined for the "3ifb" faction in assignGear.sqf.

RETURNS
array of created units
*/

// DECLARE VARIABLES
private ["_debug","_buildings","_grp"];

// PARAMETERS
params [
	["_area", "", ["", objNull, grpNull, locationNull, []]],
	["_radius", 50, [0, []]],
	["_side", sideEmpty, [sideEmpty]],
	["_int", 0, [0]],
	["_thrsh", 0.8, [0]],
	["_classes", [], ["", []]],
	["_onlyEmptyBuildings", false, [false]],
	["_assignGearFaction", "none", [""]]
];

//Process radius paramter
if (_radius isEqualType 0) then {
	_radius = [0, _radius];
};
_radius params ["_radius_min","_radius_max"];

// Debug. If ws_debug is globally defined it overrides _debug
_debug = if !(isNil "ws_debug") then {ws_debug} else {false};

// Default classes based on side
if (count _classes == 0) then {
	_classes = switch (_side) do {
		case west; //or
		case blufor:      {"blu_f"};
		case east; //or
		case opfor:       {"opf_f"};
		case resistance; //or
		case independent: {"ind_f"};
		case civilian:    {"civ_f"};
	};
};

// To change which units are spawned for which faction, replace the array or add additional units to it
if (_classes isEqualType "") then {
	_classes = toLower _classes;
	_classes = switch (true) do {
		case (_classes in ["blu_f","nato"]): { // NATO
			["B_Soldier_lite_F","B_Soldier_F"]
		};
		case (_classes in ["blu_t_f","natopacific"]): { // NATO Pacific
			["B_T_Soldier_F"]
		};
		case (_classes in ["blu_ctrg_f","ctrg"]): { // CTRG
			["B_CTRG_Soldier_tna_F"]
		};
		case (_classes in ["blu_gen_f","gendarmerie"]): { // Gendarmerie
			["B_GEN_Soldier_F"]
		};
		case (_classes in ["opf_f","csat"]): { // CSAT
			["O_Soldier_lite_F","O_Soldier_F"]
		};
		case (_classes in ["opf_t_f","csatpacific"]): { // CSAT Pacific
			["O_T_Soldier_F"]
		};
		case (_classes in ["ind_f","aaf"]): { // AAF
			["I_Soldier_lite_F","I_Soldier_F"]
		};
		case (_classes in ["blu_g_f","opf_g_f","ind_g_f","fia"]): {  // FIA
			["B_G_Soldier_lite_F","B_G_Soldier_F"]
		};
		case (_classes in ["ind_c_f","syndikatparamilitary"]): { // Syndikat Paramilitary
			["I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_7_F"]
		};
		case (_classes in ["syndikatbandit"]): { // Syndikat Bandit
			["I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_5_F"]
		};
		case (_classes in ["civ_f","civ_idap_f","civilian"]): { // Civilian, IDAP
			[""]
		};
	};
};

//prepare and check buildings:

//check if _area is a list of buildings, if not: find buildings
_buildings = [];
if ( typename _area == "ARRAY" && {count _area > 0} && {typename (_area select 0) == "OBJECT"} && {_area select 0 isKindOf "House"} ) then {
	_buildings = _area;
	//Set BPos if not already set:
	{ [_x] call ws_fnc_getBPos } forEach _buildings;
} else {
	// Collect buildings and assign building positions
	_area = _area call ws_fnc_getEPos;
	_buildings = [_area,_radius_max,true,true] call ws_fnc_collectBuildings;
	if (_radius_min > 0) then {
		private _buildingsToRemove = [_area,_radius_min,true,true] call ws_fnc_collectBuildings;
		_buildings = _buildings - _buildingsToRemove;
	};
};

if (_onlyEmptyBuildings) then {
	//only use buildings that haven't been garrisoned yet! (this is useful when having overlapping garrison areas)
	_buildings = _buildings select { (_x getVariable ["ws_bunits",0]) == 0 };
};

//remove buildings without building positions
_buildings = _buildings select { count (_x getVariable ["ws_bPos", []]) > 0};

if (count _buildings == 0) exitWith {
	if(_debug) then {
		["ws_fnc_createGarrison DBG: no buildings found",[],""] call ws_fnc_debugText;
	};
	[]
};
//Note: At this point we have at least one building with at least one building position

// If no amount of units is set, calculate default
if (_int == 0) then {
	_int = round (count _buildings / 4);
};

if (_thrsh <= 0) then {_thrsh = 0.1};

// Create a new group
_grp = createGroup _side;

// Give the group a hold waypoint as otherwise ASR_AI might call them outside
[_grp, getPos (_buildings select 0), ["hold"]] call ws_fnc_addWaypoint;

for "_x" from 1 to _int do {
	private ["_b","_bpa","_bpl","_bu","_i","_bp","_u","_mkr"];

	_b = selectRandom _buildings;
	_bpa = _b getVariable "ws_bPos";
	_bpl = _b getVariable ["ws_bPosLeft",_bpa];
	_bu = _b getVariable ["ws_bUnits",0];

	// Loop until we have a building with enough free building positions
	while { count _bpl == 0 || {(_bu / (count _bpa)) >= _thrsh} } do {
		_buildings = _buildings - [_b];

		if (count _buildings == 0) exitWith {[]};

		_b = selectRandom _buildings;
		_bpa = _b getVariable "ws_bPos";
		_bpl = _b getVariable ["ws_bPosLeft",_bpa];
		_bu = _b getVariable ["ws_bUnits",0];
	};

	// If no buildings are left, exit
	if (count _buildings == 0) exitWith {[]};

	// Get a building position
	_i = floor (random (count _bpl));
	_bp = _bpl select _i;

	// Remove the building position from the array
	_bpl deleteAt _i;

	// Create a unit and move it into place
	_u = _grp createUnit [selectRandom _classes,_bp,[],5,"NONE"];
	_u setPosATL _bp;
	[_u] joinsilent _grp; //otherwise the side might be wrong
	dostop _u;
	//_u disableAI "PATH";

	_u spawn ws_fnc_setInsidePos; // SetInsidePos is fairly expensive, thus spawned

	// Set new variables
	_u setVariable ["ws_bpos",_bp,true];
	_b setVariable ["ws_bUnits",_bu + 1,true];
	_b setVariable ["ws_bPosLeft",_bpl,true]; 

	if (_debug) then {_mkr = createMarker [format ["%1-bpos",_u],getPos _u];_mkr setMarkerSize [0.5,0.5];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorGreen";};
};

// If assignGear AI parameter is enabled, set the faction on the spawned units then pass them to assignGear AI.
if (_assignGearFaction != "none") then {
	[units _grp,_assignGearFaction] call f_fnc_setVirtualFaction;
	[units _grp] execVM "f\assignGear\f_assignGear_AI.sqf";
};

// Prevent the group leader to issue attack orders to the members, improving their attack from buildings
_grp enableAttack false;

// Set the group's attack mode and stance
[_grp,"AWARE","YELLOW"] call ws_fnc_setAIMode;

// Return created unis
(units _grp)
