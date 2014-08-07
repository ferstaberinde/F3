// F3 - Medical Systems Support initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN RELEVANT SCRIPTS, DEPENDING ON SYSTEM IN USE
// Each medical modification requires a different set of scripts to be used, and so we
// split into a separate script file for initialisation of each mod.


// Define Medical Items

// Medical Items

_defib = "x39_defibrillator";
_bandage = "x39_bandage";
_morphine = "x39_morphine";
_epi = "x39_epinephrine";
_tourniquet = "x39_tourniquet";
_blood = "x39_bloodbag";
_med1 = "x39_medikit";
_med2 = "x39_medikit2";
_med3 = "x39_medikit3";
_med4 = "x39_medikit4";
_med5 = "x39_medikit5";
_earplug = "x39_earplug";

// =====================================================================================

// Wait for gear assignation to take place
waitUntil{(player getVariable ["f_var_assignGear_done", false])};

private "_typeOfUnit";

_typeOfUnit = player getVariable "f_var_assignGear";

// Remove pre-assigned medical items
player removeItems "FirstAidKit";
player removeItems "Medikit";

// =====================================================================================

// Add basic items to all units
	{player addItemToBackpack _epi} forEach [1,2,3];
	{player addItemToBackpack _med1} forEach [1];
	{player addItem _bandage} forEach [1,2,3,4,5];
	{player addItemToBackpack _tourniquet};
	{player addItem _morphine} forEach [1,2,3,4,5];

// Add specialist items to medics

if (_typeOfUnit == "m") then
{

	// BACKPACK: LIGHT
	if (f_param_backpacks <= 1) then {
		player additem _defib;
		(unitBackpack player) addItemCargoGlobal [_bandage, 12];
		(unitBackpack player) addItemCargoGlobal [_tourniquet, 3];
		(unitBackpack player) addItemCargoGlobal [_morphine, 12];
		(unitBackpack player) addItemCargoGlobal [_epi, 12];
		(unitBackpack player) addItemCargoGlobal [_blood, 4];
		(unitBackpack player) addItemCargoGlobal [_med5, 3];
	};
	// BACKPACK: HEAVY
	if (f_param_backpacks == 2) then {

		player additem _defib;
		(unitBackpack player) addItemCargoGlobal [_bandage, 20];
		(unitBackpack player) addItemCargoGlobal [_tourniquet, 3];
		(unitBackpack player) addItemCargoGlobal [_morphine, 20];
		(unitBackpack player) addItemCargoGlobal [_epi, 16];
		(unitBackpack player) addItemCargoGlobal [_blood, 8];
		(unitBackpack player) addItemCargoGlobal [_med5, 6];

	};
};


// =====================================================================================
