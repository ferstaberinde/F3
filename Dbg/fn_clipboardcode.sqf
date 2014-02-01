//ws_fnc_clipboardcode
//run code from clipboard
//call ws_fnc_clipboardcode

private ["_code","_error"];

_code = copyFromClipboard;
_error = [_code,["STRING","CODE"],"ws_fnc_clipboardcode"] call ws_fnc_typecheck;
if (_error) exitWith {["ws_fnc_clipboardcode DBG: ",_code," invalid. exiting."] call ws_fnc_debugtext};
["ws_fnc_clipboardcode DBG: ",_code," executing."] call ws_fnc_debugtext;
[] spawn (compile _code);