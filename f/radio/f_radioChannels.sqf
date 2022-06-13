// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This module is activated in init.sqf.
Example:
[true] execVM "f\radio\f_radioChannels.sqf";

Arguments:
0. Long-range split mode (boolean). If true, each radio backpack type has a separate channel. If false, all backpacks use one channel. Default false.
1. Number of channels to create (number, optional). If this is set, the number of channels to be created will be limited to this number. If channels are not split, this will be automatically set to 1.

This module requires some missionmaker configuration. If you want to enable vehicle radio access, you need to specify vehicle classes or variable names below.
=========================== */

params [["_splitMode",false],["_channelCount",10]];

// Disable the Command channel to avoid cheating
2 enableChannel false;

if (isServer) then {

	// Make the split mode something we can reference later
	f_var_radioSplitMode = _splitMode;
	publicVariable "f_var_radioSplitMode";
	
	// Make the channel count something we can reference later
	f_var_radioChannelCount = _channelCount;
	publicVariable "f_var_radioChannelCount";

	// This will be used later
	f_var_radioChannelUnified = [];
	
	/* 
	Set up radio channel candidate lists (MISSIONMAKER INPUT REQUIRED)
	Each channel is defined here by a channel name, colour, and an array of items which can grant channel access.
	Channels will be created IN ORDER OF THIS LIST. Keep this in mind if limiting the number of possible channels. All radio access items listed here will be used if channels are not split.
	Do not remove channels from this list. If you need to free up custom channels, use the limiting parameter in init.sqf.
	
	NAME (STRING) is the title visible to players in the UI.
	COLOUR (ARRAY OF 4 NUMBERS) is the RGBA colour value of the channel as it appears in the UI.
	OBJECTS (ARRAY OF STRINGS):
	INVENTORY (classname) items, such as backpacks or equipment, give the player talk and receive access when carried. Only player inventory is checked, NOT vehicles.
	VEHICLES (classname or variable name) give the player receive access when they are inside, and talk access when they are the driver.
	The channel eligibility array is not case-sensitive.

	There is a maximum of 10 channels at any time. Add in these radios for GM and CSLA missions:
	
			"US85_bpPRC77"
			"CSLA_bpWpR129"
			"CSLA_bpWpRF10"
			"gm_gc_backpack_r105m_brn"
			"gm_ge_backpack_sem35_oli"
	*/
	
	f_var_radioChannels = createHashmap;
	f_var_radioChannels set [1, ["LR Channel 1",[1, 0.3, 0.1, 1], (["B_RadioBag_01_black_F"] apply {toLower _x})]];
	f_var_radioChannels set [2, ["LR Channel 2",[0.06,0.9,0,1], (["B_RadioBag_01_digi_F","vehAAF_COV","vehAAF_IFV1","vehAAF_IFV2","vehAAF_AV","vehAAF_BV","vehAAF_CV","vehAAF_TNK1","vehAAF_TH1","vehAAF_TH2","vehAAF_TH3","vehAAF_TH4","vehAAF_TH5","vehAAF_TH6","vehAAF_TH7","vehAAF_TH8","vehAAF_AH1","vehAAF_CAS1"] apply {toLower _x})]];
	f_var_radioChannels set [3, ["LR Channel 3",[0.06,0.9,0,1], (["B_RadioBag_01_eaf_F","vehLDF_COV","vehLDF_IFV1","vehLDF_IFV2","vehLDF_AV","vehLDF_BV","vehLDF_CV","vehLDF_TNK1","vehLDF_TH1","vehLDF_TH2","vehLDF_TH3","vehLDF_TH4","vehLDF_TH5","vehLDF_TH6","vehLDF_TH7","vehLDF_TH8","vehLDF_AH1","vehLDF_CAS1"] apply {toLower _x})]];
	f_var_radioChannels set [4, ["LR Channel 4",[0.9,0,0,1], (["B_RadioBag_01_ghex_F","vehCSAT_COV","vehCSAT_IFV1","vehCSAT_IFV2","vehCSAT_AV","vehCSAT_BV","vehCSAT_CV","vehCSAT_TNK1","vehCSAT_TH1","vehCSAT_TH2","vehCSAT_TH3","vehCSAT_TH4","vehCSAT_TH5","vehCSAT_TH6","vehCSAT_TH7","vehCSAT_TH8","vehCSAT_AH1","vehCSAT_CAS1"] apply {toLower _x})]];
	f_var_radioChannels set [5, ["LR Channel 5",[0.9,0,0,1], (["B_RadioBag_01_hex_F","vehCSAT_COV","vehCSAT_IFV1","vehCSAT_IFV2","vehCSAT_AV","vehCSAT_BV","vehCSAT_CV","vehCSAT_TNK1","vehCSAT_TH1","vehCSAT_TH2","vehCSAT_TH3","vehCSAT_TH4","vehCSAT_TH5","vehCSAT_TH6","vehCSAT_TH7","vehCSAT_TH8","vehCSAT_AH1","vehCSAT_CAS1"] apply {toLower _x})]];
	f_var_radioChannels set [6, ["LR Channel 6",[0.9,0,0,1], (["B_RadioBag_01_oucamo_F","vehCSAT_COV","vehCSAT_IFV1","vehCSAT_IFV2","vehCSAT_AV","vehCSAT_BV","vehCSAT_CV","vehCSAT_TNK1","vehCSAT_TH1","vehCSAT_TH2","vehCSAT_TH3","vehCSAT_TH4","vehCSAT_TH5","vehCSAT_TH6","vehCSAT_TH7","vehCSAT_TH8","vehCSAT_AH1","vehCSAT_CAS1"] apply {toLower _x})]];
	f_var_radioChannels set [7, ["LR Channel 7",[0.1,0.5,1,1], (["B_RadioBag_01_mtp_F","vehNATO_COV","vehNATO_IFV1","vehNATO_IFV2","vehNATO_AV","vehNATO_BV","vehNATO_CV","vehNATO_TNK1","vehNATO_TH1","vehNATO_TH2","vehNATO_TH3","vehNATO_TH4","vehNATO_TH5","vehNATO_TH6","vehNATO_TH7","vehNATO_TH8","vehNATO_AH1","vehNATO_CAS1"] apply {toLower _x})]];
	f_var_radioChannels set [8, ["LR Channel 8",[0.1,0.5,1,1], (["B_RadioBag_01_wdl_F","vehNATO_COV","vehNATO_IFV1","vehNATO_IFV2","vehNATO_AV","vehNATO_BV","vehNATO_CV","vehNATO_TNK1","vehNATO_TH1","vehNATO_TH2","vehNATO_TH3","vehNATO_TH4","vehNATO_TH5","vehNATO_TH6","vehNATO_TH7","vehNATO_TH8","vehNATO_AH1","vehNATO_CAS1"] apply {toLower _x})]];
	f_var_radioChannels set [9, ["LR Channel 9",[0.1,0.5,1,1], (["B_RadioBag_01_tropic_F","vehNATO_COV","vehNATO_IFV1","vehNATO_IFV2","vehNATO_AV","vehNATO_BV","vehNATO_CV","vehNATO_TNK1","vehNATO_TH1","vehNATO_TH2","vehNATO_TH3","vehNATO_TH4","vehNATO_TH5","vehNATO_TH6","vehNATO_TH7","vehNATO_TH8","vehNATO_AH1","vehNATO_CAS1"] apply {toLower _x})]];
	f_var_radioChannels set [10, ["LR Channel 10",[0.9,0.2,0.9,1],([] apply {toLower _x})]];
	
	// You can also tag a specific unit or vehicle for access to specific channels by setting a variable on them:
	// _unit setVariable ["f_var_radioChannelsObjectSpecific",[1,2,3],true];

	// Flatten all these arrays into one single list for potential later use
	f_var_radioChannelsUnified = [];
	f_var_radioChannelsUnified append (flatten (values f_var_radioChannels apply {_x select 1}));
	f_var_radioChannelsUnified = f_var_radioChannelsUnified arrayIntersect f_var_radioChannelsUnified;
	
	// If channels are not to be split, only create one.
	if (!_splitMode) then {
		_channelCount = 1;
	};
	
	// Set up channels to use
	for "_i" from 1 to (_channelCount) do {
		_channelName = format ["%1",((f_var_radioChannels get _i) select 0)];
		_channelColour = ((f_var_radioChannels get _i) select 1);
		_channelID = (radioChannelCreate [_channelColour, _channelName, "%UNIT_NAME", []]);
		if (_channelID != _i) exitWith {diag_log format ["F3 Radio: Channel %1 creation failed - unacceptable change to channel list in f\radio\f_radioChannels.sqf or too many channels", _channelName]};
	};

	// Broadcast variables for client use
	publicVariable "f_var_radioChannels";
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

