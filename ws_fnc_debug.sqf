//ws_fnc_debug
//debug functions
//
//ws_fnc_typecheck
//[variable to check,[array of expected types],descriptive string] call ws_fnc_typecheck;
//returns true when type is wrong or variable is nil
//
//ws_fnc_debugtext
//dump variables into sidechat and rpt
//["String",[array of variables],"String"] call ws_fnc_debugtext
//
//ws_fnc_clipboardcode
//run code from clipboard
//call ws_fnc_clipboardcode
//
//Radio trigger INDIA: run code from clipboard
//Radio trigger JULIET: recompiles ws_fnc

ws_fnc_typecheck = {
private ["_variable","_check_array","_scriptname","_typenames","_false_types","_error"];
	
	_variable = nil;
	_variable = _this select 0;
	_check_array = _this select 1;
	_scriptname = _this select 2;
	_typenames = ["ARRAY","BOOL","CODE","CONFIG","CONTROL","DISPLAY","GROUP","LOCATION","OBJECT","SCALAR","SCRIPT","SIDE","STRING","TEXT"]; //All possible typenames. http://community.bistudio.com/wiki/typeName
	_false_types = _typenames - _check_array;
	_error = false;
	
	if (isNil {_variable}) then {
	player sidechat format ["ws_fnc_typecheck: ERROR. _variable %1 parsed by %2 is NIL when it should be in %3 !",_variable,_scriptname,_check_array];
	diag_log format ["ws_fnc_typecheck: ERROR. _variable %1 parsed by %2 is NIL when it should be in %3 !",_variable,_scriptname,_check_array];
	_error = true;
	};
	
	{
	if (typename _variable == toUpper _x) then {
	player sidechat format ["ws_fnc_typecheck: ERROR. _variable %1 parsed by %2 is %3 when it should be of %4 !",_variable,_scriptname,format ["%1",_x],_check_array];
	diag_log format ["ws_fnc_typecheck: ERROR. _variable %1 parsed by %2 is %3 when it should be of %4 !",_variable,_scriptname,format ["%1",_x],_check_array];
	_error = true;
	};
	} forEach _false_types;
	
	_error
};

ws_fnc_debugtext = {
private ["_debug","_string1","_variables","_string2"];

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};
if !(_debug) exitWith {};

_string1= _this select 0;
_variables = _this select 1;
_string2 = _this select 2;
_text = _string1 + format ["%1",_variables] + _string2;

player groupchat _text;
diag_log _text;
};

ws_fnc_clipboardcode = {
private ["_code","_error"];

_code = copyFromClipboard;
_error = [_code,["STRING","CODE"],"ws_fnc_clipboardcode"] call ws_fnc_typecheck;
if (_error) exitWith {["ws_fnc_clipboardcode DBG: ",_code," invalid. exiting."] call ws_fnc_debugtext};
["ws_fnc_clipboardcode DBG: ",_code," executing."] call ws_fnc_debugtext;
[] spawn (compile _code);
};

ws_fnc_copyPos= {
_pos = [(getposASL player) select 0,(getposASL player) select 1,(getposATL player) select 2];
copyToClipboard format ["%1",_pos];
["ws_fnc_copyPos: ",_pos," copied!"] call ws_fnc_debugtext;
};

ws_fnc_countUnits = {
_uw = 0; _ue =0; _ur=0; _up =0;
{
if (side _x == west && alive _x && !isPlayer _x) then {_uw = _uw + 1};
if (side _x == east && alive _x && !isPlayer _x) then {_ue = _ue + 1};
if (side _x == resistance && alive _x && !isPlayer _x) then {_ur = _ur + 1};
if (isPlayer _x) then {_up = _up + 1};
} forEach allUnits;

player groupchat format ["Players: %1, Playable Units: %2, AI: BLU/%3, OPF/%4, RES/%5",_up,count playableUnits,_uw,_ue,_ur];
diag_log format ["Players: %1, Playable Units: %2, AI: BLU/%3, OPF/%4, RES/%5",_up,count playableUnits,_uw,_ue,_ur];

};

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};
if !(_debug) exitWith {};
if !(isNil "ws_dbg_trg") exitWith {};
onMapSingleClick "player setPos _pos";

//Radio triggers to assist with debugging
ws_dbg_trg=createTrigger["EmptyDetector",[0,0,0]];
ws_dbg_trg setTriggerArea[0,0,0,false];
ws_dbg_trg setTriggerActivation["GOLF","PRESENT",true];
ws_dbg_trg setTriggerStatements["this", "call ws_fnc_countUnits", ""]; 
ws_dbg_trg setTriggerText "Count units";

ws_dbg_trg=createTrigger["EmptyDetector",[0,0,0]];
ws_dbg_trg setTriggerArea[0,0,0,false];
ws_dbg_trg setTriggerActivation["HOTEL","PRESENT",true];
ws_dbg_trg setTriggerStatements["this", "call ws_fnc_copyPos", ""]; 
ws_dbg_trg setTriggerText "Copy player position";

ws_dbg_trg=createTrigger["EmptyDetector",[0,0,0]];
ws_dbg_trg setTriggerArea[0,0,0,false];
ws_dbg_trg setTriggerActivation["INDIA","PRESENT",true];
ws_dbg_trg setTriggerStatements["this", "call ws_fnc_clipboardcode", ""]; 
ws_dbg_trg setTriggerText "execute code from clipboard";

ws_dbg_trg2=createTrigger["EmptyDetector",[0,0,0]];
ws_dbg_trg2 setTriggerArea[0,0,0,false];
ws_dbg_trg2 setTriggerActivation["JULIET","PRESENT",true];
ws_dbg_trg2 setTriggerStatements["this", "nul = [] execVM ""ws_fnc\ws_fnc_init.sqf"";", ""];
ws_dbg_trg2 setTriggerText "recompile ws_fnc";
