 /*ws_fnc_addWaypoint
Latest: 08.03.2014
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Add waypoint to group. Waypoint can be of any regular Waypoint-Type or custom types (see below).
Waypoint is NOT made current one, it is simply added to the group's list of waypoints.

USAGE
Minimal:
[group,position] call ws_fnc_addWaypoint;
Full:
[group,position,["mode",modifier,completition radius, force road],["BEHAVIOUR","COMBATMODE","SPEED"],"code"] call ws_fnc_addWaypoint;

OUTPUT
Created waypoint

PARAMETERS
1. name of group														| MANDATORY
2. position. can be marker, object or [x,y,z]						 	| MANDATORY
3. array for waypoint type and modifier									| OPTIONAL - default is ["move",0,0,false], can be empty
	3.1. the waypoint type, can be:
		a. any of http:community.bistudio.com/wiki/setWaypointType
		b. "patrol" - the group moves to the position and starts a randomized patrol
		c. "defend" - the group moves to the position and mans all statics, guarding the area
		d. "garrison" - the group moves to the position, mans statics and takes position inside buildings, prioritizing bunkers and other military structures over civilian buildings
		e. "ambush" - group finds a position in the radius of (modifier) that provides overwatch over the initial position, then goes into stealth mode. When an emey approaches the position or their hiding spot they change to search & destroy.
	3.2. modifier - the waypoint radius or radius to patrol/defend/find ambush position/wait after landing
	3.3. completition radius - the radius for the radius to be completed in
	3.4 force road	- whether the radius has to be on a road
5. array defining waypoint behaviour, combatmode and speed				| OPTIONAL - default is ["AWARE","YELLOW","NORMAL], can be empty
6. code that is executed on waypoint completition						| OPTIONAL - must be string! (e.g. "hint 'waypoint completed' ")

EXAMPLES
[GrpUS_CO,church] call ws_fnc_addWaypoint					| move the group named "GrpUS_CO" to the object named "church"
[GrpUS_CO,"marker1",["patrol",50]] call ws_fnc_addWaypoint	|  move the group named "GrpUS_CO" to the marker named "marker1" and have them start a patrol in a 50m radius
[GrpUS_CO,[5,8,0],["sad",250],["COMBAT","RED","FULL"],"hint 'reinforcements have arrived'"] call ws_fnc_addWaypoint	|  move the group named "GrpUS_CO" to [5,8,0] with full speed and have them start a sweep in a radius of 250. When they reach the waypoint the hint "reinforcements have arrived!" will be displayed
*/

private ["_debug",
"_grp","_count","_pos","_modes","_mode","_marray","_behaviour","_speed","_modifier","_compl","_code",
"_wp","_mkr"];

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};  //Debug mode. If ws_debug is globally defined it overrides _debug

//Declaring variables
_count = count _this;
_grp = _this select 0;
_marray = [_this,2,[]] call BIS_fnc_Param;
_behaviour = [_this,3,[]] call BIS_fnc_Param;
_code = [_this,4,""] call BIS_fnc_Param;

//Array of all legal possible modes. See http://community.bistudio.com/wiki/setWaypointType
_modes = ["move","destroy","getin","sad","join","leader","getout","cycle","load","unload","tr unload","hold","sentry","guard","talk","scripted","support","getin nearest","dismiss","defend","garrison","patrol","ambush"];
_modifier = 0;
_compl = 0;
_road = false;
_mode = "move";

//Interpreting variables
//Setting up the array for the movepos
if (count _marray > 0) then {_mode = _marray select 0;};
if (count _marray > 1) then {_modifier = _marray select 1;};
if (count _marray > 2) then {_compl = _marray select 2;};
if (count _marray > 3) then {_road = _marray select 3;};
if (_count > 4) then {_code = _this select 4};

_pos = if !(_road) then {(_this select 1) call ws_fnc_getEPos;} else {[(_this select 1),150,5] call ws_fnc_NearestRoadPos};


//Fault checks
//Checking the variables we have enough against what we should have
[_grp,["GROUP"],format ["ws_fnc_createWaypoint: %1",_grp]] spawn ws_fnc_typecheck;
[_mode,["STRING"],format ["ws_fnc_createWaypoint: %1",_mode]] spawn ws_fnc_typecheck;
[_modifier,["SCALAR"],format ["ws_fnc_createWaypoint: %1",_modifier]] spawn ws_fnc_typecheck;
[_code,["STRING"],format ["ws_fnc_createWaypoint: %1",_code]] spawn ws_fnc_typecheck;
{[_x,["ARRAY"],format ["ws_fnc_createWaypoint: %1",_x]] spawn ws_fnc_typecheck;}  forEach [_pos,_behaviour,_marray];

if !(toLower _mode in _modes) exitWith {["ws_fnc_addWaypoint ERROR: ",_mode," is not a legal waypoint mode"] call ws_fnc_debugText;};

//WAYPOINT CREATION
_wp = _grp addWaypoint [_pos,0];

switch (_mode) do {
	case "sad": {
		_wp setWaypointPosition [_pos,_modifier];
		_wp setWaypointStatements ["true", format["%1",_code]];
		_behaviour = ["AWARE","RED","FULL"];
	};

	case "defend": {
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", format["[group this,getPos this,%2] spawn ws_fnc_taskDefend;%1",_code,_modifier]];
	};

	case "garrison": {
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", format["[group this,getPos this,%2,true,true,true] spawn ws_fnc_taskDefend;%1",_code,_modifier]];
	};

	case "patrol": {
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", format["[group this,getPos this,%2] spawn BIS_fnc_taskPatrol;%1",_code,_modifier]];
	};

	case "ambush": {
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", format["[group this,getPos this,%2] spawn ws_fnc_taskAmbush;%1",_code,_modifier]];
		_wp setWaypointCompletionRadius 50;
	};

	default {
		_wp setWaypointPosition [_pos,_modifier];
		_wp setWaypointType _mode;
		_wp setWaypointStatements ["true", format["%1;",_code]];
	};
};

//Setting behaviour etc for waypoint
if (count _behaviour > 0) then {
	_wp setWaypointBehaviour (_behaviour select 0);
	_wp setWaypointCombatMode (_behaviour select 1);
	_wp setWaypointSpeed (_behaviour select 2);
	_wp setWaypointCompletionRadius _compl;
};

//_grp setCurrentWaypoint _wp;

if (_debug) then {
player globalchat format ["DEBUG: ws_fnc_createWaypoint. Waypoint %1 for _grp%2 created",_wp,_grp];

  _mkr = createMarker [format ["%1-WP",_wp],waypointPosition _wp];
  _mkr setMarkerType "mil_dot";
  _mkr setMarkerColor "ColorBlue";
  _mkr setMarkerText format ["DBG:Grp_%1-WP-%2",_grp,_mode];

};

_wp