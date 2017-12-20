// FA3 - Wounding System
// Uses the standard Arma 3 revive system with a few modifications:
// - Restores vanilla behaviour of FAKs and medkits
// - Reviving no only heals a player as much as a FAK
// - Replace the "Force Respawn" hold action while downed with a "Wait to be revived" "infinite" hold-action (keeps icon animation)
// - Players can be downed in vehicles, will bleed out in them, and can be pulled out
// - Downed players can be dragged

// ====================================================================================

// Allow access to the standard Arma 3 revive system macros
#include "\a3\functions_f_mp_mark\Revive\defines.inc"

if (!hasInterface) exitWith {};

// Remove the HandleHeal event handler to restore vanilla behaviour of FAKs and medkits
[] spawn {
	// Wait until the event handler has been set
	waitUntil {sleep 1; (player getVariable ["bis_revive_ehHandleHeal", -1]) != -1};
	
	// Remove the event handler and unset the variable
	player removeEventHandler ["HandleHeal", player getVariable "bis_revive_ehHandleHeal"];
	player setVariable ["bis_revive_ehHandleHeal", nil];
};

// Make revives only heal the player to the level of a AFK
// More accurately, damage the player a little once they are revived
[] spawn {
	while {true} do {
		// Wait until the player is downed and being revived
		waitUntil {sleep 1;IS_DISABLED(player) && {IS_BEING_REVIVED(player)}};
		
		// Wait until the player has been revived
		// This is a busy wait to ensure the reset is being done as soon as the reset as possible
		waitUntil {IS_ACTIVE(player)};
		
		// Put damage down to FAK levels
		player setDamage 0.25;
	};
};

// Remove the "Force Respawn" hold-action and replace with "Wait to be revived"
[] spawn {
	while {true} do {
		// Wait until the player is downed and being revived
		waitUntil {sleep 1; IS_DISABLED(player)};
		
		// Wait until the "Force Respawn" hold-action has been defined
		// This is a busy wait to ensure the action is removed as soon as possible
		waitUntil {(player getVariable [VAR_ACTION_ID_RESPAWN,-1]) != -1};
		
		// Remove the hold-action
		[player, (player getVariable [VAR_ACTION_ID_RESPAWN,-1])] call bis_fnc_holdActionRemove;
		
		// Reset 'forcing respawn' flags incase the player started the action before it was removed
        if (IS_FORCING_RESPAWN(player)) then {
			SET_FORCING_RESPAWN(player, false);
		};
		
		// Add "Wait to be revived" hold-action
		[player,
		"Wait to be revived",
		bis_fnc_reviveGetActionIcon,
		bis_fnc_reviveGetActionIcon,
		"lifeState player == 'INCAPACITATED'",
		"lifeState player == 'INCAPACITATED'",
		{},
		{},
		{},
		{},
		[],
		999999, // basically infinite
		1000,
		true,
		true] call BIS_fnc_holdActionAdd;
		
		// Wait until the player's state changes to avoid adding the hold-action multiple times
		private _prevState = GET_STATE(player);
		waitUntil{sleep 1; GET_STATE(player) != _prevState};
	};
};

// Replace the damage handler to change vehicle behaviour
[] spawn {
	// Wait until the event handler has been set
	waitUntil {sleep 1; (player getVariable ["bis_revive_ehDammaged", -1]) != -1};
	
	// Remove the event handler and unset the variable
	player removeEventHandler ["Dammaged", player getVariable "bis_revive_ehDammaged"];
	player setVariable ["bis_revive_ehHandleDamage", player addEventHandler ["Dammaged", f_fnc_reviveEhDammaged]];
};

// Make downed players draggable
[player] remoteExec ["f_fnc_addDragAction", 0, player];