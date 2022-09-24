// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

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

You can also tag a specific unit or vehicle for access to specific channels by setting a variable on them:
_unit setVariable ["f_var_radioChannelsObjectSpecific",[1,2,3],true];

There is a maximum of 10 channels at any time. Add in these radios for GM and CSLA missions:

		"US85_bpPRC77"
		"CSLA_bpWpR129"
		"CSLA_bpWpRF10"
		"gm_gc_backpack_r105m_brn"
		"gm_ge_backpack_sem35_oli"
*/

// Channel 1 (default: generic)
_channelName1 = "LR Channel 1";
_channelColour1 = [1, 0.3, 0.1, 1];
_channelList1 = [
	"B_RadioBag_01_black_F"
];

// Channel 2 (default: AAF)
_channelName2 = "LR Channel 2";
_channelColour2 = [0.06,0.9,0,1];
_channelList2 = [
	"B_RadioBag_01_digi_F",
	"vehAAF_COV",
	"vehAAF_IFV1",
	"vehAAF_IFV2",
	"vehAAF_AV",
	"vehAAF_BV",
	"vehAAF_CV",
	"vehAAF_TNK1",
	"vehAAF_TH1",
	"vehAAF_TH2",
	"vehAAF_TH3",
	"vehAAF_TH4",
	"vehAAF_TH5",
	"vehAAF_TH6",
	"vehAAF_TH7",
	"vehAAF_TH8",
	"vehAAF_AH1",
	"vehAAF_CAS1"
];

// Channel 3 (default: LDF)
_channelName3 = "LR Channel 3";
_channelColour3 = [0.06,0.9,0,1];
_channelList3 = [
	"B_RadioBag_01_eaf_F",
	"vehLDF_COV",
	"vehLDF_IFV1",
	"vehLDF_IFV2",
	"vehLDF_AV",
	"vehLDF_BV",
	"vehLDF_CV",
	"vehLDF_TNK1",
	"vehLDF_TH1",
	"vehLDF_TH2",
	"vehLDF_TH3",
	"vehLDF_TH4",
	"vehLDF_TH5",
	"vehLDF_TH6",
	"vehLDF_TH7",
	"vehLDF_TH8",
	"vehLDF_AH1",
	"vehLDF_CAS1"
];

// Channel 4 (default: CSAT Pacific)
_channelName4 = "LR Channel 4";
_channelColour4 = [0.9,0,0,1];
_channelList4 = [
	"B_RadioBag_01_ghex_F",
	"vehCSAT_COV",
	"vehCSAT_IFV1",
	"vehCSAT_IFV2",
	"vehCSAT_AV",
	"vehCSAT_BV",
	"vehCSAT_CV",
	"vehCSAT_TNK1",
	"vehCSAT_TH1",
	"vehCSAT_TH2",
	"vehCSAT_TH3",
	"vehCSAT_TH4",
	"vehCSAT_TH5",
	"vehCSAT_TH6",
	"vehCSAT_TH7",
	"vehCSAT_TH8",
	"vehCSAT_AH1",
	"vehCSAT_CAS1"
];

// Channel 5 (default: CSAT Mediterranean)
_channelName5 = "LR Channel 5";
_channelColour5 = [0.9,0,0,1];
_channelList5 = [
	"B_RadioBag_01_hex_F",
	"vehCSAT_COV",
	"vehCSAT_IFV1",
	"vehCSAT_IFV2",
	"vehCSAT_AV",
	"vehCSAT_BV",
	"vehCSAT_CV",
	"vehCSAT_TNK1",
	"vehCSAT_TH1",
	"vehCSAT_TH2",
	"vehCSAT_TH3",
	"vehCSAT_TH4",
	"vehCSAT_TH5",
	"vehCSAT_TH6",
	"vehCSAT_TH7",
	"vehCSAT_TH8",
	"vehCSAT_AH1",
	"vehCSAT_CAS1"
];

// Channel 6 (default: CSAT Urban)
_channelName6 = "LR Channel 6";
_channelColour6 = [0.9,0,0,1];
_channelList6 = [
	"B_RadioBag_01_oucamo_F",
	"vehCSAT_COV",
	"vehCSAT_IFV1",
	"vehCSAT_IFV2",
	"vehCSAT_AV",
	"vehCSAT_BV",
	"vehCSAT_CV",
	"vehCSAT_TNK1",
	"vehCSAT_TH1",
	"vehCSAT_TH2",
	"vehCSAT_TH3",
	"vehCSAT_TH4",
	"vehCSAT_TH5",
	"vehCSAT_TH6",
	"vehCSAT_TH7",
	"vehCSAT_TH8",
	"vehCSAT_AH1",
	"vehCSAT_CAS1"
];

// Channel 7 (default: NATO Mediterranean)
_channelName7 = "LR Channel 7";
_channelColour7 = [0.1,0.5,1,1];
_channelList7 = [
	"B_RadioBag_01_mtp_F",
	"vehNATO_COV",
	"vehNATO_IFV1",
	"vehNATO_IFV2",
	"vehNATO_AV",
	"vehNATO_BV",
	"vehNATO_CV",
	"vehNATO_TNK1",
	"vehNATO_TH1",
	"vehNATO_TH2",
	"vehNATO_TH3",
	"vehNATO_TH4",
	"vehNATO_TH5",
	"vehNATO_TH6",
	"vehNATO_TH7",
	"vehNATO_TH8",
	"vehNATO_AH1",
	"vehNATO_CAS1"
];

// Channel 8 (default: NATO Woodland)
_channelName8 = "LR Channel 8";
_channelColour8 = [0.1,0.5,1,1];
_channelList8 = [
	"B_RadioBag_01_wdl_F",
	"vehNATO_COV",
	"vehNATO_IFV1",
	"vehNATO_IFV2",
	"vehNATO_AV",
	"vehNATO_BV",
	"vehNATO_CV",
	"vehNATO_TNK1",
	"vehNATO_TH1",
	"vehNATO_TH2",
	"vehNATO_TH3",
	"vehNATO_TH4",
	"vehNATO_TH5",
	"vehNATO_TH6",
	"vehNATO_TH7",
	"vehNATO_TH8",
	"vehNATO_AH1",
	"vehNATO_CAS1"
];

// Channel 9 (default: NATO Pacific)
_channelName9 = "LR Channel 9";
_channelColour9 = [0.1,0.5,1,1];
_channelList9 = [
	"B_RadioBag_01_tropic_F",
	"vehNATO_COV",
	"vehNATO_IFV1",
	"vehNATO_IFV2",
	"vehNATO_AV",
	"vehNATO_BV",
	"vehNATO_CV",
	"vehNATO_TNK1",
	"vehNATO_TH1",
	"vehNATO_TH2",
	"vehNATO_TH3",
	"vehNATO_TH4",
	"vehNATO_TH5",
	"vehNATO_TH6",
	"vehNATO_TH7",
	"vehNATO_TH8",
	"vehNATO_AH1",
	"vehNATO_CAS1"
];

// Channel 10 (default: unused)
_channelName10 = "LR Channel 10";
_channelColour10 = [0.9,0.2,0.9,1];
_channelList10 = [
	"Your stuff here!"
];