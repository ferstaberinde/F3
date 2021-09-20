// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This module is activated in init.sqf.
Example:
[true] execVM "f\radio\f_radioChannels.sqf";

Arguments:
0. Long-range split mode (boolean). If true, each radio backpack type has a separate channel. If false, all backpacks use one channel. Default false.

This module requires some missionmaker configuration. If you want to enable vehicle radio access, you need to specify vehicle classes or variable names below.
=========================== */

params [["_splitMode",false]];

// Disable the Command channel to avoid cheating
2 enableChannel false;

// There is a maximum of 10 channels at any time. Swap in these radios for GM and CSLA missions:
/*
	"US85_bpPRC77",
	"CSLA_bpWpR129",
	"CSLA_bpWpRF10",
	"gm_gc_backpack_r105m_brn",
	"gm_ge_backpack_sem35_oli"
*/

if (isServer) then {

	// Make the split mode something we can reference later
	f_var_radioSplitMode = _splitMode;
	publicVariable "f_var_radioSplitMode";

	// This will be used later
	f_var_radioChannelUnified = [];
	
	// Set up channels to use
	for "_i" from 1 to 10 do {
		_ChannelName = format ["LR CH%1", (_i + 1)];
		_ChannelID = (radioChannelCreate [[0.96, 0.34, 0.13, 0.8], _ChannelName, "%UNIT_NAME", []]);
		if (_ChannelID == 0) exitWith {diag_log format ["channel creation failed", _x]};
	};

	// Set up radio channel candidate lists (MISSIONMAKER INPUT REQUIRED)
	// BACKPACKS: Must be a classname of a backpack (STRING)
	// There is a maximum of 10 channels at any time. Swap in these radios for GM and CSLA missions:
		/*
			"US85_bpPRC77"
			"CSLA_bpWpR129"
			"CSLA_bpWpRF10"
			"gm_gc_backpack_r105m_brn"
			"gm_ge_backpack_sem35_oli"
		*/
	f_var_radioChannelsBackpacks = createHashmap;
	// Backpacks for channel 1
	f_var_radioChannelsBackpacks set [1, ["B_RadioBag_01_black_F"]];
	// Backpacks for channel 2
	f_var_radioChannelsBackpacks set [2, ["B_RadioBag_01_digi_F"]];
	// Backpacks for channel 3
	f_var_radioChannelsBackpacks set [3, ["B_RadioBag_01_eaf_F"]];
	// Backpacks for channel 4
	f_var_radioChannelsBackpacks set [4, ["B_RadioBag_01_ghex_F"]];
	// Backpacks for channel 5
	f_var_radioChannelsBackpacks set [5, ["B_RadioBag_01_hex_F"]];
	// Backpacks for channel 6
	f_var_radioChannelsBackpacks set [6, ["B_RadioBag_01_tropic_F"]];
	// Backpacks for channel 7
	f_var_radioChannelsBackpacks set [7, ["B_RadioBag_01_mtp_F"]];
	// Backpacks for channel 8
	f_var_radioChannelsBackpacks set [8, ["B_RadioBag_01_wdl_F"]];
	// Backpacks for channel 9
	f_var_radioChannelsBackpacks set [9, ["B_RadioBag_01_oucamo_F"]];
	// Backpacks for channel 10
	f_var_radioChannelsBackpacks set [10, []];

	// VEHICLES: Can be a variable name of a specific vehicle (VARIABLE), or a classname of a vehicle type (STRING)
	f_var_radioChannelsVehicles = createHashmap;
	// Vehicles for channel 1
	f_var_radioChannelsVehicles set [1, []];
	// Vehicles for channel 2
	f_var_radioChannelsVehicles set [2, []];
	// Vehicles for channel 3
	f_var_radioChannelsVehicles set [3, []];
	// Vehicles for channel 4
	f_var_radioChannelsVehicles set [4, []];
	// Vehicles for channel 5
	f_var_radioChannelsVehicles set [5, []];
	// Vehicles for channel 6
	f_var_radioChannelsVehicles set [6, []];
	// Vehicles for channel 7
	f_var_radioChannelsVehicles set [7, []];
	// Vehicles for channel 8
	f_var_radioChannelsVehicles set [8, []];
	// Vehicles for channel 9
	f_var_radioChannelsVehicles set [9, []];
	// Vehicles for channel 10
	f_var_radioChannelsVehicles set [10, []];
	
	// You can also tag a specific unit or vehicle for access to specific channels by setting a variable on them:
	// _unit setVariable ["f_var_radioChannelsObjectSpecific",[1,2,3],true];

	// Flatten all these arrays into one single list for potential later use
	{
		f_var_radioChannelsUnified append (flatten (values _x));
	} forEach [f_var_radioChannelsBackpacks,f_var_radioChannelsVehicles];

	// Broadcast variables for client use
	publicVariable "f_var_radioChannelsBackpacks";
	publicVariable "f_var_radioChannelsVehicles";
	publicVariable "f_var_radioChannelsUnified";
	
	// Add server EH for JIP
	addMissionEventHandler ["PlayerConnected",
	{
		params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
		if (_jip) then {
			[] remoteExec ["f_fnc_radioAddHandlers",_owner];
		};
	}];

};

// Run clientside stuff
if (hasInterface) then {
	[] call f_fnc_radioAddHandlers;
};

