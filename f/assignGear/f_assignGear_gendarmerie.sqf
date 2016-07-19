// F3 - Folk ARPS Assign Gear Script - GENDARMERIE
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DEFINE EQUIPMENT TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//		co			- commander
//		dc 			- deputy commander / squad leader
//		m 			- medic
//		pat 		- patrolman
//		car			- carabineer
//		smg			- submachinegunner
//		mk			- marksman
//		nf			- night force
//
//		v_car		- car/4x4
//		v_helo_l	- transport helo (light)
//
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

// ATTACHMENTS - PRIMARY
_attach1 = "acc_pointer_IR";	// IR Laser
_attach2 = "acc_flashlight";	// Flashlight

_silencer1 = "muzzle_snds_B";	// 5.56 suppressor
_silencer2 = "muzzle_snds_H";	// 6.5 suppressor

_scope1 = "optic_ACO";			// ACO
_scope2 = "optic_MRCO";			// MRCO Scope - 1x - 6x
_scope3 = "optic_SOS";			// SOS Scope - 18x - 75x

_bipod1 = "bipod_02_F_blk";		// Default bipod
_bipod2 = "bipod_02_F_blk";		// Black bipod

// Default setup
_attachments = []; 		// The default attachment set for most units, overwritten in the individual unitType

// [] = remove all
// [_attach1,_scope1,_silencer] = remove all, add items assigned in _attach1, _scope1 and _silencer1
// [_scope2] = add _scope2, remove rest
// false = keep attachments as they are

// ====================================================================================

// ATTACHMENTS - HANDGUN
_hg_silencer1 = "muzzle_snds_L";				// PM 9MM does not accept a suppressor

_hg_scope1 = "optic_mrd";		// MRD

// Default setup
_hg_attachments= []; // The default attachment set for handguns, overwritten in the individual unitType

// ====================================================================================

// WEAPON SELECTION

// Standard Riflemen ( MMG Assistant Gunner, Assistant Automatic Rifleman, MAT Assistant Gunner, MTR Assistant Gunner, Rifleman)
_rifle = "srifle_DMR_03_F";
_riflemag = "20Rnd_762x51_Mag";

// Standard Carabineer (Medic, Rifleman (AT), MAT Gunner, MTR Gunner, Carabineer)
_carbine = "arifle_SPAR_01_blk_F";
_carbinemag = "30Rnd_556x45_Stanag";

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "SMG_05_F";
_smgmag = "30Rnd_9x21_Mag_SMG_02";

// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)
_pistol = "hgun_Rook40_F";
_pistolmag = "16Rnd_9x21_Mag";

// Grenades
_grenade = "HandGrenade";
_Mgrenade = "MiniGrenade";
_smokegrenade = "SmokeShell";
_smokegrenadegreen = "SmokeShellGreen";
_smokegrenadeblue = "SmokeShellBlue";
_smokegrenadepurple = "SmokeShellPurple";

// misc medical items.
_firstaid = "FirstAidKit";
_medkit = "Medikit";

// Chemlights
_chemgreen =  "Chemlight_green";
_chemred = "Chemlight_red";
_chemyellow =  "Chemlight_yellow";
_chemblue = "Chemlight_blue";

// Backpacks
_bag = "B_AssaultPack_blk";
_baglarge = "B_Kitbag_blk";

// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

// Marksman rifle
_DMrifle = "arifle_SPAR_03_blk_F";
_DMriflemag = "20Rnd_762x51_Mag";

// ====================================================================================

// CLOTHES AND UNIFORMS

// Define classes. This defines which gear class gets which uniform
// "medium" vests are used for all classes if they are not assigned a specific uniform

_light = [];
_pilot = ["pp","pcc"];
_specOp = ["nf"];

// Basic clothing
// The outfit-piece is randomly selected from the array for each unit

_baseUniform = ["U_B_GEN_Soldier_F"];
_baseHelmet = ["H_MilCap_gen_F"];
_baseGlasses = ["G_Aviator"];

// Vests
_lightRig = ["V_TacVest_gen_F"];
_standardRig = ["V_TacVest_gen_F"];

// Pilot
_pilotUniform = ["U_B_GEN_Commander_F"];
_pilotHelmet = _baseHelmet;
_pilotRig = ["V_TacVest_gen_F"];
_pilotGlasses = ["G_Aviator"];

// Spec Op (Night Force)
_sfuniform = ["U_B_GEN_Commander_F"];
_sfhelmet = ["H_Helmet_Skate"];
_sfRig = ["V_PlateCarrier1_blk"];
_sfGlasses = ["G_Balaclava_blk"];


// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following interprets what has been passed to this script element

_typeofUnit = toLower (_this select 0);	// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

	// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

	// ====================================================================================

	// ADD UNIVERSAL ITEMS
	// Add items universal to all units of this faction

	_unit linkItem _nvg;			// Add and equip the faction's nvg
	_unit addItem _firstaid;		// Add a single first aid kit (FAK)
	_unit linkItem "ItemMap";		// Add and equip the map
	_unit linkItem "ItemCompass";	// Add and equip a compass
	_unit linkItem "ItemRadio";		// Add and equip A3's default radio
	_unit linkItem "ItemWatch";		// Add and equip a watch
	_unit linkItem "ItemGPS"; 	// Add and equip a GPS

};

// ====================================================================================

// F3 - Folk ARPS Assign Gear Script - AAF - Light Loadout
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_typeofUnit) do
{

// ====================================================================================

// Patrolman Loadout:
	case "pat":
	{
		_unit setUnitTrait ["medic",true]; // Can use medkit
		_unit addmagazines [_pistolmag, 1];
		_unit addweapon _pistol;
		_unit addmagazines [_pistolmag, 7];
		_unit addItem _firstaid;
		_unit addWeapon "Rangefinder";
		_unit addmagazines [_smokegrenade, 1];
		_unit addmagazines [_chemgreen,1];
		_unit addmagazines [_chemred,1];
		_unit addmagazines [_chemyellow,1];
	};
// DC Loadout:
	case "dc":
	{
		_unit setUnitTrait ["medic",true]; // Can use medkit
		_unit addmagazines [_pistolmag, 1];
		_unit addweapon _pistol;
		_unit addmagazines [_pistolmag, 7];
		_unit addItem _firstaid;
		_unit addWeapon "Rangefinder";
		_unit addmagazines [_smokegrenade, 1];
		_unit addmagazines [_chemgreen,1];
		_unit addmagazines [_chemred,1];
		_unit addmagazines [_chemyellow,1];
	};
// CO Loadout:
	case "co":
	{
		_unit setUnitTrait ["medic",true]; // Can use medkit
		_unit addmagazines [_pistolmag, 1];
		_unit addweapon _pistol;
		_unit addmagazines [_pistolmag, 7];
		_unit addItem _firstaid;
		_unit addWeapon "Rangefinder";
		_unit addmagazines [_smokegrenade, 1];
		_unit addmagazines [_chemgreen,1];
		_unit addmagazines [_chemred,1];
		_unit addmagazines [_chemyellow,1];
	};
// Marksman Loadout:
	case "mk":
	{
		_unit setUnitTrait ["medic",true]; // Can use medkit
		_unit addmagazines [_DMriflemag, 1];
		_unit addweapon _DMrifle;
		_attachments = [_bipod1,_scope3]; // Overwrites default attachments to add a bipod and scope 2
		_unit addItem _firstaid;
		_unit addmagazines [_DMriflemag, 7];
		_unit addmagazines [_pistolmag, 1];
		_unit addweapon _pistol;
		_unit addmagazines [_pistolmag, 7];
	};
// Heli Pilot Loadout:
	case "pp":
	{
		_unit setUnitTrait ["medic",true]; // Can use medkit
		_unit setUnitTrait ["engineer",true]; // Can repair
		_unit addmagazines [_pistolmag, 1];
		_unit addweapon _pistol;
		_unit addmagazines [_pistolmag, 7];
		_unit addItem _firstaid;
		_unit addmagazines [_smokegrenadeblue, 4];
	};
// Carbineer Loadout:
	case "car":
	{
		_unit setUnitTrait ["medic",true]; // Can use medkit
		_unit addmagazines [_carbinemag, 1];
		_unit addweapon _carbine;
		_unit addItem _firstaid;
		_unit addmagazines [_carbinemag, 7];
		_unit addmagazines [_pistolmag, 1];
		_unit addweapon _pistol;
		_unit addmagazines [_pistolmag, 7];
		_unit addmagazines [_smokegrenade, 1];
		_unit addmagazines [_chemgreen,1];
		_unit addmagazines [_chemred,1];
		_unit addmagazines [_chemyellow,1];
	};
// Submachinegunner Loadout:
	case "smg":
	{
		_unit setUnitTrait ["medic",true]; // Can use medkit
		_unit addmagazines [_smgmag, 1];
		_unit addweapon _smg;
		_unit addItem _firstaid;
		_unit addmagazines [_smgmag, 7];
		_unit addmagazines [_pistolmag, 1];
		_unit addweapon _pistol;
		_unit addmagazines [_pistolmag, 7];
		_unit addmagazines [_smokegrenade, 1];
		_unit addmagazines [_chemgreen,1];
		_unit addmagazines [_chemred,1];
		_unit addmagazines [_chemyellow,1];
	};
// Night Force Loadout:
	case "nf":
	{
		_unit addmagazines [_riflemag, 1];
		_unit addweapon _rifle;
		_unit addmagazines [_pistolmag, 1];
		_unit addweapon _pistol;
		_unit addmagazines [_pistolmag, 7];
		_unit addItem _firstaid ;
		_unit addmagazines [_riflemag, 7];
		_attachments pushback (_silencer1); // Adds silencer
		_hg_attachments pushback (_hg_silencer1); // Adds pistol silencer
		_unit addWeapon "Rangefinder";
		_unit addmagazines [_grenade, 2];
		_unit addmagazines [_smokegrenade, 2];
		_unit addmagazines [_chemgreen,1];
		_unit addmagazines [_chemred,1];
		_unit addmagazines [_chemyellow,1];
	};
// CARGO: CAR - room for 10 weapons and 50 cargo items
	case "v_car":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_smgm, 2];
		_unit addMagazineCargoGlobal [_smgmag, 12];
	    _unit addMagazineCargoGlobal [_chemgreen,4];
	    _unit addMagazineCargoGlobal [_chemred,4];
	    _unit addMagazineCargoGlobal [_chemyellow,4];
		_unit addItemCargoGlobal ["Toolkit",1];
		_unit addItemCargoGlobal [_firstaid,4];
		_unit addItemCargoGlobal [_medkit,1];
	};
//CARGO: Rotary Transport Light
    case "v_helo_l":
    {
        clearWeaponCargoGlobal _unit;
	    clearMagazineCargoGlobal _unit;
	    clearItemCargoGlobal _unit;
	    clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_smgm, 2];
	    _unit addMagazineCargoGlobal [_smgmag, 12];
	    _unit addMagazineCargoGlobal [_chemgreen,4];
	    _unit addMagazineCargoGlobal [_chemred,4];
	    _unit addMagazineCargoGlobal [_chemyellow,4];
		_unit addItemCargoGlobal [_firstaid,4];
	    _unit addBackpackCargoGlobal ["B_Parachute",2];
		_unit addItemCargoGlobal ["Toolkit",1];
		_unit addItemCargoGlobal [_firstaid,4];
		_unit addItemCargoGlobal [_medkit,1];
	};

// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ====================================================================================

// If this isn't run on an infantry unit we can exit
if !(_isMan) exitWith {};

// ====================================================================================

// Handle weapon attachments
#include "f_assignGear_attachments.sqf";

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING
_unit selectweapon primaryweapon _unit;