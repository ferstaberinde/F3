// F3 - ACRE2 Preset Setup
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

//Set the names for all the radios properly.
{
	_radioName = _x;
	_nameField = switch (_radioName) do {
					case "ACRE_PRC152": {"description"};
					case "ACRE_PRC148": {"label"};
					case "ACRE_PRC117F": {"name"};
					default {""};
				};
				
	_counter = 1;			
	{
		_channelName = _x;
		[_radioName, "default2", _counter, _nameField, _x] call acre_api_fnc_setPresetChannelField;
		_counter = _counter + 1;
	} forEach f_radios_settings_acre2_groups_blufor;
	
	_counter = 1;
	{
		_channelName = _x;
		[_radioName, "default3", _counter, _nameField, _x] call acre_api_fnc_setPresetChannelField;
		_counter = _counter + 1;
	} forEach f_radios_settings_acre2_groups_opfor;
	
	_counter = 1;
	{
		_channelName = _x;
		[_radioName, "default4", _counter, _nameField, _x] call acre_api_fnc_setPresetChannelField;
		_counter = _counter + 1;
	} forEach f_radios_settings_acre2_groups_indfor;
	
} forEach ["ACRE_PRC148","ACRE_PRC152","ACRE_PRC117F"];
