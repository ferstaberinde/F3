// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This function adds local event handlers to the player which grant radio channels when picking up a backpack.
It's activated by f\radio\f_radioChannels.sqf.
=========================== */

params ["_splitMode"];

if (_splitMode) then {

	// Clients wait for the server to finish with setup
	waitUntil {!(isNil "f_var_radioChannelList")};

	// Add player to the correct channels if they have a backpack
	for[{_i=0}, {_i < (count f_var_longRangeRadioList)}, {_i = _i+1}] do {
		if (backpack player == (f_var_longRangeRadioList select _i)) then {
			(f_var_radioChannelList select _i) radioChannelAdd [player];
			((f_var_radioChannelList select _i) + 5) enableChannel true;
		};
	};

	// Remove player from channels if they drop a backpack
	player addEventHandler ["put", { 
		params ["_unit"];
		for[{_i=0}, {_i < (count f_var_longRangeRadioList)}, {_i = _i+1}] do {
			if (backpack _unit == (f_var_longRangeRadioList select _i)) then {
				(f_var_radioChannelList select _i) radioChannelAdd [_unit];
				((f_var_radioChannelList select _i) + 5) enableChannel true;
			} else {
				(f_var_radioChannelList select _i) radioChannelRemove [_unit];
			};
		};
	}]; 
	
	// Add player to channels if they take a backpack 
	player addEventHandler ["take", {  
		params ["_unit"];  
		for[{_i=0}, {_i < (count f_var_longRangeRadioList)}, {_i = _i+1}] do {
			if (backpack _unit == (f_var_longRangeRadioList select _i)) then {
				(f_var_radioChannelList select _i) radioChannelAdd [_unit];
				((f_var_radioChannelList select _i) + 5) enableChannel true;
			} else {
				(f_var_radioChannelList select _i) radioChannelRemove [_unit];
			};
		};   
	}];

} else {

	// If using unified mode, only set up one channel
	waitUntil {!(isNil "f_var_channelID")};

	if((backpack player) in f_var_longRangeRadioList) then {
		f_var_channelID radioChannelAdd [player];
		(f_var_channelID + 5) enableChannel true;
	};

	player addEventHandler ["put", { 
		params ["_unit"];    
		if(!((backpack player) in f_var_longRangeRadioList)) then { 
			f_var_channelID radioChannelRemove [_unit];
		} else {
			f_var_channelID radioChannelAdd [_unit];
			(f_var_channelID + 5) enableChannel true;
		}; 
	}]; 
	 
	player addEventHandler ["take", {  
		params ["_unit"];  
		if(!((backpack player) in f_var_longRangeRadioList)) then {  
			f_var_channelID radioChannelRemove [_unit];
		} else {
			f_var_channelID radioChannelAdd [_unit];
			(f_var_channelID + 5) enableChannel true;
		};   
	}];

};

// Just to be sure...
2 enableChannel false;

// Set a variable on the player to prove they've got handlers
player setVariable ["f_var_radioHandlersAdded",true,true];