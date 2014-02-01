// ws_fnc_createVehicle
// v1 (13.04.2013)
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
//
// FEATURE
// Spawns a vehicle of the desired side, loaded with driver and (if available) gunner
//
// USAGE
// Minimal:
// [position,side,vehicleclass] call ws_fnc_createVehicle;
// Full:
// [pos,side,"vehicleclass",["option1","option2"],[no of guards,["guardclasses"],loaded],["BEHAVIOUR","COMBATMODE"],{code}] call ws_fnc_createVehicle
//
// RETURNS
// [created vehicle,group of vehicle,initially parsed arguments]
//
// PARAMETERS
// 1. position, can be array, object or marker											| MANDATORY
// 2. Side as west,east,resistance or civilian OR existing group		 							| MANDATORY
// 3. legit vehicleclass														| MANDATORY
// 4. Array of strings to define additional vehicle settings:					| OPTIONAL - can be empty, order does not matter
//	 . "improved" - improved vehicle behaviour as per ws_fnc_betterVehicle
//	 . "disableTIEquipment" - disables thermal imaging optics
//	 . "clearcargo" - clears the vehicles cargo space
//   . "flying"	- vehicle is spawned as flying
//   . "lockall","lockturret","lockdriver","lockcargo" - locks the entire vehicle or the corresponding seats
//   . "v_car","v_ifv","v_tr" - F2/F3 only. Loads the vehicle with the faction-specific cargo
// 5. Array to define units guarding and loaded in the vehicle:		| OPTIONAL - can be empty, default is no guards
//	5.1. number of guards (int > 0)
//  5.2. array with classnames of possible guard units
//  5.3. bool wether guards are loaded into the vehicle			| If more guards than cargo seats are spawned the units outside are put into their own group next to the vehicle
// 6. code that is executed after the vehicle is spawned			| OPTIONAL - executed as [_veh,_vehgrp,_this] spawn _code; Code has to be string or code
//
/* EXAMPLES
 ["base",resistance,"HMMWV_M2"] call ws_fnc_createVehicle; - spawn a M2 HMMWV at marker base belonging to side independent

[getPos t2,GrpOpfHQ,"BMP3",["lockturret","clearcargo"],[5,["RU_Soldier_2","RU_Soldier_1"],true]] call ws_fnc_createVehicle; - Spawn a BMP3 at object t2 that belongs to the group GrpOPFHQ, has a locked turret and empty cargo and 5 soldiers loaded inside.
*/

private ["_debug",
"_count","_pos","_side","_type","_modarray","_behaviour",
"_guardarray","_guards","_guardclasses","_load","_code",
"_veh","_grp","_mod","_vehgrp"];

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};  //Debug mode. If ws_debug is globally defined it overrides _debug

//Declare variables
_count = count _this;
_pos = [(_this select 0)] call ws_fnc_getPos;
_side = _this select 1;
_type = _this select 2;
_modarray = [];

//The default behaviour
//_behaviour = ["AWARE","YELLOW"];

_guardarray = [];
_guards = 0;
_guardclasses = [];
_load = false;
_code = {};

//Optinal parameters
if (_count > 3) then {_modarray = _this select 3};
if (_count > 4) then {
	_guardarray = _this select 4;
	if (count _guardarray == 3) then {
	_guards = _guardarray select 0; //Number of troops spawned
	_guardclasses = _guardarray select 1; //Classes of troops spawned
	_load = _guardarray select 2;	//if troops are loaded in
	};
};
if (_count > 5) then {_code = _this select 5};

//Fault checks
//Checking the variables we have enough against what we should have
{[_x,["SIDE","GROUP"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_side];
{[_x,["STRING"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_type];
{[_x,["ARRAY"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_pos,_guardarray,_guardclasses,_modarray];
{[_x,["BOOL"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_load];
{[_x,["SCALAR"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_guards,_pos select 0,_pos select 1];
{[_x,["STRING","CODE"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_code];

if (typename _side == "SIDE") then {
_grp = createGroup _side;} else
{_grp = _side};

//Creating the vehicle
_mod = "NONE";
if ("flying" in _modarray) then {_mod = "FLY"};
_veh = createVehicle [_type,_pos,[],0,_mod];

//Crew the vehicle
//Get the default crew for the vehicle
_crew = (getArray (configFile >> "CfgVehicles" >> _type >> "typicalcargo")) select 0;
//Commander
if ((_veh emptyPositions "Commander") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsCommander _veh; _crewman moveInCommander _veh;};
//Gunner
if ((_veh emptyPositions "Gunner") > 0) then {_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsGunner _veh; _crewman moveInGunner _veh;};
//Driver
_crewman =_grp createUnit [_crew, _pos, [], 0, "NONE"]; _crewman assignAsDriver _veh; _crewman moveInDriver _veh;

//Weird step necessary to get the correct side for the vehicle crew
{
[_x] joinSilent _grp;
} forEach crew _veh;

_vehgrp = _grp;

[_grp,"AWARE","YELLOW"] call ws_fnc_setAIMode;

//Create the infantry nearby. Load them up if flag is set, put units that don't fit in cargo in new group
if (_guards > 0) then {
	_grp = createGroup _side;

	for "_x" from 1 to _guards do {
		_unit = _grp createUnit [_guardclasses call ws_fnc_selectRandom, getPos _veh, [], 2, "NONE"];
	};

	if (_load) then {
		_guards = [_veh,_grp] call ws_fnc_loadVehicle;

		if (count _guards > 0) then {
			_grp = createGroup _side;
			{[_x] joinSilent _grp} forEach _guards;
			[_grp,getPos _veh,["hold",50]] call ws_fnc_addWaypoint;
		};
	} else {
		[_grp,getPos _veh,["hold",50]] call ws_fnc_addWaypoint;
	}
};

// Set the extra options for the vehicle
{
	switch (_modarray select _forEachIndex) do {
		case "improved": {if (canfire _veh) then {[_veh,0.8] call ws_fnc_bettervehicle;};};
		case "clearcargo": {clearWeaponCargoGlobal _veh;clearMagazineCargoGlobal _veh;};
		case "lockall": {_veh lock true;};
		case "lockdriver": {_veh lockDriver true;};
		case "lockcargo": {_veh lockCargo true;};
		case "lockturret": {_veh lockTurret [[0],true];};
		case "allowcrewinimmobile": {_veh allowcrewinimmobile true;};
		case "v_ifv": {[_veh,"v_ifv"] call f_fnc_assignGear;};
		case "v_tr": {[_veh,"v_tr"] call f_fnc_assignGear;};
		case "v_car": {[_veh,"v_car"] call f_fnc_assignGear;};
		case "flying": {};
		case "disableTIEquipment": {_veh disableTIEquipment true};
		default {["ws_fnc_createVehicle: ",(_modarray select _forEachIndex)," is not a valid input for the _modarray!"] call ws_fnc_debugText;}
	};
} forEach _modarray;

_veh setDir (random 360);

//After the spawn is done execute code
[_veh,_this] spawn _code;

//Debug stuff
if (_debug) then {
	player globalchat format ["DEBUG: ws_createVehicle. Vehicle created. _veh:%1, side: %2, modificators: %3",_veh,_side, _modarray];

	_mkr = createMarker [format ["_veh_%1",_veh], _pos];
	_mkr setMarkerType "n_armor";
	_mkr setMarkerColor "ColorGreen";
	_mkr setMarkerText format ["DBG:Veh %1",_veh];
	_mkr setMarkerSize [0.5,0.5];

	[_veh,_mkr] spawn {
		  while {alive (_this select 0)} do {
		 sleep 5;
		 (_this select 1) setMarkerPos (getPos (_this select 0));
		 };

	 (_this select 1) setMarkerColor "ColorRed";
	 (_this select 1) setMarkerText format ["DBG:Grp %1 dead",_this select 0];
	};
};

//Script outputs the generated vehicle
[_veh,_vehgrp,_grp,_this]