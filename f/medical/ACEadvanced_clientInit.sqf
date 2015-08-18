<<<<<<< HEAD
// F3 - ACE Advanced Clientside Initialisation
=======
// F3 - AGM Clientside Initialisation
>>>>>>> RayGab-patch-1
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

private "_typeOfUnit";

_typeOfUnit = player getVariable "f_var_assignGear";

// Remove pre-assigned medical items
{player removeItems _x} forEach ["ACE_tourniquet","ACE_fieldDressing","ACE_morphine","ACE_epinephrine","ACE_packingBandage","ACE_salineIV_250"];

// Add basic items to all units
player addItem "ACE_EarPlugs";
player addItem "ACE_personalAidKit";
player addItem "ACE_tourniquet";
{player addItem "ACE_fieldDressing"} forEach [1,2,3,4,5];
{player addItem "ACE_fieldDressing"} forEach [1,2,3,4,5];
{player addItem "ACE_morphine";} forEach [1,2];
{player addItem "ACE_epinephrine";} forEach [1,2];

if (_typeOfUnit == "m") then
{

	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_fieldDressing",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_elasticBandage",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_packingBandage",  5];
		(unitBackpack player) addItemCargoGlobal ["ACE_quikclot",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_tourniquet ",  3];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 5];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   5];
		(unitBackpack player) addItemCargoGlobal ["ACE_atropine",   8];
		(unitBackpack player) addItemCargoGlobal ["ACE_salineIV_250", 4];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_fieldDressing",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_elasticBandage",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_packingBandage",  5];
		(unitBackpack player) addItemCargoGlobal ["ACE_quikclot",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_tourniquet ",  5];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 8];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   8];
		(unitBackpack player) addItemCargoGlobal ["ACE_atropine",   12];
		(unitBackpack player) addItemCargoGlobal ["ACE_salineIV_500", 6];
		(unitBackpack player) addItemCargoGlobal ["ACE_surgicalKit", 4];
		(unitBackpack player) addItemCargoGlobal ["ACE_personalAidKit", 3];
	};
};


