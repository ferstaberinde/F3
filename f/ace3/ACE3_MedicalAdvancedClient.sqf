// F3 - ACE3 Medical Systems Support initialisation - Advanced
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

private "_typeOfUnit";

_typeOfUnit = player getVariable "f_var_assignGear";

// Remove pre-assigned medical items
{player removeItems _x} forEach ["FirstAidKit","Medikit","ACE_fieldDressing","ACE_packingBandage","ACE_elasticBandage","ACE_tourniquet","ACE_morphine","ACE_atropine","ACE_epinephrine","ACE_plasmaIV","ACE_plasmaIV_500","ACE_plasmaIV_250","ACE_bloodIV","ACE_bloodIV_500","ACE_bloodIV_250","ACE_salineIV","ACE_salineIV_500","ACE_salineIV_250","ACE_quikclot","ACE_personalAidKit","ACE_surgicalKit","ACE_bodyBag"];

{player addItem "ACE_fieldDressing"} forEach [1,2,3];
{player addItem "ACE_packingBandage"} forEach [1,2,3];
{player addItem "ACE_morphine"} forEach [1,2];
player addItem "ACE_tourniquet";

if (_typeOfUnit == "m") then
{
	// Extra tourniquet
	player addItem "ACE_tourniquet";
	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_fieldDressing",  5];
		(unitBackPack player) addItemCargoGlobal ["ACE_packingBandage", 10];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 10];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine",   10];
		(unitBackpack player) addItemCargoGlobal ["ACE_salineIV_250", 1];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {
		(unitBackpack player) addItemCargoGlobal ["ACE_fieldDressing", 10];
		(unitBackPack player) addItemCargoGlobal ["ACE_packingBandage", 15];
		(unitBackpack player) addItemCargoGlobal ["ACE_morphine", 15];
		(unitBackpack player) addItemCargoGlobal ["ACE_epinephrine", 15];
		(unitBackpack player) addItemCargoGlobal ["ACE_salineIV_250", 2];
	};
};