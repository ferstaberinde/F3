// F3 - Folk ARPS Long-Range Radio Module
// Credits and documentation: https://github.com/folkarps/F3/wiki

/* ========================
This function checks what channels a player should have access to. It's called by event handlers set up by fn_radioAddHandlers.sqf.
=========================== */
params ["_unit"];

// Skip if the unit is an AI, so formerly-player AI units can't break the radio channels of players they're local to.
if !(isPlayer _unit) exitWith {};

_splitMode = f_var_radioSplitMode;

// Initialise variables
private _radioChannels_unitSpecific = [];
private _radioChannelsVehicleSpecific = [];
private _channelObjects = [];
private _channelsToAddListen = [];
private _channelsToAddTalk = [];

// Do all this twice to make sure it happens
for "_i" from 1 to 2 do {

	// Check whether the user has turned off the radio in this vehicle.
	private _vicRadioOn = vehicle _unit getVariable ["f_var_radioIsOn",true];
	
	// Iterate through the whole list of channels
	for "_i" from 1 to f_var_radioChannelCount do {

		// Check against the list of objects. If they have a backpack or other inventory item, add the currently checked channel number to the list of channels to add send & receive permissions for.
		_channelObjects = ((f_var_radioChannels get _i) select 2);
		{
			if ([_unit,_x] call BIS_fnc_hasItem) then {
				_channelsToAddListen pushBackUnique _i;
				_channelsToAddTalk pushBackUnique _i;
			};
		} forEach _channelObjects;
		
		// If the vehicle radio is turned off, don't check for vehicle-provided channels.
		if _vicRadioOn then {
			// Check for vehicles. Don't add send permissions unless they're the driver.
			if ((toLower str vehicle _unit) in _channelObjects) then {
				_channelsToAddListen pushBackUnique _i;
				if (_unit in [driver vehicle _unit,commander vehicle _unit,gunner vehicle _unit]) then {
					_channelsToAddTalk pushBackUnique _i;
				};
			};
			// Same for vehicle classes.
			if ((toLower typeOf vehicle _unit) in _channelObjects) then {
				_channelsToAddListen pushBackUnique _i;
				if (_unit in [driver vehicle _unit,commander vehicle _unit,gunner vehicle _unit]) then {
					_channelsToAddTalk pushBackUnique _i;
				};
			};
		};
	};

	// Detect any channels activated by setting a variable on the player or their vehicle
	{
		_channelsToAddListen pushBackUnique _x;
		_channelsToAddTalk pushBackUnique _x;
	} forEach (_unit getVariable ["f_var_radioChannelsObjectSpecific",[]]);

	// If the vehicle radio is turned off, don't check for vehicle-provided channels.
	if _vicRadioOn then {	
		{
			_channelsToAddListen pushBackUnique _x;
			if (_unit in [driver vehicle _unit,commander vehicle _unit,gunner vehicle _unit]) then {
				_channelsToAddTalk pushBackUnique _x;
			};
		} forEach (vehicle _unit getVariable ["f_var_radioChannelsObjectSpecific",[]]);
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
	for "_i" from 1 to f_var_radioChannelCount do {

		if !(_i in _channelsToAddTalk) then {
			(_i + 5) enableChannel false;
		};
		if !(_i in _channelsToAddListen) then {
			_i radioChannelRemove [_unit];
		};
		
	};

	// Disable the Command channel to avoid cheating
	2 enableChannel false;

	// Add player to the correct channels if they are eligible
	{_x radioChannelAdd [_unit]} forEach _channelsToAddListen;
	{(_x + 5) enableChannel true} forEach _channelsToAddTalk;

	// DEBUG
	if (f_param_debugMode == 1) then
	{
		systemChat format ["DEBUG (fn_radioCheckChannels.sqf): added listen channels %1, talk channels %2",_channelsToAddListen,_channelsToAddTalk];
	};
	
	// Delay between the two check cycles
	sleep 1;
};