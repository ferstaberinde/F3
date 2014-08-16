// F3 - ACRE2 Init
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
sleep 5; // lets wait a bit.
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};
#include "acre2_settings.sqf"
systemChat str (side player);
// setup presets
_presetSetup = [] execVM "f\radios\acre2\acre2_setupPresets.sqf";
// waituntil script is done.
waitUntil {scriptDone _presetSetup};


// define our languages (need to be the same order for everyone)
{
	_x call acre_api_fnc_babelAddLanguageType;
} foreach f_radios_settings_acre2_languages;
// run client stuff.
if(!isDedicated) then
{
	[] execVM "f\radios\acre2\acre2_clientInit.sqf";
};