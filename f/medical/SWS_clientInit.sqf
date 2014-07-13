// F3 - SWS Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

private ["_typeOfUnit"];

_typeOfUnit = player getVariable "f_var_assignGear";

player addItem "FirstAidKit";

if (_typeOfUnit == "m") then {
	{player addItem "FirstAidKit"} forEach [1,2,3,4];

	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		(unitBackpack player) addItemCargoGlobal ["Medikit", 1];
		(unitBackpack player) addItemCargoGlobal ["FirstAidKit", 4];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		(unitBackpack player) addItemCargoGlobal ["Medikit", 1];
		(unitBackpack player) addItemCargoGlobal ["FirstAidKit", 12];
	};
};