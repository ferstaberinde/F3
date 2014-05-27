// F3 - Configure TFR Spectator Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private["_unit"];

_unit = player;

// ====================================================================================

// SET SPECTATOR MODE
// If the player is alive and hence not a JIP player, the spectator voice chat will be
// disabled. If the player is dead, and hence a JIP player that hasn't selected an
// active slot, spectator chat will be enabled. Needs some testing for JIPs.

if(alive _unit) then {

	// Disable spectator chat
	// NB: There is no way to check if a player is a spectator in TFR.
	// It probably doesn't hurt to set a player to spectator mode if they're already
	// one, but might need a better way if it throws up an error.

	[_unit, false] call TFAR_fnc_forceSpectator;

} else {

  // Enable spectator chat
  // NB: Same story as before.

  [_unit, true] call TFAR_fnc_forceSpectator;

};

// ====================================================================================