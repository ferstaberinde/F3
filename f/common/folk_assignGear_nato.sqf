// F3 - Folk Assign Gear Script - NATO
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
//		mmgg	- medium mg gunner
//		mmgag	- medium mg assistant
//		matg	- medium AT gunner
//		matag	- medium AT assistant
//		mtrg	- mortar gunner (deployable)
//		mtrag	- mortar assistant (deployable)
//		p		- air vehicle pilots
//		eng		- engineers
// 		div		- divers
//
//		r 		- rifleman
//		car		- carabineer
//		smg		- submachinegunner
//		gren	- grenadier
//
//		v_car	- car/4x4
//		v_tr	- truck
//		v_ifv	- ifv
//
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

// Attachments 
// nil = no change
// [] = remove all
// ["acc_pointer_IR","optic_ACO_grn"] = remove all, add items.

// Standard Riflemen ( MMG Assistant Gunner, Assistant Automatic Rifleman, MAT Assistant Gunner, MTR Assistant Gunner, Rifleman)
_rifle = "arifle_MX_ACO_point_grip_F"; _riflemag = "30Rnd_65x39_caseless_mag";			_riflemag_tr = "30Rnd_65x39_caseless_mag_Tracer";																					
_rifle_attach = ["acc_pointer_IR","optic_Aco"];



// Standard Carabineer (Medic, Rifleman (AT), MAT Gunner, MTR Gunner, Carabineer)
_carbine = "arifle_MXC_ACO_point_grip_F"; _carbinemag = "30Rnd_65x39_caseless_mag"; _carbinemag_tr = "30Rnd_65x39_caseless_mag_Tracer";																				
_carbine_attach = ["acc_pointer_IR","optic_Aco"];


// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "arifle_SDAR_F"; _smgmag = "30Rnd_556x45_Stanag"; _smgmag_tr = "30Rnd_556x45_Stanag";																									
_smg_attach = nil;

// Diver
_diverWep = "arifle_SDAR_F"; _diverMag1 = "30Rnd_556x45_Stanag"; _diverMag2 = "20Rnd_556x45_UW_mag";
_diverWep_attach = nil;


// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = "arifle_MX_GL_ACOg_point_F"; _glriflemag = "30Rnd_65x39_caseless_mag";_glriflemag_tr = "30Rnd_65x39_caseless_mag_Tracer" ; _glmag = "1Rnd_HE_Grenade_shell";														
_glrifle_attach = ["acc_pointer_IR","optic_Aco"];


// Smoke for FTLs, Squad Leaders, etc 
_glsmokewhite = "1Rnd_Smoke_Grenade_shell"; _glsmokegreen = "1Rnd_SmokeGreen_Grenade_shell"; _glsmokered = "1Rnd_SmokeRed_Grenade_shell";    							


// Flares for FTLs, Squad Leaders, etc
_glflarewhite = "3Rnd_UGL_FlareWhite_F"; _glflarered = "3Rnd_UGL_FlareRed_F"; _glflareyellow = "3Rnd_UGL_FlareYellow_F"; _glflaregreen = "3Rnd_UGL_FlareGreen_F";	


// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)
_pistol = "hgun_P07_F"; _pistolmag = "16Rnd_9x21_Mag";																								


// Grenades
_grenade = "HandGrenade"; _smokegrenade = "SmokeShell";_smokegrenadegreen = "SmokeShellGreen";	


// misc medical items.	
_firstaid = "FirstAidKit";
_medkit = "Medikit";


// Backpacks
_bagmedium = "B_AssaultPack_khk";  // used by none		
_baglarge =  "B_Kitbag_mcamo"; 	   // used by medic,engineers

// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT


// Automatic Rifleman
_AR = "arifle_MX_SW_F"; _ARmag = "100Rnd_65x39_caseless_mag";_ARmag_tr = "100Rnd_65x39_caseless_mag_Tracer";																							
_AR_attach = ["acc_pointer_IR","optic_ACO"];


// Medium MG
_MMG = "LMG_Mk200_ACO_grip_F"; _MMGmag = "200Rnd_65x39_cased_Box";	_MMGmag_tr = "200Rnd_65x39_cased_Box_Tracer";																								
_MMG_attach = ["acc_pointer_IR","optic_ACO"];


// Rifleman AT
_RAT = "launch_NLAW_F"; _RATmag = "NLAW_F";																											


// Mortar
_MTR = "B_Mk6Mortar_Wpn";
_MTRmount = "B_Mk6Mortar_Support";


// Medium AT
_MAT = "launch_NLAW_F"; _MATmag1 = "NLAW_F"; _MATmag2 = "NLAW_F";																			


																					
// Engineer items.
_ATmine = "ATMine_Range_Mag"; _satchel = "DemoCharge_Remote_Mag";																										
_APmine1 = "APERSTripMine_Wire_Mag"; _APmine2 = "ClaymoreDirectionalMine_Remote_Mag";
// ====================================================================================

// CLOTHES AND UNITFORMS

//Base
_baseUniform = "U_B_CombatUniform_mcam";
_baseHelmet = "H_HelmetB";
_lightRig = "V_PlateCarrier1_rgr"; // co,dc,ftl,medic,rat,matag,mmgag
_heavyRig = "V_PlateCarrierGL_rgr"; // ar,eng


// Diver
_diverUniform =  "U_B_Wetsuit";
_diverHelmet = "";
_diverRig = "V_RebreatherIR";


// Pilot
_pilotUniform = "U_B_HeliPilotCoveralls";
_pilotHelmet = "H_PilotHelmetHeli_B";
_pilotRig = "V_TacVest_khk";


// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;							// expecting name of unit; originally passed by using 'this' in unit init


// ====================================================================================

// handle clothes and helmets and such here.
#include "f_assignGear_clothes.sqf";

// ====================================================================================

// PREPARE UNIT FOR GEAR ADDITION
// The following code removes all existing weapons and backpacks

removeBackpack _unit;
removeallweapons _unit;
// REMOVE THEM

_unit addItem _firstaid;

// Adding more NVgoogles can now cause immense issues :D
if("NVGoggles" in (assignedItems player)) then
{
_unit unassignItem "NVGoggles";
_unit removeItem "NVGoggles";
};

_unit addItem "NVGoggles";
_unit assignItem "NVGoggles";					// add universal NVG for this faction

//removeAllItems _unit;						// remove default items: map, compass, watch, radio (and GPS for team/squad leaders)
//unit addItem "ItemGPS"; // add gps to this fcation
//_unit assignItem "ItemGPS";		
//_unit addweapon "ItemMap";				// etc
//_unit addweapon "ItemCompass";
//_unit addweapon "ItemRadio";
//_unit addweapon "ItemWatch";

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
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_COriflemag
		{_unit addmagazine _glriflemag_tr} foreach [1,2,3];	//_COriflemag
		{_unit addmagazine _glmag} foreach [1,2,3];
		{_unit addmagazine _glsmokewhite} foreach [1,2,3];
		_unit addweapon _glrifle;									//_COrifle
		{_unit addmagazine _pistolmag} foreach [1,2];
		_unit addweapon _pistol;		
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1];
		_unit addWeapon "Binocular";
		_unit addItem "ItemGPS";
		_unit assignItem "ItemGPS";		
	};
  
// LOADOUT: DEPUTY COMMANDER AND SQUAD LEADER
	case "dc":
	{
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_DCriflemag
		{_unit addmagazine _glriflemag_tr} foreach [1,2,3];
		{_unit addmagazine _glmag} foreach [1,2,3];
		{_unit addmagazine _glsmokewhite} foreach [1,2,3];
		_unit addweapon _glrifle;									//_DCrifle
		{_unit addmagazine _pistolmag} foreach [1,2];
		_unit addweapon _pistol;		
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1];
		_unit addWeapon "Binocular";
		_unit addItem "ItemGPS";
		_unit assignItem "ItemGPS";	
	};  
// LOADOUT: MEDIC
	case "m":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];	
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1,2,3];	
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 4];
		(unitBackpack _unit) addItemCargoGlobal [_medkit,1];
		(unitBackpack _unit) addItemCargoGlobal [_firstaid,5];
		
	};

// LOADOUT: FIRE TEAM LEADER
	case "ftl":
	{
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_FTLriflemag
		{_unit addmagazine _glriflemag_tr} foreach [1,2];
		{_unit addmagazine _glmag} foreach [1,2,3,4];
		{_unit addmagazine _glsmokewhite} foreach [1,2,3,4];
		_unit addweapon _glrifle;									//_FTLrifle		
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1];
		_unit addWeapon "Binocular";
		_unit addItem "ItemGPS";
		_unit assignItem "ItemGPS";	
	};		


// LOADOUT: AUTOMATIC RIFLEMAN
	case "ar":
	{
		{_unit addmagazine _ARmag} foreach [1,2,3,4,5,6];
		{_unit addmagazine _ARmag_tr} foreach [1,2];
		_unit addweapon _AR;
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
		{_unit addmagazine _pistolmag} foreach [1,2,3,4];
		_unit addweapon _pistol;
	};	
	
// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
	case "aar":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
		{_unit addmagazine _riflemag_tr} foreach [1,2];
		_unit addweapon _rifle;		
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
		{_unit addmagazine _riflemag} foreach [1,2];
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
		{_unit addmagazine _ARmag;} foreach [1,2,3];
	};				
	
// LOADOUT: RIFLEMAN (AT)	
	case "rat":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		{_unit addmagazine _carbinemag_tr} foreach [1,2];
		_unit addweapon _carbine;
		// No launcher for you!
	//	{_unit addmagazine _RATmag} foreach [1];
		{_unit addmagazine _smokegrenade} foreach [1];		
	//	_unit addweapon _RAT;
	};		
		
	
	
// LOADOUT: MEDIUM MG GUNNER	
	case "mmgg":
	{
		{_unit addmagazine _MMGmag} foreach [1,2,3,4];
		{_unit addmagazine _MMGmag_tr} foreach [1];
		_unit addweapon _MMG;		
		{_unit addmagazine _pistolmag} foreach [1,2,3,4];
		_unit addweapon _pistol;
	};			

// LOADOUT: MEDIUM MG ASSISTANT GUNNER	
	case "mmgag":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular";
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
		{_unit addmagazine _riflemag} foreach [1,2];
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
		{_unit addmagazine _MMGmag} foreach [1,2,3,4];
		{_unit addmagazine _MMGmag_tr;} foreach [1,2,3];
	};	
// LOADOUT: MEDIUM AT GUNNER
	case "matg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		{_unit addmagazine _carbinemag_tr} foreach [1,2];
		_unit addweapon _carbine;
		{_unit addmagazine _MATmag1} foreach [1,2];
		{_unit addmagazine _MATmag2} foreach [1];
		_unit addweapon _MAT;			
	};	
	
// LOADOUT: MEDIUM AT ASSISTANT GUNNER	
	case "matag":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
		{_unit addmagazine _riflemag_tr} foreach [1,2];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular";
		{_unit addmagazine _smokegrenade;} foreach [1];		
		{_unit addmagazine _riflemag} foreach [1,2];
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
		{_unit addmagazine _MATmag1;} foreach [1,2];
		{_unit addmagazine _MATmag2;} foreach [1,2];
	};	
		
// LOADOUT: MORTAR GUNNER
	case "mtrg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		{_unit addmagazine _carbinemag_tr} foreach [1,2];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1];	
		_unit addBackpack _MTR;
	};	
	
// LOADOUT: MORTAR ASSISTANT GUNNER
	case "mtrag":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		{_unit addmagazine _carbinemag_tr} foreach [1,2];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1];	
		_unit addWeapon "Binocular";
		_unit addBackpack _MTRmount;
	};			
// LOADOUT: AIR VEHICLE PILOTS
	case "p":
	{
		{_unit addmagazine _smgmag} foreach [1,2,3,4];
		_unit addweapon _smg;
		{_unit addmagazine _smokegrenade} foreach [1,2];					
	};		
	
// LOADOUT: ENGINEER
	case "eng":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		{_unit addmagazine _carbinemag_tr} foreach [1,2];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade} foreach [1];
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _satchel} foreach [1,2];
		{_unit addmagazine _ATmine} foreach [1];
		{_unit addmagazine _APmine1} foreach [1,2,3];
		{_unit addmagazine _APmine2} foreach [1,2,3];
		// Backpack
		_unit addBackpack _baglarge;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addMagazineCargoGlobal [_satchel, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mine, 1];	
	};	
		
// LOADOUT: RIFLEMAN
	case "r":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7,8];
		{_unit addmagazine _riflemag_tr} foreach [1,2];
		_unit addweapon _rifle;
		{_unit addmagazine _grenade} foreach [1,2,3];
		{_unit addmagazine _smokegrenade;} foreach [1,2,3];
	};

// LOADOUT: CARABINEER
	case "car":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6,7,8];
		{_unit addmagazine _carbinemag_tr} foreach [1,2];
		_unit addweapon _carbine;
		{_unit addmagazine _grenade} foreach [1,2,3];
		{_unit addmagazine _smokegrenade;} foreach [1,2,3];
	};
// LOADOUT: Diver
	case "div":
	{
		{_unit addmagazine _diverMag1} foreach [1,2,3,4,5];
		{_unit addmagazine _diverMag2} foreach [1,2,3,4];
		_unit addweapon _diverWep;
		{_unit addmagazine _grenade} foreach [1,2,3];
		{_unit addmagazine _smokegrenade;} foreach [1,2,3];
	};
// LOADOUT: SUBMACHINEGUNNER
	case "smg":
	{
		{_unit addmagazine _smgmag} foreach [1,2,3,4,5,6,7,8];
		_unit addweapon _smg;
		{_unit addmagazine _grenade} foreach [1,2,3];
		{_unit addmagazine _smokegrenade;} foreach [1,2,3];
	};

// LOADOUT: GRENADIER
	case "gren":
	{
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7,8];
				{_unit addmagazine _glriflemag_tr} foreach [1,2,3];
		_unit addweapon _glrifle;
		{_unit addmagazine _glmag} foreach [1,2,3,4,5,6];
		{_unit addmagazine _glsmokewhite} foreach [1,2];
		{_unit addmagazine _grenade} foreach [1,2,3];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
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
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7];
		_unit addweapon _rifle;
		
		_unit selectweapon primaryweapon _unit;
				
		if (true) exitwith {player globalchat format ["DEBUG (f\common\folk_assignGear.sqf): Unit = %1. Gear template %2 does not exist, used Rifleman instead.",_unit,_typeofunit]};
   };


// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// Handle weapon attachments here..
// ====================================================================================
#include "f_assignGear_attach.sqf";



// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING
_unit selectweapon primaryweapon _unit;
