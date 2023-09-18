// F3 - Folk ARPS Assign Gear Script - LDF
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// DEFINE EQUIPMENT TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//		co			- commander
//		dc 			- deputy commander / squad leader
//		m 			- medic
//		cls			- combat life saver
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
//		lvc			- light vehicle crew
//		lvd			- light vehicle driver (repair)
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
_attach1 = "acc_pointer_IR";	// IR Laser
_attach2 = "acc_flashlight";	// Flashlight

_silencer1 = "muzzle_snds_M";	// 5.56 suppressor
_silencer2 = "muzzle_snds_H";	// 6.5 suppressor

_scope1 = "optic_ACO";		// ACO
_scope2 = "optic_ico_01_f";			// Promet ISR scope
_scope3 = "optic_SOS";			// SOS Scope - 18x - 75x

_bipod1 = "bipod_01_F_blk";		// Default bipod
_bipod2 = "bipod_01_F_khk";		// Green bipod

// Default setup
_attachments = [_scope1]; // The default attachment set for most units, overwritten in the individual unitType

// [] = remove all
// [_attach1,_scope1,_silencer] = remove all, add items assigned in _attach1, _scope1 and _silencer1
// [_scope2] = add _scope2, remove rest
// false = keep attachments as they are

// ====================================================================================

// ATTACHMENTS - HANDGUN
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor

_hg_scope1 = "optic_MRD_black";			// MRD

// Default setup
_hg_attachments= []; // The default attachment set for handguns, overwritten in the individual unitType

// ====================================================================================

// ATTACHMENTS - LAUNCHER
_lau_attach1 = ""; // Empty by default, could be a scope in GM or a laser pointer for Titans

_lau_attachments = []; // The default attachment set for launchers, overwritten in the individual unitType

// ====================================================================================


// WEAPON SELECTION

// Standard Riflemen ( MMG Assistant Gunner, Assistant Automatic Rifleman, MAT Assistant Gunner, MTR Assistant Gunner, Rifleman)
_rifle = "arifle_MSBS65_F";
_riflemag = "30Rnd_65x39_caseless_msbs_mag";
_riflemag_tr = "30Rnd_65x39_caseless_msbs_mag_Tracer";

// Standard Carabineer (Medic, Rifleman (AT), MAT Gunner, MTR Gunner, Carabineer)
_carbine = "arifle_MSBS65_F";
_carbinemag = "30Rnd_65x39_caseless_msbs_mag";
_carbinemag_tr = "30Rnd_65x39_caseless_msbs_mag_Tracer";

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "SMG_03C_black";
_smgmag = "50Rnd_570x28_SMG_03";

// Diver
_diverWep = "arifle_SDAR_F";
_diverMag1 = "30Rnd_556x45_Stanag_red";
_diverMag2 = "30Rnd_556x45_Stanag_Tracer_Red";
_diverMag3 = "20Rnd_556x45_UW_mag";

// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = "arifle_MSBS65_GL_F";
_glriflemag = "30Rnd_65x39_caseless_msbs_mag";
_glriflemag_tr = "30Rnd_65x39_caseless_msbs_mag_Tracer";
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
_pistol = "hgun_Pistol_heavy_01_green_F";
_pistolmag = "11Rnd_45ACP_Mag";

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
_nvg = "NVGoggles_INDEP";
_nvgPilot = "NVGoggles_INDEP"; // Integrated_NVG_F for fullscreen NV

// Binoculars
_binoculars = "Rangefinder";

// Laserdesignator
_laserdesignator = "Laserdesignator_03";

// UAV Terminal
_uavterminal = "I_E_UavTerminal";

// Chemlights
_chemgreen =  "Chemlight_green";
_chemred = "Chemlight_red";
_chemyellow =  "Chemlight_yellow";
_chemblue = "Chemlight_blue";

// Backpacks
_bag = "B_AssaultPack_eaf_F";			// The standard bag for most classes
_bagLarge = "B_Carryall_eaf_F";				// Larger bag for some special purpose classes
_bagdiver =  "B_AssaultPack_blk";		// used by divers
_baguav = "I_E_UAV_01_backpack_F";			// used by UAV operator
_baghmgg = "I_E_HMG_02_weapon_F";				// used by Heavy MG gunner
_baghmgag = "I_E_HMG_02_support_F";			// used by Heavy MG assistant gunner
_baghatg = "I_E_AT_01_weapon_F";				// used by Heavy AT gunner
_baghatag = "I_E_HMG_01_support_F";			// used by Heavy AT assistant gunner
_bagmtrg = "I_E_Mortar_01_weapon_F";			// used by Mortar gunner
_bagmtrag = "I_E_Mortar_01_support_F";		// used by Mortar assistant gunner
_baghsamg = "I_E_AA_01_weapon_F";				// used by Heavy SAM gunner
_baghsamag = "I_E_HMG_01_support_F";			// used by Heavy SAM assistant gunner
_bagRadio = "B_RadioBag_01_eaf_F";			// cosmetic, used by COs, DCs, and anybody who might possibly use CC in session.

// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

// Automatic Rifleman
_AR = "LMG_Mk200_black_F";
_ARmag = "200Rnd_65x39_cased_Box_Red";
_ARmag_tr = "200Rnd_65x39_cased_Box_Tracer_Red";

// Medium MG
_MMG = "MMG_02_black_F";
_MMGmag = "130Rnd_338_Mag";
_MMGmag_tr = "130Rnd_338_Mag";

// Marksman rifle
_DMrifle = "arifle_MSBS65_Mark_F";
_DMriflemag = "30Rnd_65x39_caseless_msbs_mag";
_DMriflemag_tr = "30Rnd_65x39_caseless_msbs_mag_Tracer";

// Rifleman AT
_RAT = "launch_MRAWS_green_rail_F";
_RATmag1 = "MRAWS_HEAT55_F";
_RATmag2 = "MRAWS_HE_F";

// Medium AT
_MAT = "launch_MRAWS_green_rail_F";
_MATmag1 = "MRAWS_HEAT_F";
_MATmag2 = "MRAWS_HE_F";

// Surface Air
_SAM = "launch_I_Titan_eaf_F";
_SAMmag = "Titan_AA";

// Heavy AT
_HAT = "launch_I_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Sniper
_SNrifle = "srifle_GM6_F";
_SNrifleMag = "5Rnd_127x108_Mag";

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

_baseUniform = ["U_I_E_Uniform_01_F","U_I_E_Uniform_01_shortsleeve_F","U_I_E_Uniform_01_tanktop_F"];
_baseHelmet = ["H_HelmetHBK_headset_F","H_HelmetHBK_F","H_HelmetHBK_ear_F","H_HelmetHBK_headset_F"]; //50% chance of the best looking helmet.
_baseGlasses = [];

// Vests
_lightRig = ["V_CarrierRigKBT_01_light_EAF_F"];
_standardRig = ["V_CarrierRigKBT_01_light_EAF_F"];

// Diver
_diverUniform =  ["U_B_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherIA"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["U_I_E_Uniform_01_coveralls_F"];
_pilotHelmet = ["H_PilotHelmetHeli_I_E"];
_pilotRig = ["V_TacVest_oli"];
_pilotGlasses = [];

// Jet Pilot
_jetUniform = ["U_I_E_Uniform_01_coveralls_F"];
_jetHelmet = ["H_PilotHelmetFighter_I"];
_jetRig = [];
_jetGlasses = [];

// Crewman
_crewUniform = ["U_I_E_Uniform_01_F"];
_crewHelmet = ["H_Tank_eaf_F"];
_crewRig = ["V_TacVest_oli"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_T_Sniper_F"];	//DLC alternatives: ["U_I_FullGhillie_lsh","U_I_FullGhillie_ard","U_I_FullGhillie_sard"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// Spec Op - no nice stuff for AAF
_sfuniform = _baseUniform;
_sfhelmet = _baseHelmet;
_sfRig = _standardRig;
_sfGlasses = [];

// VIP/Officer
_vipUniform = ["U_I_E_Uniform_01_officer_F"];
_vipHelmet = ["H_Beret_EAF_01_F"];
_vipRig = ["V_TacVest_oli"];
_vipGlasses = [];

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
// To use an alternate loadout parameter, you must uncomment this block, uncomment the relevant block in description.ext, and add an assignGear loadout file as named below.

// _loadout = f_param_loadouts;

// Light Loadout
// if (_loadout == 0) then {
//	#include "f_assignGear_ldf_light.sqf"
// };

// Standard Loadout
// if (_loadout == 1) then {
	#include "f_assignGear_ldf_standard.sqf";
// };

// ====================================================================================
