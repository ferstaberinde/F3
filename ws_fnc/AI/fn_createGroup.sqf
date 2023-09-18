// WS_fnc_createGroup
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
//
// FEATURE
// Spawns an infantry group of the desired side
//
// USAGE
// Minimal:
// [position,side,size,[["forcedclasses"],["commonclasses"]] call ws_fnc_createGroup;
// Full:
// [position,side,size,[["forcedclasses"],["commonclasses"]],{code}] call ws_fnc_createGroup;
//
// RETURNS
// [created group,arguments]
//
// PARAMETERS
// 1. position (can be object, marker or array)							| MANDATORY
// 2. Side as west,east,resistance or civilian							| MANDATORY
// 3 The size of the group (any integer)								| MANDATORY
// 4. Array containing two sub arrays:								| MANDATORY
// 	4.1 Array of classes that are exactly ONCE in the group					| MANDATORY
// 	4.2 Array of classes that fill up the group after all forced classes are used		| MANDATORY
// 5. code that is executed after the group is spawned						| OPTIONAL - executed as [_grp,_this] spawn _code, code has to be string or code

private ["_debug","_grp","_mkr"];

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug}; //Debug mode. If ws_debug is globally defined it overrides _debug

params [
	["_pos", objNull, ["", objNull, grpNull, locationNull, []]],
	["_side", sideUnknown, [sideUnknown]],
	["_size", 0, [0]],
	["_classes", [], [[]]],
	["_code", {}, [{},""]]
];
_pos = _pos call ws_fnc_getEpos;

//Declaring variables
_classes params [
	["_forcedclasses", [], [[]]],
	["_commonclasses", [], [[]]]
];

if (_debug) then {
	["ws_fnc_createGroup DBG: running with: ",_this,""] call ws_fnc_debugText;
};

//Creating the group
_grp = createGroup _side;

//Create the group leader around who the group assembles
_grp createUnit [_forcedclasses select 0,_pos,[],0,"NONE"];

for "_x" from 2 to (_size) do {
	if (_x <= (count _forcedclasses)) then {
		_grp createUnit [_forcedclasses select (_x - 1),_pos,[],5,"NONE"];
	} else {
		_grp createUnit [selectRandom _commonclasses,_pos,[],5,"NONE"];
	};
};

//Weird step necessary to get the correct side for the group
{
	[_x] joinSilent _grp;
} forEach units _grp;

[_grp,"AWARE","YELLOW"] call ws_fnc_setAIMode;

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
		params ["_grp","_mkr"];
		while { {alive _x} count (units _grp) > 0 } do {
			sleep 5;
			_mkr setMarkerPos (getPos (leader _grp));
		};
	_mkr setMarkerColor "ColorRed";
	_mkr setMarkerText format ["DBG:Grp %1 dead",_grp];
	};
};

//Output the created group and parameters
[_grp,_this]
