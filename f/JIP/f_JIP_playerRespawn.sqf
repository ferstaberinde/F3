// F3 - Respawn INIT
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_corpse"];

// ====================================================================================

// SETUP KEY VARIABLES
// The Respawn eventhandler passes two parameters: the unit a player has respawned in and the corpse of the old unit.

_unit = _this select 0;
_corpse = _this select 1;

// ====================================================================================

// CHECK FOR GLOBAL VARIABLES
// Check if the global variables have been initialized, if not, do so.

if (isNil "f_var_JIP_FirstMenu") then {f_var_JIP_FirstMenu = false};
if (isNil "f_var_JIP_GearMenu") then {f_var_JIP_GearMenu = true};
if (isNil "f_var_JIP_RemoveCorpse") then {f_var_JIP_RemoveCorpse = true};

// ===================================================================================

// CHECK FOR FIRST TIME SPAWN
// If no corpse exists the player is spawned for the first time and does not need a JIP menu

if (f_var_JIP_FirstMenu && isNull _corpse) exitWith {};

// ====================================================================================

// CHECK FOR GEAR
// If gear selection is disabled and the unit has already beeb assigned a loadout via f_fnc_assignGear, it is used instead

if (!f_var_JIP_GearMenu) then {
	if (!isNil (_unit getVariable "f_var_assignGear")) then {
		player setVariable ["f_var_JIP_loadout",(_unit getVariable "f_var_assignGear")];
	};
};

// ====================================================================================

// ADD JIP MENU TO PLAYER
// Check if player already has the JIP Menu. If not, add it.

if (isNil "F3_JIP_reinforcementOptionsAction") then {
	[player] execVM "f\JIP\f_JIP_addReinforcementOptionsAction.sqf";
};

// ====================================================================================

// REMOVE CORPSE
// If activated, the old corpse will be sink into the ground and then removed from the game

if (f_var_JIP_RemoveCorpse && !isNull _corpse) then {
	_corpse spawn {
		hideBody _this;
		sleep 5;
		deleteVehicle _this;
	};
};
