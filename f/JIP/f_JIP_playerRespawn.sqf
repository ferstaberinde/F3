// F3 - Respawn INIT
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Only run this for players
if (isDedicated) exitWith{};

// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_corpse"];

// ====================================================================================

// SETUP KEY VARIABLES
// The Respawn eventhandler passes two parameters: the unit a player has respawned in and the corpse of the old unit.

_unit = _this select 0;
_corpse = _this select 1;

// Exit if the unit doesn't exist (can occur when JIPing into missions with no respawn)
if (isNil "_unit") exitWith {};

// ====================================================================================

// CHECK FOR GLOBAL VARIABLES
// Check if the global variables have been initialized, if not, do so with the default values.

if (isNil "f_var_JIP_FirstMenu") then {f_var_JIP_FirstMenu = false};
if (isNil "f_var_JIP_GearMenu") then {f_var_JIP_GearMenu = true};
if (isNil "f_var_JIP_RemoveCorpse") then {f_var_JIP_RemoveCorpse = false};

// ===================================================================================

// CHECK FOR FIRST TIME SPAWN
// If no corpse exists the player is spawned for the first time. By default, he won't get the JIP menu in that case.

if (!f_var_JIP_FirstMenu && isNull _corpse) exitWith {};

// ====================================================================================

// CHECK FOR GEAR
// If gear selection is disabled and the unit uses the loadout assigned by the F3 assign Gear component or it's default loadout.

if (!f_var_JIP_GearMenu) then {
	if (typeName (_unit getVariable "f_var_assignGear") == typeName "") then {
		_loadout = (_unit getVariable "f_var_assignGear");
		[_loadout,player] call f_fnc_assignGear;
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
// If activated and respawn is allowed, the old corpse will be sink into the ground and is then removed from the game

if (typeof _unit != "seagull" && {f_var_JIP_RemoveCorpse && !isNull _corpse}) then {
	_corpse spawn {
		hideBody _this;
		sleep 60;
		deleteVehicle _this;
	};
};
