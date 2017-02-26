//ws_fnc_typecheck
//[variable to check,[array of expected types],descriptive string] call ws_fnc_typecheck;
//returns true when type is wrong or variable is nil

private ["_variable","_check_array","_scriptname","_typenames","_false_types","_error"];

_variable = nil;
_variable = _this select 0;
_check_array = _this select 1;
_scriptname = _this select 2;
 //All possible typenames. http://community.bistudio.com/wiki/typeName
_typenames = ["ARRAY","BOOL","CODE","CONFIG","CONTROL","DISPLAY","GROUP","LOCATION","OBJECT","SCALAR","SCRIPT","SIDE","STRING","TEXT"];
_false_types = _typenames - _check_array;
_error = false;

if (isNil {_variable}) exitWith {
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