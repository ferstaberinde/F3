// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This function adds local event handlers to the player which grant radio channels when picking up a backpack or entering a vehicle. It also makes an initial check to see what they've got to begin with.
It's activated by f\radio\fn_radioChannels.sqf.
=========================== */

// Wait for player to be properly initialised
waitUntil {(!isNull player && {player == player}) && !(isNil "f_var_radioChannelsUnified")};

// Add player to the correct channels if they have a backpack
[player] spawn f_fnc_radioCheckChannels;

// Now bail if they've already been handled
if (player getVariable ["f_var_radioHandlersAdded",false]) exitWith {};

// Update channels if they drop a backpack
player addEventHandler ["put", { 
	params ["_unit", "_container", "_item"];
	[_unit] spawn f_fnc_radioCheckChannels;
}]; 

// Update channels if they take a backpack 
player addEventHandler ["take", {  
	params ["_unit", "_container", "_item"];
	[_unit] spawn f_fnc_radioCheckChannels;  
}];

// Update channels if they open their inventory
player addEventHandler ["inventoryOpened", {  
	params ["_unit", "_container"];
	[_unit] spawn f_fnc_radioCheckChannels; 
}];

// Update channels if they close their inventory
player addEventHandler ["inventoryClosed", {  
	params ["_unit", "_container"];
	[_unit] spawn f_fnc_radioCheckChannels;
}];

// Update channels if they get in a vehicle
player addEventHandler ["getInMan", {  
	params ["_unit", "_role", "_vehicle", "_turret"];
	[_unit] spawn f_fnc_radioCheckChannels; 
}];

// Update channels if they get out of a vehicle
player addEventHandler ["getOutMan", {  
	params ["_unit", "_role", "_vehicle", "_turret"];
	[_unit] spawn f_fnc_radioCheckChannels; 
}];

// Update channels if they switch seats in a vehicle
player addEventHandler ["seatSwitchedMan", {  
	params ["_unit1", "_unit2", "_vehicle"];
	[_unit1] spawn f_fnc_radioCheckChannels; 
}];

// Players can manually toggle the radio of the vehicle they're in (for themselves only). This is persistent and per-vehicle. The unit's own channels (from items and variables) aren't affected.
player addAction [
	"Turn off vehicle radio",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _radioOn = (vehicle _caller) getVariable ["f_var_radioIsOn",true];
		(vehicle _caller) setVariable ["f_var_radioIsOn",!_radioOn];
		[_caller] spawn f_fnc_radioCheckChannels;
	},
	nil,
	0,
	false,
	true,
	"",
	"vehicle _this != _this && {vehicle _this getVariable ['f_var_radioIsOn',true]}"
];

player addAction [
	"Turn on vehicle radio",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _radioOn = (vehicle _caller) getVariable ["f_var_radioIsOn",true];
		(vehicle _caller) setVariable ["f_var_radioIsOn",!_radioOn];
		[_caller] spawn f_fnc_radioCheckChannels;
	},
	nil,
	0,
	false,
	true,
	"",
	"vehicle _this != _this && {!(vehicle _this getVariable ['f_var_radioIsOn',true])}"
];

// Just to be sure...
2 enableChannel false;
// Force enable direct chat, mostly in case they're a reslot - F3 Spectator turns off direct chat
if (typeOf player != "VirtualSpectator_F") then {
	5 enableChannel true;
};

// Set a variable on the player to prove they've got handlers
player setVariable ["f_var_radioHandlersAdded",true];

// DEBUG
if (f_param_debugMode == 1) then
{
	systemChat "DEBUG (fn_radioAddHandlers.sqf): added radio event handlers %1";
};

sleep 1;
[player] spawn f_fnc_radioCheckChannels;