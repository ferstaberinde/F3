// F2 - JIP Add Reinforcement Options Action
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_textAction"];

// ====================================================================================

// SET KEY VARIABLES

_unit = _this select 0;
_textAction = localize "STR_f_JIP_reinforcementOptionsAction";

// ====================================================================================

// ADD REINFORCEMENT OPTIONS ACTION TO PLAYER ACTION MENU
// We add the action to the player's action menu.

if (_unit == player) then {
	F2_JIP_reinforcementOptionsAction = player addaction [_textAction,"f\common\f_JIP_reinforcementOptions.sqf",[],6,false,false,"","_target == player"];
};