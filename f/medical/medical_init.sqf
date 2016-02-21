// F3 - Medical Systems Support initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN RELEVANT SCRIPTS, DEPENDING ON SYSTEM IN USE
// Each medical modification requires a different set of scripts to be used, and so we
// split into a separate script file for initialisation of each mod.

// Check which system to use
call
{
	// If 0 do nothing (Default Arma Healing)

	// F3 Simple Wounding System
	if (f_param_medical == 1) exitWith
	{
		// If script is being run on a client
		if (hasInterface) then
		{
			[player] execVM "f\simplewoundingsystem\init.sqf";
		};
	};
	// Authentic Gameplay Modification
	if (f_param_medical == 2) exitWith
	{
		// If script is being run on a client
		if (hasInterface) then
		{
			[] execVM "f\medical\AGM_clientInit.sqf";
		};
	};
};