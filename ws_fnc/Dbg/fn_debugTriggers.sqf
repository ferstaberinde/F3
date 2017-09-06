//WS_fnc_debugTriggers
//Creates various triggers to be used ingame. Does not need to run twice

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};
if !(_debug) exitWith {};
if !(isNil "ws_dbg_trg") exitWith {};


player allowDammage false;
if (ws_game_a3) then {player addAction ["Start Camera","[] call bis_fnc_camera;",[],2,false,true,"","driver _target == _this"];} else {onMapSingleClick "player setPos _pos";};

//Radio triggers to assist with debugging

//Count units
ws_dbg_trg=createTrigger["EmptyDetector",[0,0,0]];
ws_dbg_trg setTriggerArea[0,0,0,false];
ws_dbg_trg setTriggerActivation["GOLF","PRESENT",true];
ws_dbg_trg setTriggerStatements["this", "call ws_fnc_countUnits", ""];
ws_dbg_trg setTriggerText "Count units";

//Copy player position
ws_dbg_trg=createTrigger["EmptyDetector",[0,0,0]];
ws_dbg_trg setTriggerArea[0,0,0,false];
ws_dbg_trg setTriggerActivation["HOTEL","PRESENT",true];
ws_dbg_trg setTriggerStatements["this", "call ws_fnc_copyPos", ""];
ws_dbg_trg setTriggerText "Copy player position";

//Clipboard code
ws_dbg_trg=createTrigger["EmptyDetector",[0,0,0]];
ws_dbg_trg setTriggerArea[0,0,0,false];
ws_dbg_trg setTriggerActivation["INDIA","PRESENT",true];
ws_dbg_trg setTriggerStatements["this", "call ws_fnc_clipboardcode", ""];
ws_dbg_trg setTriggerText "execute code from clipboard";

//Recompile
ws_dbg_trg=createTrigger["EmptyDetector",[0,0,0]];
ws_dbg_trg setTriggerArea[0,0,0,false];
ws_dbg_trg setTriggerActivation["JULIET","PRESENT",true];
if !(ws_game_a3) then {
ws_dbg_trg setTriggerStatements["this", "ws_fnc_compiled = false;ws_fnc_compiled = false;publicVariable ""ws_fnc_compiled"";nul = [] execVM ""ws_fnc\ws_fnc_init.sqf"";", ""];
} else {
ws_dbg_trg setTriggerStatements["this", "ws_fnc_compiled = false;publicVariable ""ws_fnc_compiled"";[] call BIS_fnc_Recompile;", ""];
};
ws_dbg_trg setTriggerText "recompile all ws_fnc";