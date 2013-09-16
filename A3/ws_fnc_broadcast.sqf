// ws_fnc_broadcast
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
/*
FEATURE
Broadcast a string to all clients using titleText

USAGE
["message"] call ws_fnc_broadcast
["message","displaytype"] call ws_fnc_broadcast | See https://community.bistudio.com/wiki/titleText for valid types

NOTE
ARMA 3 only
*/

if !(ws_game_a3) exitWith {["ws_fnc_broadcast DBG: Game version: ",[_game]," Must be ARMA 3!"] call ws_fnc_debugtext};

_string = [_this,0,"ws_fnc_broadcast DBG: No string parsed",["STRING"]] call BIS_fnc_Param;
_display = [_this,1,"PLAIN",["STRING"]] call BIS_fnc_Param;

[[format ["%1",_string],_display],"BIS_fnc_titleText",true] spawn BIS_fnc_MP;