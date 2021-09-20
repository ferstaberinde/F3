// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This function adds local event handlers to the player which grant radio channels when picking up a backpack or entering a vehicle. It also makes an initial check to see what they've got to begin with.
It's activated by f\radio\f_radioChannels.sqf.
=========================== */
waitUntil {!(isNil "f_var_radioChannelsUnified")};

_splitMode = f_var_radioSplitMode;

// Add player to the correct channels if they have a backpack
[] call f_fnc_radioCheckChannels;

// Now bail if they've already been handled
if (player getVariable ["f_var_radioHandlersAdded",false]) exitWith {};

// Update channels if they drop a backpack
player addEventHandler ["put", { 
	[] call f_fnc_radioCheckChannels;
}]; 

// Update channels if they take a backpack 
player addEventHandler ["take", {  
	[] call f_fnc_radioCheckChannels;  
}];

// Update channels if they get in a vehicle
player addEventHandler ["getInMan", {  
	[] call f_fnc_radioCheckChannels;  
}];

// Update channels if they get out of a vehicle
player addEventHandler ["getOutMan", {  
	[] call f_fnc_radioCheckChannels;  
}];

// Update channels if they switch seats in a vehicle
player addEventHandler ["seatSwitchedMan", {  
	[] call f_fnc_radioCheckChannels;  
}];

// Just to be sure...
2 enableChannel false;

// Set a variable on the player to prove they've got handlers
player setVariable ["f_var_radioHandlersAdded",true,true];