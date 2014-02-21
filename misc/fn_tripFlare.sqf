/* ws_fnc_tripFlare

FEATURE
Creates illuminated smoke at position

USAGE
[position,color] spawn ws_fnc_tripFlare

*/

private ["_color","_chm","_smk","_duration"];

_pos = (_this select 0) call ws_fnc_getEpos;
_color = toLower(_this select 1);
_duration = if (count _this > 2) then {_this select 2} else {0};

if !(_color in ["green","red","yellow","blue"]) exitWith {["ws_fnc_tripFlare DBG: ",[_color]," is not one of: [""green"",red","yellow","blue""]"] call ws_fnc_debugtext};

_smk = (format ["Smokeshell%1",_color]) createVehicle _pos;
sleep 0.2;
_chm = (format ["Chemlight_%1",_color]) createVehicle _pos;

waitUntil {isNull _smk};

sleep 0.5;
deleteVehicle _smk;
deleteVehicle _chm;
true