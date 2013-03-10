// F3 - Respawn INIT
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// CODE EXECUTED AFTER RESPAWN
// By default we activate the JIP Reinforcement Options component, which allows the
// player to choose a loadout and group to join.

sleep 3;
nul = [player] execVM "f\common\f_JIP_addReinforcementOptionsAction.sqf";

// ====================================================================================
