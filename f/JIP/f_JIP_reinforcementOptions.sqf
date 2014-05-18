// F3 - JIP Reinforcement Options
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_textAction","_grp","_joinDistance","_loadout"];

// ====================================================================================

// ALLOW PLAYER TO SELECT GROUP
// Using a dialog we allow the player to select the group s/he is going to [re-]join.

f_var_JIP_state = 0;
createDialog "GrpPicker";
waitUntil {f_var_JIP_state == 1};
_grp = (player getVariable "f_var_JIP_grp");

// ====================================================================================

// ALLOW PLAYER TO SELECT LOADOUT
// Using a dialog we allow the player to select the loadout s/he requires.

f_var_JIP_state = 2;
if (f_var_JIP_GearMenu) then {
	createDialog "KitPicker";
	waitUntil {f_var_JIP_state == 3};
};

// ====================================================================================

// REMOVE REINFORCEMENT OPTIONS ACTION TO PLAYER ACTION MENU
// We remove the action to the player's action menu.
// NB This is on the assumption that the player has made positive selections and not
// cancelled the menu.

player removeAction F3_JIP_reinforcementOptionsAction;
F3_JIP_reinforcementOptionsAction = nil;

// ====================================================================================

// IMPLEMENT CHOICES
// Using the choices made by the player we implement the desired loadout and set the
// target group for her/him to join.
// If the player is already in the group, he simply remains there

_joinDistance = 10;
_loadout = (player getVariable "f_var_JIP_loadout");

if (_grp != group player) then {
	[player] joinSilent grpNull;
	[_grp,_joinDistance] execVM "f\JIP\f_JIP_nearTargetGroupCheck.sqf";
};

[_loadout,player] call f_fnc_assignGear;


