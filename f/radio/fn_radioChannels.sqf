// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This module is activated in init.sqf.
Example:
[true] spawn f_fnc_radioChannels;

Arguments:
0. Long-range split mode (boolean). If true, each radio backpack type has a separate channel. If false, all backpacks use one channel. Default false.
1. Number of channels to create (number, optional). If this is set, the number of channels to be created will be limited to this number. If channels are not split, this will be automatically set to 1.

This module requires some missionmaker configuration. If you want to enable vehicle radio access, you need to specify vehicle classes or variable names in "f\radio\f_channelsList.sqf".
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
	
	// Define the list of channel properties. Go to this file to change which items and vehicles grant radio access.
	#include "f_channelsList.sqf";
	
	f_var_radioChannels = createHashmap;
	f_var_radioChannels set [1, [_channelName1,_channelColour1, (_channelList1 apply {toLower _x})]];
	f_var_radioChannels set [2, [_channelName2,_channelColour2, (_channelList2 apply {toLower _x})]];
	f_var_radioChannels set [3, [_channelName3,_channelColour3, (_channelList3 apply {toLower _x})]];
	f_var_radioChannels set [4, [_channelName4,_channelColour4, (_channelList4 apply {toLower _x})]];
	f_var_radioChannels set [5, [_channelName5,_channelColour5, (_channelList5 apply {toLower _x})]];
	f_var_radioChannels set [6, [_channelName6,_channelColour6, (_channelList6 apply {toLower _x})]];
	f_var_radioChannels set [7, [_channelName7,_channelColour7, (_channelList7 apply {toLower _x})]];
	f_var_radioChannels set [8, [_channelName8,_channelColour8, (_channelList8 apply {toLower _x})]];
	f_var_radioChannels set [9, [_channelName9,_channelColour9, (_channelList9 apply {toLower _x})]];
	f_var_radioChannels set [10, [_channelName10,_channelColour10,(_channelList10 apply {toLower _x})]];
	
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

