// WS_fnc_createGroup
// v1 (13.04.2013)
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
//
// FEATURE
// Spawns a group of the desired side
//
// USAGE
// Minimal:
// [position,side,size,[["forcedclasses"],["commonclasses"]] call ws_fnc_createGroup;
// Full:
// [position,side,size,[["forcedclasses"],["commonclasses"]],["BEHAVIOUR","COMBATMODE"],{code}] call ws_fnc_createGroup;
//
// RETURNS
// [created group,arguments]
//
// PARAMETERS
// 1. position as array [x,y,z]									| MANDATORY
// 2. Side as west,east,resistance or civilian							| MANDATORY
// 3 The size of the group (any integer)								| MANDATORY
// 4. Array containing two sub arrays:								| MANDATORY
// 	4.1 Array of classes that are exactly ONCE in the group					| MANDATORY
// 	4.2 Array of classes that fill up the group after all forced classes are used		| MANDATORY
// 5. Array to define default behaviour and combatmode 					| OPTIONAL - default is ["AWARE","YELLOW"], can be empty
// 6. code that is executed after the group is spawned						| OPTIONAL - executed as [_grp,_this] spawn _code, code has to be string or    // code

private ["_debug","_count",
"_faction","_spawn","_waypoint","_classes_array","_commonclasses","_forcedclasses","_rareclasses","_rarechance","_respawns",
"_side","_pos","_behaviour","_code","_grp","_wp","_mkr"];

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug}; //Debug mode. If ws_debug is globally defined it overrides _debug

//Declaring variables
_count = count _this;
_pos = _this select 0;
_side = _this select 1;
_size = _this select 2 ;
_forcedclasses = (_this select 3) select 0;
_commonclasses = (_this select 3) select 1;

_behaviour = ["AWARE","YELLOW"];
_code = {};

//Optional parameters parsed with the call
if (_count > 4) then {_behaviour = _this select 4;if (count _behaviour < 2) then {_behaviour = ["AWARE","YELLOW"];};};
if (_count > 5) then {_code = _this select 5;};

["ws_fnc_createGroup DBG: running with: ",_this,""] call ws_fnc_debugText;

//Fault checks
//Checking the variables we have enough against what we should have
{[_x,["SIDE"],"ws_fnc_spawnGroup"] call ws_fnc_typecheck;} forEach [_side];
{[_x,["ARRAY"],"ws_fnc_spawnGroup"] call ws_fnc_typecheck;} forEach [_commonclasses,_forcedclasses,_behaviour,_pos];
{[_x,["SCALAR"],"ws_fnc_spawnGroup"] call ws_fnc_typecheck;} forEach [_size];
{[_x,["STRING","CODE"],"ws_fnc_spawnGroup"] call ws_fnc_typecheck;} forEach [_code];

//Creating the group
_grp = createGroup _side;

//REWRITE: assign folk gear ?
//Create the group leader around who the group assembles
_unit = _grp createUnit [_forcedclasses select 0,_pos,[],0,"NONE"];

for "_x" from 2 to (_size) do {
  if (_x <= (count _forcedclasses)) then {
  _spos = [getPos leader _grp,5] call ws_fnc_getPos;
  _unit = _grp createUnit [_forcedclasses select (_x - 1),_spos,[],1,"NONE"];
  } else {
	 _spos = [getPos leader _grp,5] call ws_fnc_getPos;
	 _unit = _grp createUnit [_commonclasses call ws_fnc_selectrandom,_spos,[],1,"NONE"];
	 };
};

//Weird step necessary to get the correct side for the group
{
[_x] joinSilent _grp;
} forEach units _grp;

_grp setBehaviour (_behaviour select 0);
_grp setCombatMode (_behaviour select 1);

//After the spawn is done execute code
[_grp,_this] spawn _code;

//DEBUG
//Debug creates various markers and text messages helping to indicate where/when groups are spawned.
if (_debug) then {
player globalchat format ["DEBUG: ws_fnc_createGroup done. _grp:%1 of size: %2 and side %3",_grp,count (units _grp),side leader _grp];

  _mkr = createMarker [format ["Grp_%1",_grp], _pos];
  _mkr setMarkerType "n_inf";
  _mkr setMarkerColor "ColorBlue";
  _mkr setMarkerText format ["DBG:Grp %1",_grp];
  _mkr setMarkerSize [0.5,0.5];

  [_grp,_mkr] spawn {
	 _check = count (units (_this select 0));
	 while {_check > 0} do {
		_check = {alive _x} count (units (_this select 0));
		 sleep 5;
		 (_this select 1) setMarkerPos (getPos (leader (_this select 0)));
		 };

	 (_this select 1) setMarkerColor "ColorRed";
	 (_this select 1) setMarkerText format ["DBG:Grp %1 dead",_this select 0];
   };
};

//OBSOLETE
//
//Every 5 seconds we'll get a headcount of the group and if it's zero, a new group with the same conditions will spawn
//To make this work we have to spawn a script run in parallel, as we can't use sleep in call space (where this function is run)
//and don't need to check every frame, which a while loop without sleep does
/*
if (_respawns > 0) then {
  _respawns = _respawns - 1;
	  [_grp,[_pos,_side,[_size,_respawns],[_forcedclasses,_commonclasses],_behaviour,_code]] spawn {
	  _grp = _this select 0;
	  _args = _this select 1;

	  _check = count (units _grp);
	  while {_check > 0} do {
		 _check = {alive _x} count (units _grp);
		 sleep 5;
	  };
	  _args call ws_fnc_createGroup;
	  };
};
*/

//Output the created group
[_grp,_this]