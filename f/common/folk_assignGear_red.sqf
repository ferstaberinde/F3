// F3 - Folk Assign Gear Script - Red
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DEFINE EQUIPMENT TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//		co		- commander
//		dc 		- deputy commander
//		m 		- medic
//		ftl		- fire team leader
//		ar 		- automatic rifleman
//		aar		- assistant automatic rifleman
//		rat		- rifleman (AT)
//		mmgg		- medium mg gunner
//		mmgag		- medium mg assistant
//		matg		- medium AT gunner
//		matag		- medium AT assistant
//		mtrg		- mortar gunner (deployable)
//		mtrag		- mortar assistant (deployable)
//		p		- air vehicle pilots
//		eng		- engineers
//		div    		- divers
//
//		r 		- rifleman
//		car		- carabineer
//		smg		- submachinegunner
//		gren		- grenadier
//
//		v_car		- car/4x4
//		v_tr		- truck
//		v_ifv		- ifv
//
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES


// Attachments
// nil = no change
// [] = remove all
// ["acc_pointer_IR","optic_ACO_grn"] = remove all, add items.

// Standard Riflemen ( MMG Assistant Gunner, Assistant Automatic Rifleman, MAT Assistant Gunner, MTR Assistant Gunner, Rifleman)
_rifle = "arifle_Katiba_F";
_riflemag = "30Rnd_65x39_caseless_green";
_riflemag_tr = "30Rnd_65x39_caseless_green_mag_Tracer";
_rifle_attach = ["acc_pointer_IR","optic_ACO_grn"];

// Standard Carabineer (Medic, Rifleman (AT), MAT Gunner, MTR Gunner, Carabineer)
_carbine = "arifle_Katiba_C_F";
_carbinemag = "30Rnd_65x39_caseless_green";
_carbinemag_tr = "30Rnd_65x39_caseless_green_mag_Tracer";
_carbine_attach = ["acc_pointer_IR","optic_ACO_grn"];

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "SMG_02_F";
_smgmag = "30Rnd_9x21_Mag";
_smgmag_tr = "30Rnd_9x21_Mag";
_smg_attach = nil;

// Diver
_diverWep = "arifle_SDAR_F";
_diverMag1 = "30Rnd_556x45_Stanag";
_diverMag2 = "20Rnd_556x45_UW_mag";
_diverWep_attach = nil;

// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = "arifle_Katiba_GL_F";
_glriflemag = "30Rnd_65x39_caseless_green";
_glriflemag_tr = "30Rnd_65x39_caseless_green_mag_Tracer";
_glmag = "1Rnd_HE_Grenade_shell";
_glrifle_attach = ["acc_pointer_IR","optic_ACO_grn"];

// Smoke for FTLs, Squad Leaders, etc
_glsmokewhite = "1Rnd_Smoke_Grenade_shell";
_glsmokegreen = "1Rnd_SmokeGreen_Grenade_shell";
_glsmokered = "1Rnd_SmokeRed_Grenade_shell";

// Flares for FTLs, Squad Leaders, etc
_glflarewhite = "3Rnd_UGL_FlareWhite_F";
_glflarered = "3Rnd_UGL_FlareRed_F";
_glflareyellow = "3Rnd_UGL_FlareYellow_F";
_glflaregreen = "3Rnd_UGL_FlareGreen_F";

// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)
_pistol = "hgun_Rook40_F";
_pistolmag = "16Rnd_9x21_Mag";

// Grenades
_grenade = "HandGrenade";
_smokegrenade = "SmokeShell";
_smokegrenadegreen = "SmokeShellGreen";

// misc medical items.
_firstaid = "FirstAidKit";
_medkit = "Medikit";

// Night Vision Goggles (NVGoggles)
_nvg = "NVGoggles_OPFOR";

// Backpacks
_bagmedium = "B_FieldPack_ocamo";			// used by most roles
_baglarge =  "B_Carryall_ocamo"; 			// used by medic and engineers
_bagmediumdiver =  "B_AssaultPack_blk";		// used by divers

// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

// Automatic Rifleman
_AR = "LMG_Mk200_F";
_ARmag = "200Rnd_65x39_cased_Box";
_ARmag_tr = "200Rnd_65x39_cased_Box_Tracer";
_AR_attach = ["acc_pointer_IR","optic_ACO_grn"];

// Medium MG
_MMG = "LMG_Zafir_F";
_MMGmag = "150Rnd_762x51_Box";
_MMGmag_tr = "150Rnd_762x51_Box_Tracer";
_MMG_attach = ["acc_pointer_IR","optic_ACO"];

// Rifleman AT
_RAT = "launch_RPG32_F";
_RATmag = "RPG32_F";

// Mortar
_MTR = "B_Mk6Mortar_Wpn";
_MTRmount = "B_Mk6Mortar_Support";

// Medium AT
_MAT = "launch_O_Titan_short_F";
_MATmag1 = "Titan_AT";
_MATmag2 = "Titan_AP";
// Surface Air
_SAM = "launch_O_Titan_F";
_SAMmag = "Titan_AA";
// Engineer items.
_ATmine = "ATMine_Range_Mag";
_satchel = "DemoCharge_Remote_Mag";
_APmine1 = "APERSBoundingMine_Range_Mag";
_APmine2 = "APERSMine_Range_Mag";

// ====================================================================================

// CLOTHES AND UNIFORMS

// Base
_baseUniform = "U_O_CombatUniform_ocamo";
_baseHelmet = "H_HelmetO_ocamo";
_lightRig = "V_HarnessO_brn"; // co,dc,ftl,medic,rat,matag,mmgag
_heavyRig = "V_HarnessOGL_brn"; // ar,eng

// Diver
_diverUniform =  "U_O_Wetsuit";
_diverHelmet = "";
_diverRig = "V_RebreatherIR";
_diverGlasses = "G_Diving";
// Pilot
_pilotUniform = "U_O_PilotCoveralls";
_pilotHelmet = "H_PilotHelmetHeli_O";
_pilotRig = "V_TacVest_blk";
// Crewman
_crewUniform = "U_O_SpecopsUniform_ocamo"; // default in A3 :)
_crewHelmet = "H_HelmetCrew_O";
_crewRig = "V_TacVest_blk";
// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init

// ====================================================================================

// HANDLE CLOTHES
// Handle clothes and helmets and such using the include file called next.

#include "f_assignGear_clothes.sqf";

// ====================================================================================

// PREPARE UNIT FOR GEAR ADDITION
// The following code removes all existing weapons and backpacks

removeBackpack _unit;
removeallweapons _unit;

// We add a single first aid kit (FAK)

_unit addItem _firstaid;

// The following code removes any pre-added NVGs

if(_nvg in (assignedItems player)) then
{
_unit unassignItem _nvg;
_unit removeItem _nvg;
};

_unit addItem _nvg;
_unit assignItem _nvg;					// add universal NVG for this faction

//removeAllItems _unit;						// remove default items: map, compass, watch, radio (and GPS for team/squad leaders)
//unit addItem "ItemGPS"; 					// add gps to this faction
//_unit assignItem "ItemGPS";
//_unit addweapon "ItemMap";
//_unit addweapon "ItemCompass";
//_unit addweapon "ItemRadio";
//_unit addweapon "ItemWatch";

// ====================================================================================

// DEFINE BACKPACK CONTENTS
// The following blocks of code define different backpack loadouts. These are then
// called from the role loadouts.

_backpack = {
	_typeofBackPack = _this select 0;
	switch (_typeofBackPack) do
	{
		// BACKPACK: MEDIC
		case "m":
		{
			_unit addBackpack _baglarge;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 4];
			(unitBackpack _unit) addItemCargoGlobal [_medkit,1];
			(unitBackpack _unit) addItemCargoGlobal [_firstaid,5];
		};

		// BACKPACK: GRENADIER (CO/DC/SL/FTL/G)
		case "g":
		{
			// BACKPACK: LIGHT
			if (f_param_backpacks == 1) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag_tr, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_glmag, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_glsmokewhite, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
			};
			// BACKPACK: HEAVY
			if (f_param_backpacks == 2) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag, 8];
				(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag_tr, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_glmag, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_glsmokewhite, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 1];
			};
		};

		// BACKPACK: AR TEAM (AR/AAR)
		case "ar":
		{
			// BACKPACK: LIGHT
			if (f_param_backpacks == 1) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_tr, 1];
			};
			// BACKPACK: HEAVY
			if (f_param_backpacks == 2) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 3];
				(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_tr, 2];
			};
		};

		// BACKPACK: RIFLEMAN (R)
		case "r":
		{
			// BACKPACK: LIGHT
			if (f_param_backpacks == 1) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 1];
			};
			// BACKPACK: HEAVY
			if (f_param_backpacks == 2) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 8];
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 2];
			};
		};

		// BACKPACK: MMG TEAM (MMGG/MMGAG)
		case "mmg":
		{
			// BACKPACK: LIGHT
			if (f_param_backpacks == 1) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr, 1];
			};
			// BACKPACK: HEAVY
			if (f_param_backpacks == 2) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 1];
				(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr, 2];
			};
		};

		// BACKPACK: MAT TEAM (MATG/MATAG)
		case "matg":
		{
			// BACKPACK: LIGHT
			if (f_param_backpacks == 1) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 1];
			};
			// BACKPACK: HEAVY
			if (f_param_backpacks == 2) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 1];
			};
		};
		case "matag":
		{
			// BACKPACK: LIGHT
			if (f_param_backpacks == 1) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 1];
			};
			// BACKPACK: HEAVY
			if (f_param_backpacks == 2) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 2];
			};
		};
		// BACKPACK: ENGINEER
		case "eng":
		{
			_unit addBackpack _baglarge;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
			(unitBackpack _unit) addMagazineCargoGlobal [_satchel, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_mine, 1];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		};

		// BACKPACK: CARABINEER (CAR/RAT)
		case "car":
		{
			// BACKPACK: LIGHT
			if (f_param_backpacks == 1) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
			};
			// BACKPACK: HEAVY
			if (f_param_backpacks == 2) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 8];
				(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
			};
		};

		// BACKPACK: SUBMACHINEGUNNER (SMG)
		case "smg":
		{
			// BACKPACK: LIGHT
			if (f_param_backpacks == 1) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_smgmag, 6];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
			};
			// BACKPACK: HEAVY
			if (f_param_backpacks == 2) then {
				_unit addBackpack _bagmedium;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_smgmag, 12];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
			};
		};

		// BACKPACK: DIVER (DIV)
		case "div":
		{
			// BACKPACK: LIGHT
			if (f_param_backpacks == 1) then {
				_unit addBackpack _bagmediumdiver;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_diverMag1, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_diverMag2, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
			};
			// BACKPACK: HEAVY
			if (f_param_backpacks == 2) then {
				_unit addBackpack _bagmediumdiver;
				clearMagazineCargoGlobal (unitBackpack _unit);
				(unitBackpack _unit) addMagazineCargoGlobal [_diverMag1, 8];
				(unitBackpack _unit) addMagazineCargoGlobal [_diverMag2, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 4];
				(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
			};
		};
	};
};

// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_typeofUnit) do
{

// ====================================================================================

// LOADOUT: COMMANDER
	case "co":
	{
		_unit addmagazines [_glriflemag,7];
		_unit addmagazines [_glriflemag_tr,3];
		_unit addmagazines [_glmag,3];
		_unit addmagazines [_glsmokewhite,3];
		_unit addweapon _glrifle;					//_COrifle
		_unit addmagazines [_pistolmag,2];
		_unit addweapon _pistol;
		_unit addmagazines [_grenade,2];
		_unit addmagazines [_smokegrenade,2];
		_unit addmagazines [_smokegrenadegreen,1];
		_unit addWeapon "Binocular";
		_unit addItem "ItemGPS";
		_unit assignItem "ItemGPS";
		["g"] call _backpack;
	};

// LOADOUT: DEPUTY COMMANDER AND SQUAD LEADER
	case "dc":
	{
		_unit addmagazines [_glriflemag,7];
		_unit addmagazines [_glriflemag_tr,3];
		_unit addmagazines [_glmag,3];
		_unit addmagazines [_glsmokewhite,3];
		_unit addweapon _glrifle;					//_DCrifle
		_unit addmagazines [_pistolmag,2];
		_unit addweapon _pistol;
		_unit addmagazines [_grenade,2];
		_unit addmagazines [_smokegrenade,2];
		_unit addmagazines [_smokegrenadegreen,1];
		_unit addWeapon "Binocular";
		_unit addItem "ItemGPS";
		_unit assignItem "ItemGPS";
		["g"] call _backpack;
	};

// LOADOUT: MEDIC
	case "m":
	{
		_unit addmagazines [_carbinemag,5];
		_unit addweapon _carbine;
		_unit addmagazines [_smokegrenade,3];
		["m"] call _backpack;
	};

// LOADOUT: FIRE TEAM LEADER
	case "ftl":
	{
		_unit addmagazines [_glriflemag,7];
		_unit addmagazines [_glriflemag_tr,2];
		_unit addmagazines [_glmag,4];
		_unit addmagazines [_glsmokewhite,4];
		_unit addweapon _glrifle;					//_FTLrifle
		_unit addmagazines [_grenade,2];
		_unit addmagazines [_smokegrenade,2];
		_unit addmagazines [_smokegrenadegreen,1];
		_unit addWeapon "Binocular";
		_unit addItem "ItemGPS";
		_unit assignItem "ItemGPS";
		["g"] call _backpack;
	};


// LOADOUT: AUTOMATIC RIFLEMAN
	case "ar":
	{
		_unit addmagazines [_ARmag,6];
		_unit addmagazines [_ARmag_tr,2];
		_unit addweapon _AR;
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_smokegrenade,1];
		_unit addmagazines [_pistolmag,4];
		_unit addweapon _pistol;
		["ar"] call _backpack;
	};

// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
	case "aar":
	{
		_unit addmagazines [_riflemag,5];
		_unit addmagazines [_riflemag_tr,2];
		_unit addweapon _rifle;
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_smokegrenade,1];
		_unit addmagazines [_riflemag,2];
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_smokegrenade,1];
		_unit addmagazines [_ARmag,3];
		["ar"] call _backpack;
	};

// LOADOUT: RIFLEMAN (AT)
	case "rat":
	{
		_unit addmagazines [_carbinemag,5];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_smokegrenade,1];
		["car"] call _backpack;
		(unitBackpack _unit) addMagazineCargoGlobal [_RATmag,1];
		_unit addweapon _RAT;
	};

// LOADOUT: MEDIUM MG GUNNER
	case "mmgg":
	{
		_unit addmagazines [_MMGmag,4];
		_unit addmagazines [_MMGmag_tr,1];
		_unit addweapon _MMG;
		_unit addmagazines [_pistolmag,4];
		_unit addweapon _pistol;
		["mmg"] call _backpack;
	};

// LOADOUT: MEDIUM MG ASSISTANT GUNNER
	case "mmgag":
	{
		_unit addmagazines [_riflemag,6];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular";
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_smokegrenade,1];
		_unit addmagazines [_riflemag,2];
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_smokegrenade,1];
		_unit addmagazines [_MMGmag,4];
		_unit addmagazines [_MMGmag_tr,3];
		["mmg"] call _backpack;
	};
// LOADOUT: MEDIUM AT GUNNER
	case "matg":
	{
		_unit addmagazines [_carbinemag,5];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		["matg"] call _backpack;
		_unit addweapon _MAT;
	};

// LOADOUT: MEDIUM AT ASSISTANT GUNNER
	case "matag":
	{
		_unit addmagazines [_carbinemag,5];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular";
		_unit addmagazines [_smokegrenade,1];
		_unit addmagazines [_riflemag,2];
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_smokegrenade,1];
		["matag"] call _backpack;
	};

// LOADOUT: MORTAR GUNNER
	case "mtrg":
	{
		_unit addmagazines [_carbinemag,5];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_smokegrenade,1];
		_unit addBackpack _MTR;
	};

// LOADOUT: MORTAR ASSISTANT GUNNER
	case "mtrag":
	{
		_unit addmagazines [_carbinemag,5];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_smokegrenade,1];
		_unit addWeapon "Binocular";
		_unit addBackpack _MTRmount;
	};
// LOADOUT: AIR VEHICLE PILOTS
	case "p":
	{
		_unit addmagazines [_smgmag,4];
		_unit addweapon _smg;
		_unit addmagazines [_smokegrenade,2];
	};

// LOADOUT: ENGINEER
	case "eng":
	{
		_unit addmagazines [_carbinemag,5];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_smokegrenade,1];
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_satchel,2];
		_unit addmagazines [_ATmine,1];
		_unit addmagazines [_APmine1,3];
		_unit addmagazines [_APmine2,3];
		["eng"] call _backpack;
	};

// LOADOUT: RIFLEMAN
	case "r":
	{
		_unit addmagazines [_riflemag,8];
		_unit addmagazines [_riflemag_tr,2];
		_unit addweapon _rifle;
		_unit addmagazines [_grenade,3];
		_unit addmagazines [_smokegrenade,3];
		["r"] call _backpack;
	};

// LOADOUT: CARABINEER
	case "car":
	{
		_unit addmagazines [_carbinemag,8];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_grenade,3];
		_unit addmagazines [_smokegrenade,3];
		["car"] call _backpack;
	};
// LOADOUT: Diver
	case "div":
	{
		_unit addmagazines [_diverMag1,5];
		_unit addmagazines [_diverMag2,4];
		_unit addweapon _diverWep;
		_unit addmagazines [_grenade,3];
		_unit addmagazines [_smokegrenade,3];
		["div"] call _backpack;
	};
// LOADOUT: SUBMACHINEGUNNER
	case "smg":
	{
		_unit addmagazines [_smgmag,8];
		_unit addweapon _smg;
		_unit addmagazines [_grenade,3];
		_unit addmagazines [_smokegrenade,3];
		["smg"] call _backpack;
	};

// LOADOUT: GRENADIER
	case "gren":
	{
		_unit addmagazines [_glriflemag,8];
		_unit addmagazines [_glriflemag_tr,3];
		_unit addweapon _glrifle;
		_unit addmagazines [_glmag,6];
		_unit addmagazines [_glsmokewhite,2];
		_unit addmagazines [_grenade,3];
		_unit addmagazines [_smokegrenade,2];
		["g"] call _backpack;
	};

// CARGO: CAR - room for 10 weapons and 50 cargo items
	case "v_car":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 2];
		_unit addMagazineCargoGlobal [_riflemag, 8];
		_unit addMagazineCargoGlobal [_glriflemag, 8];
		_unit addMagazineCargoGlobal [_carbinemag, 10];
		_unit addMagazineCargoGlobal [_armag, 5];
		_unit addMagazineCargoGlobal [_ratmag, 1];
		_unit addMagazineCargoGlobal [_grenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 4];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
	};

// CARGO: TRUCK - room for 50 weapons and 200 cargo items
	case "v_tr":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 10];
		_unit addMagazineCargoGlobal [_riflemag, 40];
		_unit addMagazineCargoGlobal [_glriflemag, 40];
		_unit addMagazineCargoGlobal [_carbinemag, 40];
		_unit addMagazineCargoGlobal [_armag, 22];
		_unit addMagazineCargoGlobal [_ratmag, 6];
		_unit addMagazineCargoGlobal [_grenade, 12];
		_unit addMagazineCargoGlobal [_smokegrenade, 12];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 4];
		_unit addMagazineCargoGlobal [_glmag, 12];
		_unit addMagazineCargoGlobal [_glsmokewhite, 12];
	};

// CARGO: IFV - room for 10 weapons and 100 cargo items
	case "v_ifv":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 4];
		_unit addMagazineCargoGlobal [_riflemag, 20];
		_unit addMagazineCargoGlobal [_glriflemag, 20];
		_unit addMagazineCargoGlobal [_carbinemag, 20];
		_unit addMagazineCargoGlobal [_armag, 8];
		_unit addMagazineCargoGlobal [_ratmag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 8];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
	};

// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
		_unit addmagazines [_riflemag,7];
		_unit addweapon _rifle;

		_unit selectweapon primaryweapon _unit;

		if (true) exitwith {player globalchat format ["DEBUG (f\common\folk_assignGear.sqf): Unit = %1. Gear template %2 does not exist, used Rifleman instead.",_unit,_typeofunit]};
   };


// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ====================================================================================

// Handle weapon attachments here.

#include "f_assignGear_attach.sqf";

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING

_unit selectweapon primaryweapon _unit;
