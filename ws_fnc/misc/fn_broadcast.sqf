// ws_fnc_broadcast
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
/*
FEATURE
Broadcast a string to all clients

USAGE
["message"] call ws_fnc_broadcast
["message","type of text","display type"] call ws_fnc_broadcast | See https://community.bistudio.com/wiki/titleText for valid types

PARAMETERS
1. The string to be displayed | MANDATORY
2. The type of text (titleText or cutText) |OPTIONAL - default is cutText.
3. The display type | OPTIONAL - default is PLAIN. See http://community.bistudio.com/wiki/titleText for options

NOTE
ARMA 3 only
*/

private ["_game", "_code"];

_game = [] call ws_fnc_gameCheck;
if !(ws_game_a3) exitWith {["ws_fnc_broadcast DBG: Game version: ",[_game]," Must be ARMA 3!"] call ws_fnc_debugtext};

params [
	["_string", "ws_fnc_broadcast DBG: No string parsed", [""]],
	["_text", "cutText", [""]],
	["_type", "PLAIN", [""]]
];
_code = format ["%1 [%2,%3]",_text,str _string,str _type];

ws_fnc_showText = compile _code;

[] remoteExec ["ws_fnc_showText", 0];

_code = "";
ws_fnc_showText = compile _code;
