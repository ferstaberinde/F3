// TaskDefend Function
// v1 (14.04.2013)
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
// Thanks to Rommel's CBA_fnc_taskDefend and Binesi's improved BIS_fnc_taskDefend
//
// FEATURE
// Have a group man statics and garrison in buildings in a given radius around a position. They prioritize military structures over civilian buildings
//
// NOTE
// To avoid perfomance issues the garrisoning troops will just enter the building and stay there, they won't necessarily face in a smart direction
//
// USAGE
// Minimal:
// [group,position,radius] call ws_fnc_taskDefend;
// Full:
// [group,pos,radius,bool,bool,bool] call ws_fnc_taskDefend
//
// PARAMETERS
// 1. name of group															| MANDATORY	
// 2. position. can be marker, object or [x,y,z]						 	| MANDATORY
// 3. radius of the area where statics/buildings will be occupied			| MANDATORY
// 4. Whether to man statics or not											| OPTIONAL - default is TRUE
// 5. Whether to garrison military structures								| OPTIONAL - default is TRUE	- modify _milarray for military building classes
// 6. Whether to garrison civilian buildings								| OPTIONAL - default is FALSE
//

private ["_debug","_count",
"_group","_newGroup","_pos","_radius","_guns","_garrison","_civil",
"_buildings","_vehicles","_milbuildings","_staticarray","_badarray","_milarray","_units","_units2","_static"];

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug}; //Debug mode. If ws_debug is globally defined it overrides _debug

//Customizable variables
// Military buildings that are garrisoned before civilian buildings
_milarray = ["Land_Fort_Watchtower","Land_Fort_Watchtower_EP1","Land_fortified_nest_small","Land_fortified_nest_small_EP1","Land_fortified_nest_big","Land_fortified_nest_big_EP1","Land_Mil_Guardhouse_EP1","Land_Mil_ControlTower","Land_Mil_ControlTower_EP1"];
// Buildings NEVER to garrison
_badarray = ["Land_Misc_Cargo1Ao","Land_Misc_Cargo1Bo","Land_Misc_Cargo1Bo_military","Land_vysilac_FM2","Land_vysilac_FM","Land_Ind_MalyKomin"];

//Declaring variables
_count = count _this;
_group = _this select 0;
_pos = _this select 1;
_radius = _this select 2;
_guns = true;				//Man statics?
_garrison = true;			//Garrison military structures? - defined in _milarray
_civil = false;				//Garrison civilian buildings?
if (_count > 3) then {_guns = _this select 3};
if (_count > 4) then {_garrison = _this select 4};
if (_count > 5) then {_civil  = _this select 5};



_buildings = nearestObjects [_pos,["building"],_radius];
_vehicles =  nearestObjects [_pos,["LandVehicle"],_radius];
_milbuildings = [];
_staticarray = [];
_units = units _group;
_units2 = _units - [leader _group];

//Create an array containing all vehicles in the area that are uncrewed and have a free gunner seat
{
	if ((_x emptyPositions "gunner") > 0 && !(locked _x) && ((count crew _x) == 0)) then 
	{
		_staticarray = _staticarray + [_x];    
	};
} forEach _vehicles;

//Create an array containing all civilian buildings in the area with a least 3 positions inside
//Create a subarray containing all military type buildings
{
	if (typeof _x in _milarray) then {_milbuildings = _milbuildings + [_x];};
	if ((str(_x buildingpos 5) == "[0,0,0]") || (typeof _x in _badarray) || (typeof _x in _milarray) || (damage _x >= 0.5)) then {_buildings = _buildings - [_x]};
} foreach _buildings;

//Man the statics
if (count _staticarray > 0 && _guns) then {
while {(count _staticarray > 0) && (count _units > 2)} do {
			["ws_taskDefend1",[_static,_staticarray],""] call ws_fnc_debugText;
			_static = _staticarray select 0;
			_staticarray = _staticarray - [_static];
			["ws_taskDefend2",[_static,count _staticarray],""] call ws_fnc_debugText;
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

// Fill bunkers etc
if (count _milbuildings > 0 && count _units > 0 && _garrison) then {
_units = [_units,_milbuildings,2] call ws_fnc_enterbuilding;
if (_debug) then {{_mkr = createMarker [format ["%1-bpos",_x],_x];_mkr setMarkerSize [0.4,0.4];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorWhite";}forEach _milbuildings;};
};

//Take position in regular buildings
if (count _buildings > 0 && count _units > 0 && _civil) then {
_units = [_units,_buildings,5] call ws_fnc_enterbuilding;
if (_debug) then {{_mkr = createMarker [format ["%1-bpos",_x],_x];_mkr setMarkerSize [0.4,0.4];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorWhite";}forEach _buildings;};
};

//By disabling enableAttack every unit engages by itself
_group enableattack false;

//If there are at least three units left they are put in new groups either patroling holding the area.
if (count _units >= 3) then {
_newgroup = createGroup (side (leader _group));
{
[_x] joinSilent _newGroup;
} forEach _units;
if (random 1 > 0.5) then {[_newGroup,_pos,["hold",_radius]] call ws_fnc_addWaypoint;} else {
[_newGroup,_pos,["patrol",_radius]] call ws_fnc_addWaypoint;
};
};

true