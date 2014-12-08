// F3 - ACRE2 Init
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// precompile functions
f_acre2_presetSetup = compile preprocessFileLineNumbers "f\radios\acre2\acre2_setupPresets.sqf";
f_acre2_clientInit = compile preprocessFileLineNumbers "f\radios\acre2\acre2_clientInit.sqf";
f_fnc_GiveSideRadio = compile preprocessFileLineNumbers "f\radios\acre2\fn_giveSideRadio.sqf";



// jip check
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// include the smaller acre2 settings file.
#include "acre2_settings.sqf"


// setup presets
_presetSetup = [] call f_acre2_presetSetup;


// run client stuff.
if(!isDedicated) then
{
	[] call f_acre2_clientInit;
};