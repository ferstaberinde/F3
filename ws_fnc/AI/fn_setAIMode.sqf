/*ws_fnc_setAIMode
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Set a group to desired behaviour and combatmode

RETURNS
group

USAGE
[group,behaviour,combatmode,formation,speed] call ws_fnc_setAIMode

PARAMETERS
1. Group to be set
2. Combat mode, Behaviour, speed and/or formation to be set (all strings, order does not matter)

EXAMPLES
[Group1,"LINE"] call ws_fnc_setAIMode;
[Group2,"COMBAT","ECH LEFT","RED"] call ws_fnc_setAIMode;

Accepted Strings:
"COLUMN" "STAG COLUMN" "WEDGE" "ECH LEFT" "ECH RIGHT" "VEE" "LINE" "FILE" "DIAMOND"

"CARELESS" "SAFE" "AWARE" "COMBAT" "STEALTH".

"BLUE"  "GREEN"  "WHITE"  "YELLOW" "RED"

"FULL" "NORMAL" "LIMITED"
*/

private ["_grp","_modes"];

_grp = _this select 0;
_modes = _this - [_this select 0];

//Debugging - _modearray shouldnt have over three entries
if (count _modes > 3) then {["ws_fnc_setAIMode DBG:",_modearray,"for some reason has over three entries. Why?"] call ws_fnc_debugText;};

{
switch (_x) do {

	//Behaviour
	case "CARELESS": {_grp setBehaviour _x;};
	case "SAFE": {_grp setBehaviour _x;};
	case "AWARE": {_grp setBehaviour _x;};
	case "COMBAT": {_grp setBehaviour _x;};
	case "STEALTH": {_grp setBehaviour _x;};

	//CombatMode
	case "BLUE": {_grp setCombatMode _x;};
	case "GREEN": {_grp setCombatMode _x;};
	case "WHITE": {_grp setCombatMode _x;};
	case "YELLOW": {_grp setCombatMode _x;};
	case "RED": {_grp setCombatMode _x;};

	//Formation
	case "COLUMN": {_grp setFormation _x;};
	case "STAG COLUMN": {_grp setFormation _x;};
	case "WEDGE": {_grp setFormation _x;};
	case "ECH LEFT": {_grp setFormation _x;};
	case "ECH RIGHT": {_grp setFormation _x;};
	case "VEE": {_grp setFormation _x;};
	case "LINE": {_grp setFormation _x;};
	case "FILE": {_grp setFormation _x;};
	case "DIAMOND": {_grp setFormation _x;};

	//Speed
	case "LIMITED": {_grp setSpeedMode _x;};
	case "NORMAL": {_grp setSpeedMode _x;};
	case "FULL": {_grp setSpeedMode _x;};

	default {["ws_fnc_setAIMode DBG:",_x,"is not a valid combatmode, behaviour or formation!"] call ws_fnc_debugText};
};

} forEach _modes;

_grp