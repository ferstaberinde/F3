// AddWaypoint function
// v1 (14.04.2013)
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
//
// FEATURE
// Add waypoint to group. Waypoint can be of any regular Waypoint-Type or three custom types (see below)
//
// USAGE
// Minimal:
// [group,position] call ws_fnc_addWaypoint;
// Full:
// [group,position,["mode",modifier],["BEHAVIOUR","COMBATMODE","SPEED"],"code"] call ws_fnc_addWaypoint;
//
// OUTPUT
// Created waypoint
//
// PARAMETERS
// 1. name of group															| MANDATORY	
// 2. position. can be marker, object or [x,y,z]						 	| MANDATORY
// 3. array for waypoint type and modifier									| OPTIONAL - default is ["move",0], can be empty
// 	3.1. the waypoint type, can be:											
//		a. any of http://community.bistudio.com/wiki/setWaypointType
//  	b. "patrol" - the group moves to the position and starts a randomized patrol
//  	c. "defend" - the group moves to the position and mans all statics, guarding the area
//  	d. "garrison" - the group moves to the position, mans statics and takes position inside buildings, prioritizing bunkers and other military structures over civilian buildings
// 	3.2. modifier - the waypoint radius or radius to patrol/defend			
// 5. array defining waypoint behaviour, combatmode and speed				| OPTIONAL - default is ["AWARE","YELLOW","NORMAL], can be empty
// 6. code that is executed on waypoint completition						| OPTIONAL - must be string! (e.g. "hint 'waypoint completed'")
//
// EXAMPLES
// [GrpUS_CO,church] call ws_fnc_addWaypoint					| move the group named "GrpUS_CO" to the object named "church"
// [GrpUS_CO,"marker1",["patrol",50]] call ws_fnc_addWaypoint	|  move the group named "GrpUS_CO" to the marker named "marker1" and have them start a patrol in a 50m radius
// [GrpUS_CO,[5,8,0],["sad",250],["COMBAT","RED","FULL"],"hint 'reinforcements have arrived'"] call ws_fnc_addWaypoint	|  move the group named "GrpUS_CO" to [5,8,0] with full speed and have them start a sweep in a radius of 250. When they reach the waypoint the hint "reinforcements have arrived!" will be displayed

private ["_debug",
"_grp","_count","_pos","_modes","_mode","_marray","_behaviour","_speed","_modifier","_code",
"_wp","_mkr"];

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};  //Debug mode. If ws_debug is globally defined it overrides _debug

//Declaring variables
_count = count _this;
_grp = _this select 0;
_pos= [(_this select 1)] call ws_fnc_getPos;


//Array of all legal possible modes. See http://community.bistudio.com/wiki/setWaypointType
_modes = ["move","destroy","getin","sad","join","leader","getout","cycle","load","unload","tr unload","hold","sentry","guard","talk","scripted","support","getin nearest","dismiss","defend","garrison","patrol"];
_modifier = 0;
_mode = "move";
_marray = [];
_behaviour = ["AWARE","YELLOW","NORMAL"];					
_code = "";

//Interpreting variables   
//Setting up the array for the movepos
if (_count > 2) then {_marray = _this select 2;};
if (count _marray > 0) then {_mode = _marray select 0;};if (count _marray > 1) then {_modifier = _marray select 1;};
if (_count > 3) then {_behaviour = _this select 3;if (count _behaviour < 3) then {_behaviour = ["AWARE","YELLOW","NORMAL"];};};
if (_count > 4) then {_code = _this select 4};
   
//Fault checks
//Checking the variables we have enough against what we should have
[_grp,["GROUP"],format ["ws_fnc_createWaypoint: %1",_x]] call ws_fnc_typecheck;
[_mode,["STRING"],format ["ws_fnc_createWaypoint: %1",_x]] call ws_fnc_typecheck;
[_modifier,["SCALAR"],format ["ws_fnc_createWaypoint: %1",_x]] call ws_fnc_typecheck;
[_code,["STRING"],format ["ws_fnc_createWaypoint: %1",_x]] call ws_fnc_typecheck;
{[_x,["ARRAY"],format ["ws_fnc_createWaypoint: %1",_x]] call ws_fnc_typecheck;}  forEach [_pos,_behaviour,_marray];

if !(_mode in _modes) exitWith {["ws_fnc_addWaypoint ERROR: ",_mode," is not a legal waypoint mode"] call ws_fnc_debugText;};

//WAYPOINT CREATION
_wp = _grp addWaypoint [_pos,0];

//Setting behaviour etc for waypoint
_wp setWaypointBehaviour (_behaviour select 0);
_wp setWaypointCombatMode (_behaviour select 1);
_wp setWaypointSpeed (_behaviour select 2);

_wp = _grp addWaypoint [_pos,0];
switch (_mode) do {   
	case "sad": {
		_grp setCombatMode "RED";
		_wp setWaypointPosition [_pos,_modifier];
		_wp setWaypointType "SAD";
		_wp setWaypointStatements ["true", format["%1",_code]];
	};

	case "defend": {
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", format["[group this,getPos this,%2,true,false,false] call ws_fnc_taskDefend;%1",_code,_modifier]];
	};
	
	case "garrison": {
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", format["[group this,getPos this,%2,true,true,true] call ws_fnc_taskDefend;%1",_code,_modifier]];
	};
	
	case "patrol": {
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", format["[group this,getPos this,%2] call BIS_fnc_taskPatrol;%1",_code,_modifier]];
	};
	
	default {
		_wp setWaypointPosition [_pos,_modifier];
		_wp setWaypointType _mode;
		_wp setWaypointStatements ["true", format["%1;",_code]];
	};
};

_grp setCurrentWaypoint _wp;

if (_debug) then {
player globalchat format ["DEBUG: ws_fnc_createWaypoint. Waypoint %1 for _grp%2 created",_wp,_grp];
   
  _mkr = createMarker [format ["%1-WP",_wp],waypointPosition _wp]; 
  _mkr setMarkerType "mil_dot";
  _mkr setMarkerColor "ColorBlue";
  _mkr setMarkerText format ["DBG:Grp_%1-WP-%2",_grp,_mode];

};
   
_wp