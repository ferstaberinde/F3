//ws_fnc_debugtext
//dump variables into sidechat and rpt
//["String",[array of variables],"String"] call ws_fnc_debugtext

params [
	["_string1", ""],
	["_variables", ""],
	["_string2", ""]
];

private _text = _string1 + format [" %1 ",_variables] + _string2 + format [" - Time: %1 ms",diag_tickTime];

systemchat _text;
diag_log _text;
