// GeneralCarver Second Primary Weapon Action Manager
// Author: GeneralCarver, Sparks
// Version: 3
// Date: 10/8/15
// Description: This script manages add adding and removing the switch weapon action for a player.

// ============================================================================
// Define Variables

private ["_switch_weapon_act_id","_player"];
_switch_weapon_act_id = 9999;
_player = _this;

// ============================================================================
// Begin Script

while {local _player} do 
	{
	// check to add action to switch
	// check if _player is alive.
	if (alive _player) then 
		{
		// _player is alive..
		// check if action is already added...
		if (_switch_weapon_act_id == 9999) then 
			{
			// action is not added, add it.
			_switch_weapon_act_id = _player addaction ["Switch Weapon", "f\gc_sec_pri_wpn\switch_weapon.sqf", _player, 0, false, true, "", "true"];
			};
		};
	// check conditions to remove action and reset spare rifle..
	// check if _player is not alive..
	if (alive _player) then 
		{
		// nothing, _player is alive.
		} else 
		{
		// _player is dead. remove action.
		_player removeaction _switch_weapon_act_id;
		_switch_weapon_act_id = 9999;
		};
	sleep 1;
	};

// ============================================================================
// Change Log

/*
v1 - 10/18/10 - Released.
v2 - 12/3/10 - Removed script feature which checked if a revive script was active in a mission.
v3 - 10/8/15 - Ported to Arma 3, tweaked to per-soldier from per-faction
*/
