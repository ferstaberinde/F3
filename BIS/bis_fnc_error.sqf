/*
	Author: Karel Moricky

	Description:
	Display error message

	Parameter(s):
	_this select 0: STRING - Formatted message
	_this select n (Optional): ANY - additional parameters

	Returns:
	STRING - displayed message
*/

private ["_this","_msg","_scriptName"];
if (typename _this != typename []) then {_this = [_this]};

if (typename (_this select 0) != typename "") then {
	_this = ["%1 %2 %3 % %5 %6 %7 %8 %9 %10"] + _this;
};

//--- Function name
_scriptName = if (isnil "_fnc_scriptName") then {""} else {_fnc_scriptName};
if (_scriptName != "") then {_scriptName = "[" + _scriptName + "] "};

_msg = +_this;

//--- On-screen output
if (
	//--- Editor
	((uinamespace getvariable ["gui_displays",[]]) find (finddisplay 26) == 1)
	||
	// Manual toggle
	profilenamespace getvariable ["BIS_fnc_init_displayErrors",false]
) then {
	("BIS_fnc_error" call (uinamespace getvariable "bis_fnc_rscLayer")) cutrsc ["RscFunctionError","plain"];
	((uinamespace getvariable ["RscFunctionError",displaynull]) displayctrl 1100) ctrlsetstructuredtext parsetext ("<t font='LucidaConsoleB' size='0.5'><t color='#ff9900'>" + _scriptName + "</t>" + format _msg + "</t>");
};

//--- DebugLog output
_msg set [0,profilename + "/log: " + (if (!isnil "_fnc_error_exit") then {"HALT: "} else {"ERROR: "}) + _scriptName + (_msg select 0)];

if (getnumber (missionconfigfile >> "allowFunctionsLog") > 0 || cheatsEnabled) then {
	diag_log format _msg
};

_this