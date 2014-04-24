// F3 - Respawn INIT
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// CODE EXECUTED AFTER RESPAWN
// By default we activate the JIP Reinforcement Options component, which allows the
// player to choose a loadout and group to join.

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_corpse"];

// ====================================================================================

// SETUP KEY VARIABLES
// The Respawn eventhandler passes two parameters: the unit a player has respawned in and the corpse of the old unit.

_unit = _this select 0;
_corpse = _this select 1;

// ====================================================================================

// SETUP F3 JIP MENU
// The following block sets up the F3 JIP group & gear menu and removes the corpse

// CHECK FOR GEAR MENU
// If gear selection is disabled and the unit has already assigned a loadout via f_fnc_assignGear, we use that instead.

if (!f_respawnGearMenu && {!isNil (_unit getVariable "f_var_assignGear")}) then {
	player setVariable ["f_var_JIP_loadout",(_unit getVariable "f_var_assignGear")];
};

// ====================================================================================

// ADD JIP MENU TO PLAYER

[player] execVM "f\JIP\f_JIP_addReinforcementOptionsAction.sqf";

// ====================================================================================

// REMOVE CORPSE
// If activated, the old corpse will be sink into the ground and then removed from the game

if (f_respawnRemoveCorpse) then {
	_corpse spawn {
		hideBody _this;
		sleep 5;
		deleteVehicle _this;
	};
};

// ====================================================================================
