// F3 - Folk ARPS Assign Gear Script - NPR
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// DEFINE EQUIPMENT TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//		co			- commander
//		dc 			- deputy commander / squad leader
//		m 			- medic
//		ftl			- fire team leader
//		ar 			- automatic rifleman
//		aar			- assistant automatic rifleman
//		rat			- rifleman (AT)
//		dm			- designated marksman
//		mmgl		- medium mg team leader
//		mmgg		- medium mg gunner
//		mmgag		- medium mg assistant
//		matl		- medium AT team leader
//		matg		- medium AT gunner
//		matag		- medium AT assistant
//		hmgg		- heavy mg gunner (deployable)
//		hmgag		- heavy mg assistant (deployable)
//		hatl		- heavy AT team leader
//		hatg		- heavy AT gunner
//		hatag		- heavy AT assistant
//		mtrg		- mortar gunner (deployable)
//		mtrag		- mortar assistant (deployable)
//		msaml		- medium SAM team leader
//		msamg		- medium SAM gunner
//		msamag		- medium SAM assistant gunner
//		hsamg		- heavy SAM gunner (deployable)
//		hsamag		- heavy SAM assistant gunner (deployable)
//		sn			- sniper
//		sp			- spotter (for sniper)
//		vc			- vehicle commander
//		vg			- vehicle gunner
//		vd			- vehicle driver (repair)
//		pc			- air vehicle crew
//		jp			- jet pilot
//		eng			- engineer (demo)
//		engm		- engineer (mines)
//		uav			- UAV operator
//		div    		- divers
//
//		r 			- rifleman
//		car			- carabineer
//		smg			- submachinegunner
//		gren		- grenadier
//
//		v_car		- car/4x4
//		v_tr		- truck
//		v_ifv		- ifv
//		v_tank		- tank
//		v_helo_l	- Rotary Transport Light
//		v_helo_m	- Rotary Transport Medium
//		v_helo_h	- Rotary Transport Heavy
//		v_helo_a	- Rotary Attack
//		v_jet		- Jet
//
//		crate_small	- small ammocrate
//		crate_med	- medium ammocrate
//		crate_large	- large ammocrate
//
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

// ATTACHMENTS - PRIMARY
_attach1 = "";	// IR Laser
_attach2 = "acc_flashlight";	// Flashlight

_silencer1 = "muzzle_snds_B";	// 7.62 suppressor
_silencer2 = "muzzle_snds_M";	// 5.56 suppressor

_scope1 = "optic_ACO";			// ACO
_scope2 = "optic_MRCO";			// MRCO Scope - 1x - 6x
_scope3 = "optic_SOS";			// SOS Scope - 18x - 75x

_bipod1 = "bipod_02_F_blk";		// Default bipod
_bipod2 = "bipod_02_F_blk";		// Black bipod

// Default setup
_attachments = []; // The default attachment set for most units, overwritten in the individual unitType

// [] = remove all
// [_attach1,_scope1,_silencer] = remove all, add items assigned in _attach1, _scope1 and _silencer1
// [_scope2] = add _scope2, remove rest
// false = keep attachments as they are

// ====================================================================================

// ATTACHMENTS - HANDGUN
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor

_hg_scope1 = "optic_MRD";			// MRD

// Default setup
_hg_attachments= []; // The default attachment set for handguns, overwritten in the individual unitType

// ====================================================================================

// ATTACHMENTS - LAUNCHER
_lau_attach1 = ""; // Empty by default, could be a scope in GM or a laser pointer for Titans

_lau_attachments = []; // The default attachment set for launchers, overwritten in the individual unitType

// ====================================================================================

// WEAPON SELECTION
/*
// Standard Riflemen ( MMG Assistant Gunner, Assistant Automatic Rifleman, MAT Assistant Gunner, MTR Assistant Gunner, Rifleman)
_rifle = selectRandom ["arifle_MSBS65_black_F","arifle_MSBS65_camo_F","arifle_MSBS65_F"]; // Slight randomization, biased towards TRG
_riflemag = "30Rnd_65x39_caseless_msbs_mag";
_riflemag_tr = "30Rnd_65x39_caseless_msbs_mag_Tracer";
*/
_rifle = "arifle_AKM_F";
_riflemag = "30Rnd_762x39_Mag_F";
_riflemag_tr = "30Rnd_762x39_Mag_Tracer_F";
/*
// Standard Carabineer (MAT Gunner, MTR Gunner, Carabineer)
_carbine = selectRandom ["arifle_MSBS65_black_F","arifle_MSBS65_camo_F","arifle_MSBS65_F"]; // Slight randomization, biased towards TRG
_carbinemag = "30Rnd_65x39_caseless_msbs_mag";
_carbinemag_tr = "30Rnd_65x39_caseless_msbs_mag_Tracer";
*/
_carbine = "arifle_AK12U_F"; // Slight randomization, biased towards TRG
_carbinemag = "30Rnd_762x39_Mag_F";
_carbinemag_tr = "30Rnd_762x39_Mag_Tracer_F";

// Shotgun (Medic, Rifleman (AT))
_shotgun = "sgun_HunterShotgun_01_F"; 
_shotgunmag1 = "2Rnd_12Gauge_Pellets";
_shotgunmag2 = "2Rnd_12Gauge_Slug";

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "hgun_PDW2000_F";
_smgmag = "30Rnd_9x21_Mag";

// Diver
_diverWep = "arifle_SDAR_F";
_diverMag1 = "30Rnd_556x45_Stanag_red";
_diverMag2 = "30Rnd_556x45_Stanag_Tracer_Red";
_diverMag3 = "20Rnd_556x45_UW_mag";
/*
// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = selectRandom ["arifle_MSBS65_GL_black_F","arifle_MSBS65_GL_camo_F","arifle_MSBS65_GL_F"]; // Slight randomization, biased towards TRG
_glriflemag = "30Rnd_65x39_caseless_msbs_mag";
_glriflemag_tr = "30Rnd_65x39_caseless_msbs_mag_Tracer";
_glmag = "1Rnd_HE_Grenade_shell";
*/
_glrifle = "arifle_AK12_GL_F"; // Slight randomization, biased towards TRG
_glriflemag = "30Rnd_762x39_Mag_F";
_glriflemag_tr = "30Rnd_762x39_Mag_Tracer_F";
_glmag = "1Rnd_HE_Grenade_shell";

// Smoke for FTLs, Squad Leaders, etc
_glsmokewhite = "1Rnd_Smoke_Grenade_shell";
_glsmokegreen = "1Rnd_SmokeGreen_Grenade_shell";
_glsmokered = "1Rnd_SmokeRed_Grenade_shell";

// Flares for FTLs, Squad Leaders, etc
_glflarewhite = "UGL_FlareWhite_F";
_glflarered = "UGL_FlareRed_F";
_glflareyellow = "UGL_FlareYellow_F";
_glflaregreen = "UGL_FlareGreen_F";

// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)
_pistol = "hgun_Pistol_heavy_02_F";
_pistolmag = "6Rnd_45ACP_Cylinder";

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

// Night Vision Goggles
_nvg = "NVGoggles_OPFOR";
_nvgPilot = "Integrated_NVG_F";

// Binoculars
_binoculars = "Rangefinder";

// Laserdesignator
_laserdesignator = "Laserdesignator_03";

// UAV Terminal
//_uavterminal = "B_UavTerminal";	  // BLUFOR - FIA
  _uavterminal = "O_UavTerminal"; // OPFOR - FIA
//_uavterminal = "I_UavTerminal"; // INDP - FIA

// Chemlights
_chemgreen =  "Chemlight_green";
_chemred = "Chemlight_red";
_chemyellow =  "Chemlight_yellow";
_chemblue = "Chemlight_blue";

// Backpacks
_bag = "B_FieldPack_green_F";
_bagLarge = "B_Carryall_oli";
_bagdiver =  "B_AssaultPack_blk";		// used by divers
_baguav = "O_UAV_01_backpack_F";			// used by UAV operator
_baghmgg = "I_G_HMG_02_weapon_F";			// used by Heavy MG gunner
_baghmgag = "I_G_HMG_02_support_F";			// used by Heavy MG assistant gunner
_baghatg = "I_AssaultPack_cbr";			// used by Heavy AT gunner
_baghatag = "I_Kitbag_cbr";			// used by Heavy AT assistant gunner **
_bagmtrg = "I_Mortar_01_weapon_F";			// used by Mortar gunner
_bagmtrag = "I_Mortar_01_support_F";		// used by Mortar assistant gunner
_baghsamg = "I_AA_01_weapon_F";			// used by Heavy SAM gunner
_baghsamag = "I_HMG_01_support_F";			// used by Heavy SAM assistant gunner **
_bagRadio = "B_RadioBag_01_black_F";			// cosmetic, used by COs, DCs, and anybody who might possibly use CC in session.

// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT
/*
// Automatic Rifleman
_AR = "LMG_Mk200_black_F";
_ARmag = "200Rnd_65x39_cased_Box";
_ARmag_tr = "200Rnd_65x39_cased_Box_Tracer";
*/
_AR = "arifle_AKM_F";
_ARmag = "75Rnd_762x39_Mag_F";
_ARmag_tr = "75Rnd_762x39_Mag_Tracer_F";

// Medium MG
_MMG = "LMG_Zafir_F";
_MMGmag = "150Rnd_762x54_Box";
_MMGmag_tr = "150Rnd_762x54_Box_Tracer";

// NON-DLC ALTERNATIVE:
// _MMG = "MMG_02_camo_F";
// _MMGmag = "150Rnd_762x54_Box";
// _MMGmag_tr = "150Rnd_762x54_Box"_Tracer";

// Marksman rifle
_DMrifle = "srifle_DMR_06_hunter_F";
_DMriflemag = "10Rnd_Mk14_762x51_Mag";
_DMriflemag_tr = "10Rnd_Mk14_762x51_Mag";

// Rifleman AT
_RAT = "launch_RPG32_green_F";
_RATmag1 = "RPG32_F";
_RATmag2 = "RPG32_HE_F";

// Medium AT
_MAT = "launch_RPG32_green_F";
_MATmag1 = "RPG32_F";
_MATmag2 = "RPG32_HE_F";

// Surface Air
_SAM = "launch_Titan_F";
_SAMmag = "Titan_AA";

// Heavy AT
_HAT = "launch_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Sniper
_SNrifle = "srifle_LRR_F";
_SNrifleMag = "7Rnd_408_Mag";

// Engineer items
_ATmine = "ATMine_Range_Mag";
_satchel = "SatchelCharge_Remote_Mag";
_democharge = "DemoCharge_Remote_Mag";
_APmine1 = "APERSBoundingMine_Range_Mag";
_APmine2 = "APERSMine_Range_Mag";

// ====================================================================================

// CLOTHES AND UNIFORMS

// Define classes. This defines which gear class gets which uniform
// "medium" vests are used for all classes if they are not assigned a specific uniform

_diver = ["div"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = [];
_jet = ["jp"];
_vip = [];

// Basic clothing
// The outfit-piece is randomly selected from the array for each unit

_baseUniform = ["U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_black_F","U_I_L_Uniform_01_camo_F","U_I_L_Uniform_01_deserter_F","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_Guerilla3_2","U_BG_Guerrilla_6_1","U_C_E_LooterJacket_01_F"];
//_baseHelmet = ["H_Shemag_olive","H_Bandanna_khk","H_Cap_oli","H_Cap_blk","H_Watchcap_blk","H_Watchcap_camo","H_Bandanna_camo"];
//_baseGlasses = ["G_Bandanna_blk","G_Bandanna_oli"];
_baseHelmet = [""];
_baseGlasses = ["G_Balaclava_oli","G_Balaclava_blk"];

// Vests
_lightRig = ["V_TacVest_camo","V_I_G_resistanceLeader_F","V_TacVest_oli"];
_standardRig = ["V_TacVest_camo","V_I_G_resistanceLeader_F","V_TacVest_oli"];

// Diver
_diverUniform =  ["U_B_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherB"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["U_C_WorkerCoveralls"];
_pilotHelmet = _baseHelmet;
_pilotRig = ["V_BandollierB_cbr"];
_pilotGlasses = [];

// Jet Pilot
_jetUniform = ["U_B_PilotCoveralls"];
_jetHelmet = ["H_PilotHelmetFighter_B"];
_jetRig = [];
_jetGlasses = [];

// Crewman
_crewUniform = _baseUniform;
_crewHelmet = _baseHelmet;
_crewRig = ["V_BandollierB_cbr"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_R_Gorka_01_camo_F"];	//DLC alternatives: ["U_B_FullGhillie_lsh","U_B_FullGhillie_ard","U_B_FullGhillie_sard"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// Spec Op (CTRG)
_sfuniform = ["U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3"];
_sfhelmet = _baseHelmet;
_sfRig = ["V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG"];
_sfGlasses = [];

// VIP/Officer
_vipUniform = ["U_O_R_Gorka_01_black_F"];
_vipHelmet = ["H_Beret_blk"];
_vipRig = ["V_TacVest_blk"];
_vipGlasses = ["G_Balaclava_blk"];

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

// SELECT LOADOUT
// Pick the appropriate loadout depending on the parameter

_loadout = f_param_loadouts;

// Light Loadout
if (_loadout == 0) then {
	#include "f_assignGear_npr_light.sqf"
};

// Standard Loadout
if (_loadout == 1) then {
	#include "f_assignGear_npr_standard.sqf"
};

// ====================================================================================
