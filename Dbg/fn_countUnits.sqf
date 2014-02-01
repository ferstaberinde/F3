private ["_uw","_ue","_ur","_up"];

_uw = {side _x == west && alive _x && !isPlayer _x} count allUnits;
_ue = {side _x == east && alive _x && !isPlayer _x} count allUnits;
_ur = {side _x == resistance && alive _x && !isPlayer _x} count allUnits;
_up = {isPlayer _x} count allUnits;

player globalchat format ["Players: %1, Playable Units: %2, AI: BLU/%3, OPF/%4, RES/%5",_up,count playableUnits,_uw,_ue,_ur];
diag_log format ["Players: %1, Playable Units: %2, AI: BLU/%3, OPF/%4, RES/%5",_up,count playableUnits,_uw,_ue,_ur];