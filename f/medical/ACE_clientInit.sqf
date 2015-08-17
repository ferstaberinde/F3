// F3 - ACE 3 Basic Clientside Initialisation
// ====================================================================================

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

private "_typeOfUnit";

_typeOfUnit = player getVariable "f_var_assignGear";

// Remove pre-assigned medical items
{player removeItems _x} forEach ["ACE_fieldDressing","ACE_morphine","ACE_epinephrine","ACE_bloodIV"];

// Add basic items to all units
player addItem "ACE_EarPlugs";
{player addItem "ACE_fieldDressing"} forEach [1,2,3,4,5,6,7,9,10];
player addItem "ACE_morphine";

if (_typeOfUnit == "m") then
{

	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_fieldDressing",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 10];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   10];
		(unitBackpack player) addItemCargoGlobal ["ACE_BloodIV_500", 3];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_fieldDressing",  30];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 20];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   20];
		(unitBackpack player) addItemCargoGlobal ["ACE_BloodIV", 6];
	};
};


