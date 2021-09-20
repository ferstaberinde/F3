// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This function checks what channels a player should have access to. It's called by event handlers set up by fn_radioAddHandlers.sqf.
=========================== */

// Clients wait for the server to finish with setup
waitUntil {!(isNil "f_var_radioChannelsUnified")};

_splitMode = f_var_radioSplitMode;

// Initialise variables
private _radioChannelsPlayerSpecific = [];
private _radioChannelsVehicleSpecific = [];
private _channelChecked = 0;
private _channelBackpacks = [];
private _channelsToAddListen = [];
private _channelsToAddTalk = [];

for "_i" from 1 to 10 do {

	_channelChecked = _i;
	// Check against the list of backpacks. If they have a backpack, add the currently checked channel number to the list of channels to add send & receive permissions for.
	_channelBackpacks = (f_var_radioChannelsBackpacks get _i);
	if ((backpack player) in _channelBackpacks) then {
		_channelsToAddListen pushBackUnique _channelChecked;
		_channelsToAddTalk pushBackUnique _channelChecked;
	};
	
	// Check for vehicles. Don't add send permissions unless they're the driver.
	_channelVehicles = (f_var_radioChannelsVehicles get _i);
	if ((vehicle player) in _channelVehicles) then {
		_channelsToAddListen pushBackUnique _channelChecked;
		if (player == driver vehicle player) then {
			_channelsToAddTalk pushBackUnique _channelChecked;
		};
	};
	// Same for vehicle classes.
	if ((typeOf vehicle player) in _channelVehicles) then {
		_channelsToAddListen pushBackUnique _channelChecked;
		if (player == driver vehicle player) then {
			_channelsToAddTalk pushBackUnique _channelChecked;
		};
	};
};

// Detect any channels activated by setting a variable on the player or their vehicle
_radioChannelsPlayerSpecific = (player getVariable ["f_var_radioChannelsObjectSpecific",[]]);
if ((count _radioChannelsPlayerSpecific) > 0) then {
	{
		_channelsToAddListen pushBackUnique _x;
		_channelsToAddTalk pushBackUnique _x;
	} forEach _radioChannelsObjectSpecific;
};

_radioChannelsVehicleSpecific = (vehicle player getVariable ["f_var_radioChannelsObjectSpecific",[]])
if ((count _radioChannelsPlayerSpecific) > 0) then {
	{
		_channelsToAddListen pushBackUnique _x;
		if (player == driver vehicle player) then {
			_channelsToAddTalk pushBackUnique _x;
		};
	} forEach _radioChannelsObjectSpecific;
};

// If running in unified mode, just compress all numbers down to the one channel if there are any channels to be added.
if (!_splitMode) then {

	if ((count _channelsToAddListen) > 0) then {
		_channelsToAddListen = [1];
	};
	if ((count _channelsToAddTalk) > 0) then {
		_channelsToAddTalk = [1];
	};
};
	
// Remove channels player shouldn't have access to
for "_i" from 1 to 10 do {
	if !(_i in _channelsToAddListen) then {
		_i radioChannelRemove [player];
};

// Disable the Command channel to avoid cheating
2 enableChannel false;

// Add player to the correct channels if they are eligible
{_x radioChannelAdd [player]} forEach _channelsToAddListen;
{(_x + 5) enableChannel true} forEach _channelsToAddTalk;