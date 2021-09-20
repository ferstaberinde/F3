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
private _channelObjects = [];
private _channelsToAddListen = [];
private _channelsToAddTalk = [];

for "_i" from 1 to f_var_radioChannelCount do {

	// Check against the list of objects. If they have a backpack, add the currently checked channel number to the list of channels to add send & receive permissions for.
	_channelObjects = ((f_var_radioChannels get _i) select 1);
	if ((backpack player) in _channelObjects) then {
		_channelsToAddListen pushBackUnique _i;
		_channelsToAddTalk pushBackUnique _i;
	};
	
	// Check for vehicles. Don't add send permissions unless they're the driver.
	if ((str vehicle player) in _channelObjects) then {
		_channelsToAddListen pushBackUnique _i;
		if (player == driver vehicle player) then {
			_channelsToAddTalk pushBackUnique _i;
		};
	};
	// Same for vehicle classes.
	if ((typeOf vehicle player) in _channelObjects) then {
		_channelsToAddListen pushBackUnique _i;
		if (player == driver vehicle player) then {
			_channelsToAddTalk pushBackUnique _i;
		};
	};
};

// Detect any channels activated by setting a variable on the player or their vehicle
{
	_channelsToAddListen pushBackUnique _x;
	_channelsToAddTalk pushBackUnique _x;
} forEach (player getVariable ["f_var_radioChannelsObjectSpecific",[]]);

{
	_channelsToAddListen pushBackUnique _x;
	if (player == driver vehicle player) then {
		_channelsToAddTalk pushBackUnique _x;
	};
} forEach (vehicle player getVariable ["f_var_radioChannelsObjectSpecific",[]]);

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
for "_i" from 1 to f_var_radioChannelCount do {
	if !(_i in _channelsToAddListen) then {
		_i radioChannelRemove [player];
};

// Disable the Command channel to avoid cheating
2 enableChannel false;

// Add player to the correct channels if they are eligible
{_x radioChannelAdd [player]} forEach _channelsToAddListen;
{(_x + 5) enableChannel true} forEach _channelsToAddTalk;