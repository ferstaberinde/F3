// F3 - Respawn INIT
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// CODE EXECUTED AFTER RESPAWN
// By default we activate the JIP Reinforcement Options component, which allows the
// player to choose a loadout and group to join.

_unit = _this select 0;
_corpse = _this select 1;

// CHECK FOR GEAR MENU
// If gear selection is disabled and the unit has already assigned a loadout via f_fnc_assignGear, we use that instead.

if (!f_respawnGearMenu && {!isNil (_unit getVariable "f_var_assignGear")}) then {
	player setVariable ["f_var_JIP_loadout",(_unit getVariable "f_var_assignGear")];
};

[player] execVM "f\JIP\f_JIP_addReinforcementOptionsAction.sqf";

if (f_respawnRemoveCorpse) then {
	hideBody _corpse;
	sleep 5;
	deleteVehicle _corpse;
};

// ====================================================================================
