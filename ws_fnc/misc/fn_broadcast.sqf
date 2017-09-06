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

if !(ws_game_a3) exitWith {["ws_fnc_broadcast DBG: Game version: ",[_game]," Must be ARMA 3!"] call ws_fnc_debugtext};

_string = [_this,0,"ws_fnc_broadcast DBG: No string parsed",["STRING"]]  call BIS_fnc_Param;
_text = [_this,1,"cutText",["STRING"]] call BIS_fnc_Param;
_type = [_this,2,"PLAIN",["STRING"]] call BIS_fnc_Param;
_code = format ["%1 [%2,%3]",_text,str _string,str _type];

ws_fnc_showText = compile _code;

[[],"ws_fnc_showText",true] spawn BIS_fnc_MP;

_code = "";
ws_fnc_showText = compile _code;
