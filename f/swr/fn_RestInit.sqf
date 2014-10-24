// F3 - Simple Weapon Resting
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

	f_rest_ballstart = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
	f_rest_ballend = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];

	f_rest_ballstart_alt = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
	f_rest_ballend_alt = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];

	f_rest_ballstart_third = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
	f_rest_ballend_third = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
	
	f_rest_deployed = false;
// ====================================================================================
	// Wait until f_var_debugMode is set
	waitUntil {!isnil "f_var_debugMode"};
// ====================================================================================

// if 0 hide the objects
	if(f_var_debugMode == 0) then
	{
		hideObject f_rest_ballstart;
		hideObject f_rest_ballend;

		hideObject f_rest_ballstart_alt;
		hideObject f_rest_ballend_alt;

		hideObject f_rest_ballstart_third;
		hideObject f_rest_ballend_third;
		
// ====================================================================================
// Wait a bit then attach the Keydown eventhandler and setup the overlay
sleep 0.1;
waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown",{_this call F_fnc_RestKeyDown;}];
hint "SWR inited";
4342 cutRsc ["f_rest_overlay","PLAIN"];