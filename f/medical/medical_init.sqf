// F3 - Medical Framework initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN RELEVANT SCRIPTS, DEPENDING ON SYSTEM IN USE
// Each medical modification requires a different set of scripts to be used, and so we
// split into a seperate script file for initialisation of each mod, on both the
// server and client.

// Wait for parameter to be initialised
waitUntil{!isNil "f_var_medical"};

// If any radio system selected
call {
    
	// Default Arma Healing
	if (f_var_medical == 0) exitWith {

		// If script is being run on the server
		if (hasInterface) then {

			[] execVM "f\medical\SWS_clientInit.sqf";

		};
	};

	// F3 Simple Wounding System
	if (f_var_medical == 1) exitWith {

		// If script is being run on a client
		if (hasInterface) then {

			[] execVM "f\medical\SWS_clientInit.sqf";
			[player] execVM "f\simplewoundingsystem\init.sqf";

		};
	};

	// Authentic Gameplay Modification
	if (f_var_medical == 2) exitWith {

		// If script is being run on a client
		if (hasInterface) then {

			[] execVM "f\medical\AGM_clientInit.sqf";

		};
	};
};

// ====================================================================================
