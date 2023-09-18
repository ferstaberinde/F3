/*
ws_fnc_taskDefend
Last Update 19.09.2013
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Thanks to Rommel's CBA_fnc_taskDefend and Binesi's improved BIS_fnc_taskDefend

FEATURE
Have a group man statics and garrison in buildings in a given radius around a position. They prioritize military structures over civilian buildings

NOTE
To avoid perfomance issues the garrisoning troops will just enter the building and stay there, they won't necessarily face in a smart direction

RETURNS
units outside buildings (array)

USAGE
Minimal:
[group,position,radius] call ws_fnc_taskDefend;
Full:
[group,pos,radius,bool,bool,bool] call ws_fnc_taskDefend

PARAMETERS
1. name of group																			| MANDATORY
2. position. can be marker, object or [x,y,z]												| MANDATORY
3. radius of the area where statics/buildings will be occupied								| MANDATORY
4. Whether to man statics or not															| OPTIONAL - default is TRUE
5. Whether to garrison military structures  modify _milarray for military building classes	| OPTIONAL - default is TRUE	-
6. Whether to garrison civilian buildings													| OPTIONAL - default is TRUE

EXAMPLE
[group this,getPosATL this,200] call ws_fnc_taskDefend - in the on activation field of a waypoint this would cause the assigned group to take position in buildings in a 200m radius around the WP

[GrpUS_CO,"mkrTown",150,false,false,true] call ws_fnc_taskDefend - this causes the group assigned as "GrpUS_CO" to take positions in only civilian buildings in a radius of 150 around the marker named "mkrTown"

*/

private ["_debug","_milarrayA2","_badarrayA3","_milarrayA3","_badarrayA2",
"_mthreshold","_cthreshold","_buildings","_milbuildings","_badarray","_milarray","_units","_mkr"];

params [
	["_group", grpNull, [grpNull]],
	["_pos", objNull, ["", objNull, grpNull, locationNull, []]],
	["_radius", 0, [0]],
	["_guns", true, [true]],
	["_garrison", true, [true]],
	["_civil", true, [true]]
];

_pos = _pos call ws_fnc_getEPos;

//Customizable Variables
_mthreshold = 1; // Percentage of building positions to occupy in military buildings (1=all)
_cthreshold = 1; // Percentage of building positions to occupy in civilian buildings (1=all)

// ARMA 2 only
// Military buildings that are garrisoned before civilian buildings
_milarrayA2 = ["Land_Fort_Watchtower","Land_Fort_Watchtower_EP1","Land_fortified_nest_small","Land_fortified_nest_small_EP1","Land_fortified_nest_big","Land_fortified_nest_big_EP1","Land_Mil_Guardhouse_EP1","Land_Mil_ControlTower","Land_Mil_ControlTower_EP1"];
// Buildings NEVER to garrison
_badarrayA2 = ["Land_Misc_Cargo1Ao","Land_Misc_Cargo1Bo","Land_Misc_Cargo1Bo_military","Land_vysilac_FM2","Land_vysilac_FM","Land_Ind_MalyKomin"];

// ARMA 3 only
// Military buildings that are garrisoned before civilian buildings
_milarrayA3 = ["Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Radar_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_Bunker_F","Land_Airport_Tower_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_F","Land_u_Barracks_V2_F","Land_Barracks_03_F","Land_Barracks_04_F","Land_Barracks_05_F","Land_ControlTower_01_F","Land_GuardTower_01_F","Land_Bunker_02_light_double_F","Land_Bunker_02_light_left_F","Land_Bunker_02_left_F","Land_Bunker_02_double_F","Land_Bunker_02_light_right_F","Land_Bunker_02_right_F","Land_Radar_01_antenna_base_F","Land_Radar_01_HQ_F","Land_Bunker_01_big_F","Land_Bunker_01_HQ_F","Land_Bunker_01_small_F","Land_Bunker_01_tall_F","Land_Barracks_01_dilapidated_F","Land_BagBunker_Small_F","Land_BagBunker_01_small_green_F","Land_Barracks_01_grey_F","Land_BagBunker_large_F","Land_BagBunker_01_large_green_F","Land_BagBunker_01_tower_F","Land_BagBunker_Tower_F","Land_HBarrier_01_big_tower_green_F","Land_HBarrierTower_F","Land_Cargo_HQ_V4_F","Land_Cargo_Patrol_V4_F","Land_Cargo_Tower_V4_F","Land_PillboxBunker_01_big_F","Land_PillboxBunker_01_hex_F","Land_PillboxBunker_01_rectangle_F","land_gm_tower_bt_6_fuest_80","land_gm_euro_barracks_02","land_gm_euro_barracks_02_win"];
// Buildings NEVER to garrison
_badarrayA3 = [];

//Debug mode. If ws_debug is globally defined it overrides _debug
_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};

_buildings = [_pos,_radius] call ws_fnc_collectBuildings;
_milarray = [];
_badarray = [];
_milbuildings = [];

//Add buildings specific to the game version
if !(ws_game_a3) then {
	_milarray = _milarrayA2;
	_badarray = _badarrayA2;
};

if (ws_game_a3) then {
	_milarray = _milarrayA3;
	_badarray = _badarrayA3;
};

//Remove undesired classes from the array and populate the array containg military buildings in the area
{
    if ((str(_x buildingpos 1) != "[0,0,0]") && typeof _x in _milarray) then {_milbuildings pushback (_x);_buildings = _buildings - [_x]};
    if ((str(_x buildingpos 0) == "[0,0,0]") || (typeOf _x in _badarray)) then {_buildings = _buildings - [_x]};
} foreach _buildings;

_units = units _group;
_group enableAttack false; // Prevent the group leader to issue attack orders to the members, improving their attack from buildings

//Man the statics
if (_guns) then {
	_units = [_group, _radius] call ws_fnc_taskCrew;
};

// Fill bunkers etc
if (count _milbuildings > 0 && count _units > 0 && _garrison) then {
_units = [_units,_milbuildings,_mthreshold] call ws_fnc_enterbuilding;

	if (_debug) then {{_mkr = createMarker [format ["%1-bpos",_x],_x];_mkr setMarkerSize [0.4,0.4];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorWhite";}forEach _milbuildings;};
};

//Take position in regular buildings
if (count _buildings > 0 && count _units > 0 && _civil) then {
_units = [_units,_buildings,_cthreshold] call ws_fnc_enterbuilding;
	if (_debug) then {{_mkr = createMarker [format ["%1-bpos",_x],_x];_mkr setMarkerSize [0.4,0.4];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorWhite";}forEach _buildings;};
};

// Give HOLD waypoint to ensure units focus on defending

//If there's one unit left they either patrol or hold the area.
if (count _units >= 1) then {
	_group = createGroup (side (_units select 0));
	_units joinSilent _group;
	if (random 1 > 0.5) then {[_group,_pos,["hold",_radius]] call ws_fnc_addWaypoint;} else {
		[_group,_pos,["patrol",_radius]] call ws_fnc_addWaypoint;
	};
};

_units
