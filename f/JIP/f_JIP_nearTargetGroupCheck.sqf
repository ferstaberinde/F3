// F3 - JIP Near Target Group Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_grp","_joinDistance"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_grp = _this select 0;
_joinDistance = _this select 1;

// ====================================================================================

if (isNull _grp) exitWith {
	[player] joinSilent grpNull;
};

while {true} do
{

// ====================================================================================

// ESTABLISH TARGET GROUP SIZE
// We begin by establishing how many units remain alive in the group. We use this to
// establish a baseline value to compare against.

if ({alive _x} count (units _grp) == 0) exitWith {
	[player] execVM "f\JIP\f_JIP_addReinforcementOptionsAction.sqf";
	["JIP",[format ["All members of %1 have died. Please select a new group",_grp]]] call BIS_fnc_showNotification;
};

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\JIP\f_JIP_nearTargetGroupCheck.sqf): _alive = %1",_alive];
};

// ====================================================================================

sleep 3;

// CHECK PROXIMITY
// We then check how many of the units are within the required proximity to the
// objective; if all units qualify then we exit the loop.

	if (((leader _grp) distance player) < _joinDistance) exitWith {
		[player] joinSilent _grp;

		["JIP",[format ["You have joined %1",_grp]]] call BIS_fnc_showNotification;

		_unit = player;
		[["JIP",[format ["%1 has joined your group.",name _unit]]],"BIS_fnc_showNotification",units (_this select 3) - [_unit]] spawn BIS_fnc_MP;

		sleep 1;
	};

};

