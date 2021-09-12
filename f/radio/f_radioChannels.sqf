// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This module is activated in init.sqf.
Example:
[true] execVM "f\radio\f_radioChannels.sqf";

Arguments:
0. Long-range split mode (boolean). If true, each radio backpack type has a separate channel. If false, all backpacks use one channel. Default false.
=========================== */

params [["_splitMode",false]];

// Disable the Command channel to avoid cheating
2 enableChannel false;

// Define a list of radio backpacks to recognise
f_var_longRangeRadioList = [  
	"B_RadioBag_01_black_F",  
	"B_RadioBag_01_digi_F",  
	"B_RadioBag_01_eaf_F",  
	"B_RadioBag_01_ghex_F",  
	"B_RadioBag_01_hex_F",  
	"B_RadioBag_01_tropic_F",  
	"B_RadioBag_01_oucamo_F",  
	"B_RadioBag_01_mtp_F",  
	"B_RadioBag_01_wdl_F"
];

// There is a maximum of 10 channels at any time. Swap in these radios for GM and CSLA missions:
/*
	"US85_bpPRC77",
	"CSLA_bpWpR129",
	"CSLA_bpWpRF10",
	"gm_gc_backpack_r105m_brn",
	"gm_ge_backpack_sem35_oli"
*/

// Determine whether we are splitting by backpack type or using one channel for all
if (_splitMode) then {

	// On the server, set up all channels for later use
	if (isServer) then {
	
		f_var_radioChannelList = [];
		for[{_i=0}, {_i < (count f_var_longRangeRadioList)}, {_i = _i+1}] do {
			_ChannelName = format ["LR CH%1", (_i + 1)];
			_ChannelID = (radioChannelCreate [[0.96, 0.34, 0.13, 0.8], _ChannelName, "%UNIT_NAME", []]);
			if (_ChannelID == 0) exitWith {diag_log format ["channel creation failed", _x]};
			f_var_radioChannelList append [_ChannelID];
		};
		publicVariable "f_var_radioChannelList";
		
		// Add a loop that checks for players without handlers every 30 seconds
		f_script_radioChannelUpdate = [_splitMode] spawn {
			params ["_splitMode"];
			while {true} do {
				sleep 30;
				[_splitMode] call f_fnc_radioUpdateLoop;
			};
		};
	};  
	
	// Run clientside stuff
	if (hasInterface) then {
		[_splitMode] call f_fnc_radioAddHandlers;
	};

} else {

	// If using unified mode, only set up one channel
	if (isServer) then {
		  
		f_var_channelID = (radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "Long Range", "%UNIT_NAME", []]);
		if (f_var_channelID == 0) exitWith {diag_log format ["Custom channel '%1' creation failed!", _channelName]};   
		publicVariable "f_var_channelID";
		
		// Add a loop that checks for players without handlers every 30 seconds
		f_script_radioChannelUpdate = [_splitMode] spawn {
			params ["_splitMode"];
			while {true} do {
				sleep 30;
				[_splitMode] call f_fnc_radioUpdateLoop;
			};
		};
	};  

	// Run clientside stuff
	if (hasInterface) then {
		[_splitMode] call f_fnc_radioAddHandlers;
	};

};

