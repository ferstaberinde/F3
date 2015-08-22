// F3 - ACE Advanced Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

private "_typeOfUnit";

_typeOfUnit = player getVariable "f_var_assignGear";

// Remove pre-assigned medical items
{player removeItems _x} forEach ["ACE_tourniquet","ACE_fieldDressing","ACE_morphine","ACE_epinephrine","ACE_packingBandage","ACE_salineIV_250"];

// Add basic items to all units
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_personalAidKit";
player addItemToUniform "ACE_tourniquet";
{player addItemToUniform "ACE_packingBandage"} forEach [1,2,3,4,5];
{player addItemToUniform "ACE_elasticBandage"} forEach [1,2,3,4,5];
{player addItemToUniform "ACE_morphine";} forEach [1,2];
{player addItemToUniform "ACE_epinephrine";} forEach [1,2];

if (_typeOfUnit == "m") then
{

	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_elasticBandage",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_packingBandage",  15];
		(unitBackpack player) addItemCargoGlobal ["ACE_tourniquet ",  2];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 5];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   5];
		(unitBackpack player) addItemCargoGlobal ["ACE_atropine",   2];
		(unitBackpack player) addItemCargoGlobal ["ACE_salineIV_250", 4];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_elasticBandage",  24];
		(unitBackpack player) addItemCargoGlobal ["ACE_packingBandage",  24];
		(unitBackpack player) addItemCargoGlobal ["ACE_tourniquet ",  5];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 9];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   9];
		(unitBackpack player) addItemCargoGlobal ["ACE_atropine",   4];
		(unitBackpack player) addItemCargoGlobal ["ACE_salineIV_500", 4];
		(unitBackpack player) addItemCargoGlobal ["ACE_surgicalKit", 3];
		(unitBackpack player) addItemCargoGlobal ["ACE_personalAidKit", 2];
	};
};


