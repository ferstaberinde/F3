// Vehicle spawn function
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
// [created vehicle,group of vehicle,arguments]
//
// PARAMETERS
// 1. position as array [x,y,z]													| MANDATORY
// 2. Side as west,east,resistance or civilian									| MANDATORY
// 3. legit vehicleclass														| MANDATORY
// 4. Array of strings to define additional vehicle settings:					| OPTIONAL - can be empty, order does not matter
//	 . "improved" - improved vehicle behaviour as per ws_fnc_betterVehicle
//	 . "disableTIEquipment" - disables thermal imaging optics
//	 . "clearcargo" - clears the vehicles cargo space
//   . "flying"	- vehicle is spawned as flying
//   . "lockall","lockturret","lockdriver","lockcargo" - locks the entire vehicle or the corresponding seats
//   . "v_car","v_ifv","v_tr" - F2 only. Loads the vehicle with the faction-specific cargo
// 5. Array to define units guarding and loaded in the vehicle:					| OPTIONAL - can be empty, default is no guards
//	1. number of guards (int > 0)
//  2. array with classnames of possible guard units
//  3. bool wether guards are loaded into the vehicle							| If more guards than cargo seats are spawned the units outside are put into their own group next to the vehicle
// 6. Array to define default behaviour and combatmode 							| OPTIONAL - default is ["AWARE","YELLOW"], can be empty
// 7. code that is executed after the vehicle is spawned						| OPTIONAL - executed as [_veh,_vehgrp,_this] spawn _code; Code has to be string or code
//
// EXAMPLES
// [getPos base,west,"HMMWV_M2"] call ws_fnc_createVehicle;
// [getPos t2,east,"BMP3",["lockturret","clearcargo","improved"],[5,["RU_Soldier_2","RU_Soldier_1"],true],["COMBAT","RED"],{sleep 5;_this select 0 setDamage 1}] call ws_fnc_createVehicle;

if !(isServer) exitWith {};

private ["_debug",
"_count","_pos","_side","_type","_modarray","_behaviour",
"_guardarray","_guards","_guardclasses","_load","_code",
"_veh","_grp","_mod","_vehgrp"];

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};  //Debug mode. If ws_debug is globally defined it overrides _debug

//Declare variables
_count = count _this;
_pos = _this select 0;
_side = _this select 1;
_type = _this select 2;
_modarray = [];

//The default behaviour
_behaviour = ["AWARE","YELLOW"];

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
if (_count > 5) then {_behaviour = _this select 5;if (count _behaviour < 2) then {_behaviour = ["AWARE","YELLOW"];};};
if (_count > 6) then {_code = _this select 6};

//Fault checks
//Checking the variables we have enough against what we should have
{[_x,["SIDE"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_side];
{[_x,["STRING"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_type];
{[_x,["ARRAY"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_pos,_behaviour,_guardarray,_guardclasses,_modarray];
{[_x,["BOOL"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_load];
{[_x,["SCALAR"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_guards,_pos select 0,_pos select 1];
{[_x,["STRING","CODE"],"ws_fnc_createVehicle"] call ws_fnc_typecheck;} forEach [_code];


_grp = createGroup _side;

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

_grp setBehaviour (_behaviour select 0);
_grp setCombatMode (_behaviour select 1);

//Create the infantry nearby. Load them up if flag is set, delete all units that don't fit in cargo
if (_guards > 0) then {
	_grp = createGroup _side;

	if !(_load) then {
		for "_x" from 1 to _guards do {
		_unit = _grp createUnit [_guardclasses call ws_fnc_selectRandom, getPos _veh, [], 2, "NONE"];
		};
	} else
	{
		_cargospace = getNumber(configfile >> "CfgVehicles" >> _type >> "transportSoldier");
		for "_x" from 1 to _cargospace do {
		if (_x > _guards) exitWith {};
		_unit = _grp createUnit [_guardclasses call ws_fnc_selectRandom, getPos _veh, [], 2, "NONE"];
		_unit assignAsCargo _veh; _unit moveInCargo _veh;
		};
			if (_guards > _cargospace) then {
				_grp = createGroup _side;

				for "_x" from 1 to (_guards - _cargospace) do {
				_unit = _grp createUnit [_guardclasses call ws_fnc_selectRandom, getPos _veh, [], 2, "NONE"];
				};
			};
	};
};

// Set the extra options for the vehicle
for "_x" from 0 to (count _modarray - 1) do {
switch (_modarray select _x) do {
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
	default {["ws_fnc_createVehicle: ",_modarray select _x," is not a valid input for the _modarray!"] call ws_fnc_debugText;}
	};
};

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
[_veh,_vehgrp,_this]