// ws_fnc_loadVehicle
// v1
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
//

private ["_veh","_grps","_units"];

_veh = _this select 0;
_grps = _this select 1;

[_veh,["OBJECT"],"ws_fnc_loadVehicle"] call ws_fnc_typecheck;
[_grps,["ARRAY"],"ws_fnc_loadVehicle"] call ws_fnc_typecheck;
[(_grps select 0),["GROUP"],"ws_fnc_loadVehicle"] call ws_fnc_typecheck;

_units = [];
{{_units = _units + [_x]}forEach _units _x;}forEach _grps;

if ((_veh emptyPositions "Driver") > 0) then {(_units select 0) assignAsDriver _veh; (_units select 0) moveInDriver _veh;_units = _units - [(_units select 0) ];};
if ((_veh emptyPositions "Gunner") > 0) then {(_units select 0) assignAsGunner _veh; (_units select 0) moveInGunner _veh;_units = _units - [(_units select 0) ];};
if ((_veh emptyPositions "Commander") > 0) then {(_units select 0) assignAsCommander _veh; (_units select 0) moveInCommander _veh;_units = _units - [(_units select 0) ];};

{_x moveInCargo _veh;_units = _units - [_x]} forEach _units;

if (count _units > 0) then {["ws_fnc_loadVehicle DBG: ",[_units]," Were not loaded! Vehicle full?"] call ws_fnc_debugtext};

true