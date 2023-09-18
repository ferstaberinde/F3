/*ws_fnc_setGVar
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Sets a global variable to the passed value. If the variable is nil it is initialized

USAGE
Minimal
["variable",value] call ws_fnc_setGVar

Full
["variable",value,bool,bool] call ws_fnc_setGVar

PARAMETERS
1. Variable to check									| MANDATORY - string
2. Value to set if variable is nil 						| MANDATORY - any value
3. Whether to pub-var the variable after it was set		| OPTIONAL - bool (default: false)
4. Whether to set the variable even if it is not nil	| OPTIONAL - bool (default: false)

RETURNS
nothing
*/

private ["_debug"];

params [
	["_var", "", [""]],
	["_val", 0],
	["_pub", false, [false]],
	["_force", false, [false]]
];

_debug = if !(isNil "ws_debug") then [{ws_debug},{false}];

if (!isNil _var && !_force) exitWith {
	if (_debug) then {
		["ws_fnc_setGVar: Passed var is not nil:",[_var,_val],""] call ws_fnc_debugText;
	};
};

call compile Format ["%1 = %2",_var,_val];

if (_pub) then {
	call compile format ["publicVariable '%1'",_var];
};
