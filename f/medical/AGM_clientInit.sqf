// F3 - AGM Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

private "_typeOfUnit";

_typeOfUnit = player getVariable "f_var_assignGear";

// Remove pre-assigned medical items
{player removeItems _x} forEach ["FirstAidKit","Medikit","AGM_Bandage","AGM_Morphine","AGM_Epipen","AGM_Bloodbag"];

// Add basic items to all units
player addItem "AGM_EarBuds";
{player addItem "AGM_Bandage"} forEach [1,2,3,4,5];
player addItem "AGM_Morphine";

if (_typeOfUnit == "m") then
{

	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		(unitBackpack player) addItemCargoGlobal ["AGM_Bandage",  15];
		(unitBackpack player) addItemCargoGlobal ["AGM_Morphine", 10];
		(unitBackpack player) addItemCargoGlobal ["AGM_Epipen",   10];
		(unitBackpack player) addItemCargoGlobal ["AGM_Bloodbag", 2];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		(unitBackpack player) addItemCargoGlobal ["AGM_Bandage", 25];
		(unitBackpack player) addItemCargoGlobal ["AGM_Morphine", 15];
		(unitBackpack player) addItemCargoGlobal ["AGM_Epipen",   15];
		(unitBackpack player) addItemCargoGlobal ["AGM_Bloodbag", 4];
	};
};
