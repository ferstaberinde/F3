// ws_fnc_loadGroups
// Latest: 10.10.2013
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
//
/*
FEATURE
loads units of specified group(s) into vehicle, filling all important positions before cargo is filled
units that are already in a vehicle are ignored

USAGE
[veh1,grp1] call ws_fnc_loadGroups
[veh1,grp1,grp2.....grpN] call ws_fnc_loadGroups

RETURNS
units that weren't loaded
*/

private ["_count","_veh","_grps","_units"];

_count = count _this;
_veh = _this select 0;
_grps = [_this select 1];

[_veh,["OBJECT"],"ws_fnc_loadVehicle"] call ws_fnc_typecheck;
[_grps,["ARRAY"],"ws_fnc_loadVehicle"] call ws_fnc_typecheck;
[(_grps select 0),["GROUP"],"ws_fnc_loadVehicle"] call ws_fnc_typecheck;

if (_count > 2) then {
	for "_x" from 2 to (_count) do {
		_grps = _grps + [_this select 2];
	};
};

_units = [];
{{if (vehicle _x == _x) then {_units = _units + [_x]} } forEach units _x} forEach _grps;

if ((_veh emptyPositions "Driver") > 0) then {(_units select 0) assignAsDriver _veh; (_units select 0) moveInDriver _veh;_units = _units - [(_units select 0) ];};
if ((_veh emptyPositions "Gunner") > 0) then {(_units select 0) assignAsGunner _veh; (_units select 0) moveInGunner _veh;_units = _units - [(_units select 0) ];};
if ((_veh emptyPositions "Commander") > 0) then {(_units select 0) assignAsCommander _veh; (_units select 0) moveInCommander _veh;_units = _units - [(_units select 0) ];};

while {_veh emptyPositions "CARGO" > 0 && count _units > 0} do {
	(_units select 0) moveInCargo _veh; (_units select 0) assignAsCargo _veh;_units = _units - [(_units select 0)];
};

if (count _units > 0) then {["ws_fnc_loadVehicle DBG: ",[_units]," were not loaded! Vehicle full?"] call ws_fnc_debugtext};

_units