//ws_fnc_debugtext
//dump variables into sidechat and rpt
//["String",[array of variables],"String"] call ws_fnc_debugtext

private ["_debug","_string1","_variables","_string2"];

_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};
if !(_debug) exitWith {};

_string1= _this select 0;
_variables = _this select 1;
_string2 = _this select 2;
_text = _string1 + format [" %1 ",_variables] + _string2 + format [" - Time: %1 ms",diag_tickTime];

systemchat _text;
diag_log _text;