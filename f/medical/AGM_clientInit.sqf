// F3 - AGM Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

private "_typeOfUnit";

_typeOfUnit = player getVariable "f_var_assignGear";

// Remove pre-assigned medical items
player removeItems "FirstAidKit";
player removeItems "Medikit";

// Add basic items to all units
player addItem "AGM_EarBuds";
{player addItem "AGM_Bandage"} forEach [1,2,3,4,5];

if (_typeOfUnit == "m") then
{
	{player addItem "AGM_Epipen"} forEach [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
	player addItem "AGM_Bloodbag";

	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		(unitBackpack player) addItemCargoGlobal ["AGM_Bandage", 15];
		(unitBackpack player) addItemCargoGlobal ["AGM_Morphine", 15];
		(unitBackpack player) addItemCargoGlobal ["AGM_Bloodbag", 4];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		(unitBackpack player) addItemCargoGlobal ["AGM_Bandage", 17];
		(unitBackpack player) addItemCargoGlobal ["AGM_Morphine", 18];
		(unitBackpack player) addItemCargoGlobal ["AGM_Bloodbag", 5];
	};
};