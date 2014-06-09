// F3 - Configure ACRE Spectator Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private["_unit"];

_unit = player;

// ====================================================================================

// SET SPECTATOR MODE
// If the player is alive and hence not a JIP player, the spectator voice chat will be 
// disabled. If the player is dead, and hence a JIP player that hasn't selected an
// active slot, spectator chat will be enabled.

if(alive _unit) then {

  // Disable spectator chat if player is set as a spectator
  if([true] call acre_api_fnc_isSpectator) then {
    _ret = [false] call acre_api_fnc_setSpectator;
  };

} else {

  // Enable spectator chat if player is not already a spectator
  if(!([true] call acre_api_fnc_isSpectator)) then {
    _ret = [true] call acre_api_fnc_setSpectator;
  };

};

// ====================================================================================
