private ["_uw","_ue","_ur","_up"];

_uw = 0; _ue =0; _ur=0; _up =0;
{
if (side _x == west && alive _x && !isPlayer _x) then {_uw = _uw + 1};
if (side _x == east && alive _x && !isPlayer _x) then {_ue = _ue + 1};
if (side _x == resistance && alive _x && !isPlayer _x) then {_ur = _ur + 1};
if (isPlayer _x) then {_up = _up + 1};
} forEach allUnits;

player groupchat format ["Players: %1, Playable Units: %2, AI: BLU/%3, OPF/%4, RES/%5",_up,count playableUnits,_uw,_ue,_ur];
diag_log format ["Players: %1, Playable Units: %2, AI: BLU/%3, OPF/%4, RES/%5",_up,count playableUnits,_uw,_ue,_ur];