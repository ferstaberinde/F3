// F3 - Medical Systems Pre Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait until medical param is initialized by the pre init param processor
// Pre Init is unscheduled space...
//waitUntil
//{
//	!(isNil {missionNamespace getVariable "f_var_medical"})
//};

// Handle forcing of medical level
switch (f_var_medical) do
{
	case 0:
	{
		// Default behaviour
		// Autodetect if ACE medical is running in the medical client init
		// ACE settings can be modified with description.ext classes, server config files
		// and editor placed modules
		if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then {
        	switch (ace_medical_level) do
        	{
        		case 0: {/* Do nothing */};
        		case 1: {f_var_medical = 2};
        		case 2: {f_var_medical = 3};
        	};
    	};
	};
	case 1:
	{
		// Change from SWS to default if ACE Medical is active
		missionNamespace setVariable ["f_var_medical",0];
	};
	case 2:
	{
		// Force ACE3 Simple if ACE medical present
		// Removes any place ACE modules that can change the setting
		// (wierd behaviour with initialization order)
		if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then {
			if (isServer) then
			{
				{deleteVehicle _x} forEach allMissionObjects "ACE_moduleMedicalSettings";
			};
			["ace_medical_level",1,true] call ACE_common_fnc_setSetting;
		} else {diag_log "ACE3 medical not found!"};
	};
	case 3:
	{
		// Force ACE3 Advanced if ACE medical present
		// Removes any place ACE modules that can change the setting
		// (wierd behaviour with initialization order)
		if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then {
			if (isServer) then
			{
				{deleteVehicle _x} forEach allMissionObjects "ACE_moduleMedicalSettings";
			};
			["ace_medical_level",2,true] call ACE_common_fnc_setSetting;
		} else {diag_log "ACE3 medical not found!"};
	};
};