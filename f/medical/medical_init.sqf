// F3 - Medical Systems Support initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN RELEVANT SCRIPTS, DEPENDING ON SYSTEM IN USE
// Each medical modification requires a different set of scripts to be used, and so we
// split into a separate script file for initialisation of each mod.

// Wait for parameter to be initialised
waitUntil{!isNil "f_var_medical"};

// Check which system to use
call
{
	// If 0 do nothing (Default Arma Healing)

	// F3 Simple Wounding System
	if (f_var_medical == 1) exitWith
	{
		// If script is being run on a client
		if (hasInterface) then
		{
			[player] execVM "f\simplewoundingsystem\init.sqf";
		};
	};
	// ACE Medical
	if (f_var_medical > 1) exitWith
	{
		// If script is being run on a client
		if (hasInterface) then
		{
			if (f_var_medical == 2) then
			{
				[] execVM "f\ace3\ACE3_MedicalStandardClient.sqf";
			};
			if (f_var_medical == 3) then
			{
				[] execVM "f\ace3\ACE3_MedicalAdvancedClient.sqf";
			};
		};
	};
};