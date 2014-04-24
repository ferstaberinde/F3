// F3 - JIP SETUP
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// ====================================================================================

// SERVER - SIDE COMPONENT
// We set the variables server-side and broadcast them to the players

if (isServer) then {
	f_respawnRemoveCorpse = true;	// If the player's corpse should be removed straightaway
	f_respawnGearMenu = true;		// If a respawned player should get a menu to select new gear. If set to false he get's the gear initially assigned to him by f_fnc_assignGear
	{publicVariable _x} forEach ["f_respawnRemoveCorpse","f_respawnGearMenu"];
};

// ====================================================================================

// PLAYER-SIDE COMPONENT
// The respawn eventhandler is added to the player.

if (!isDedicated) then {

	// MAKE SURE THE PLAYER INITIALIZES PROPERLY
	sleep 0.1;
	waitUntil {player == player};

	f_respawnINIT = player addMPEventHandler ["MPRespawn", {_this execVM "init_onPlayerRespawn.sqf"}];
};