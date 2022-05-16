// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This function adds local event handlers to the player which grant radio channels when picking up a backpack or entering a vehicle. It also makes an initial check to see what they've got to begin with.
It's activated by f\radio\f_radioChannels.sqf.
=========================== */

// Wait for player to be properly initialised
waitUntil {(!isNull player && {player == player}) && !(isNil "f_var_radioChannelsUnified")};

// Add player to the correct channels if they have a backpack
[player] call f_fnc_radioCheckChannels;

// Now bail if they've already been handled
if (player getVariable ["f_var_radioHandlersAdded",false]) exitWith {};

// Update channels if they drop a backpack
player addEventHandler ["put", { 
	params ["_unit", "_container", "_item"];
	[_unit] call f_fnc_radioCheckChannels;
	[_unit] spawn {
		sleep 1;
		[_this select 0] call f_fnc_radioCheckChannels;
	};
}]; 

// Update channels if they take a backpack 
player addEventHandler ["take", {  
	params ["_unit", "_container", "_item"];
	[_unit] call f_fnc_radioCheckChannels;  
	[_unit] spawn {
		sleep 1;
		[_this select 0] call f_fnc_radioCheckChannels;
	};
}];

// Update channels if they open their inventory
player addEventHandler ["inventoryOpened", {  
	params ["_unit", "_container"];
	[_unit] call f_fnc_radioCheckChannels; 
	[_unit] spawn {
		sleep 1;
		[_this select 0] call f_fnc_radioCheckChannels;
	};
}];

// Update channels if they close their inventory
player addEventHandler ["inventoryClosed", {  
	params ["_unit", "_container"];
	[_unit] call f_fnc_radioCheckChannels;
	[_unit] spawn {
		sleep 1;
		[_this select 0] call f_fnc_radioCheckChannels;
	};
}];

// Update channels if they get in a vehicle
player addEventHandler ["getInMan", {  
	params ["_unit", "_role", "_vehicle", "_turret"];
	[_unit] call f_fnc_radioCheckChannels; 
	[_unit] spawn {
		sleep 1;
		[_this select 0] call f_fnc_radioCheckChannels;
	};
}];

// Update channels if they get out of a vehicle
player addEventHandler ["getOutMan", {  
	params ["_unit", "_role", "_vehicle", "_turret"];
	[_unit] call f_fnc_radioCheckChannels; 
	[_unit] spawn {
		sleep 1;
		[_this select 0] call f_fnc_radioCheckChannels;
	};
}];

// Update channels if they switch seats in a vehicle
player addEventHandler ["seatSwitchedMan", {  
	params ["_unit1", "_unit2", "_vehicle"];
	[_unit1] call f_fnc_radioCheckChannels; 
	[_unit1] spawn {
		sleep 1;
		[_this select 0] call f_fnc_radioCheckChannels;
	};
}];

// Just to be sure...
2 enableChannel false;

// Set a variable on the player to prove they've got handlers
player setVariable ["f_var_radioHandlersAdded",true];

// DEBUG
if (f_param_debugMode == 1) then
{
	systemChat "DEBUG (fn_radioAddHandlers.sqf): added radio event handlers %1";
};

sleep 1;
[player] call f_fnc_radioCheckChannels;