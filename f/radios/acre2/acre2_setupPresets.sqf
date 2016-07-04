// F3 - ACRE2 Preset Setup
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

private ["_radioName"];

//Set the names for all the radios properly.
{
	_radioName = _x;

	{
		[_radioName, "default2", _forEachIndex + 1, "label", _x select 0] call acre_api_fnc_setPresetChannelField;
	} forEach f_radios_settings_acre2_lr_groups_blufor;

	{
		[_radioName, "default3", _forEachIndex + 1, "label", _x select 0] call acre_api_fnc_setPresetChannelField;
	} forEach f_radios_settings_acre2_lr_groups_opfor;

	{
		[_radioName, "default4", _forEachIndex + 1, "label", _x select 0] call acre_api_fnc_setPresetChannelField;
	} forEach f_radios_settings_acre2_lr_groups_indfor;

} forEach ["ACRE_PRC148","ACRE_PRC152","ACRE_PRC117F"];
