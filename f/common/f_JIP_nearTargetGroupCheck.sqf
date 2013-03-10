// F3 - JIP Near Target Group Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_grp","_joinDistance","_alive"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_grp = _this select 0;
_joinDistance = _this select 1;

// ====================================================================================

while {true} do
{

// ====================================================================================

// ESTABLISH TARGET GROUP SIZE
// We begin by establishing how many units remain alive in the group. We use this to
// establish a baseline value to compare against.

_alive = {alive _x} count (units _grp);
if (_alive == 0) exitWith {nul = [player] execVM "f\common\f_JIP_addReinforcementOptionsAction.sqf";};

// DEBUG
if (f_var_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\common\f_JIP_nearTargetGroupCheck.sqf): _alive = %1",_alive];
};

// ====================================================================================

// CHECK PROXIMITY
// We then check how many of the units are within the required proximity to the 
// objective; if all units qualify then we exit the script.

if (((leader _grp) distance player) < _joinDistance) exitWith {[player] joinSilent _grp;};

// ====================================================================================

sleep 3;
};

// ====================================================================================