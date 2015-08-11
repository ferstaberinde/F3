// GeneralCarver Second Primary Weapon Action Manager
// Author: GeneralCarver, Sparks
// Version: 3
// Date: 10/8/15
// Description: This script manages add adding and removing the switch weapon action for a player.

// ============================================================================
// Define Variables

private ["_primary_weapon", "_gc_initial_primary_weapon_in_hands","_gc_sec_pri_wpn_script_active","_gc_sec_pri_wpn_stored_weapon","_player"];
_player = _this select 3;
_gc_sec_pri_wpn_script_active = _player getVariable "gc_sec_pri_wpn_script_active";
_gc_sec_pri_wpn_stored_weapon = _player getVariable "gc_sec_pri_wpn_stored_weapon";
_primary_weapon = primaryweapon _player;

// ============================================================================
// Begin Script

// exit script if it is already running
if (_gc_sec_pri_wpn_script_active) exitWith 
	{
	// nothing, script is active.
	};

// script not running, set as running.
_player setVariable ["gc_sec_pri_wpn_script_active",true];

// check if player has primary weapon.
if (_primary_weapon == "") then 
	{
	// player does not have primary weapon.
	// Check if player has weapon on back...
	if (_gc_sec_pri_wpn_stored_weapon == "NONE") then 
		{
		// player does not have weapon on back.
		// do nothing. script ends.
		} else 
		{
		// player has weapon on back.
		titleText ["Retrieving weapon...", "PLAIN DOWN"];
		// add stored weapon to player.
		_player addweapon _gc_sec_pri_wpn_stored_weapon;
		_player setVariable ["gc_sec_pri_wpn_stored_weapon","NONE"];
		sleep 2;
		// clear message on screen.
		titleText ["  ", "PLAIN DOWN"];
		};
	} else  
	{
	// player has primary weapon.
	// remove primary weapon from player.
	_player removeweapon _primary_weapon;
	// check if player has a weapon in storage.
	if (_gc_sec_pri_wpn_stored_weapon == "NONE") then 
		{
		// player does not have weapon on back.
		titleText ["Slinging weapon onto back...", "PLAIN DOWN"];
		_player setVariable ["gc_sec_pri_wpn_stored_weapon",_primary_weapon];
		sleep 2;
		titleText ["  ", "PLAIN DOWN"];
		} else 
		{
		// player has weapon on back..
		// display message that weapons are being switched.
		titleText ["Switching primary weapons...", "PLAIN DOWN"];
		// remove primary weapon..
		_player removeweapon _primary_weapon;
		sleep 1;
		// Add weapon to player.
		_player addweapon _gc_sec_pri_wpn_stored_weapon;
		// set stored weapon to none.
		_player setVariable ["gc_sec_pri_wpn_stored_weapon",_primary_weapon];
		sleep 2;
		// clear message on screen.
		titleText ["  ", "PLAIN DOWN"];
		};
	};

sleep 1;

// note that script is not running.
_player setVariable ["gc_sec_pri_wpn_script_active",false];

// ============================================================================
// Change Log

/*

v1 - Released.
v2 - 12-3-10 - Added formatting to script. Removed condition which produced an error related to adding a null weapon. Added message to press F to cycle to weapon.
v3 - 10/8/15 - Ported to Arma 3, tweaked to per-soldier from per-faction
*/
