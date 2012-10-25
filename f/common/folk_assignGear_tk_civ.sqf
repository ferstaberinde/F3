// F2 - Folk Assign Gear Script - TK Civilian Equipment
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
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
//		samg	- surface to air missile gunner
//		samag	- surface to air missile assistant
//		mmgg	- medium mg gunner
//		mmgag	- medium mg assistant
//		hmgg	- heavy mg gunner (deployable)
//		hmgag	- heavy mg assistant (deployable)
//		matg	- medium AT gunner
//		matag	- medium AT assistant
//		hatg	- heavy AT gunner
//		hatg	- heavy AT assistant
//		mtrg	- mortar gunner (deployable)
//		mtrag	- mortar assistant (deployable)
//		sn		- sniper
//		sp		- spotter
//		c		- ground vehicle crew
//		p		- air vehicle pilots
//		eng		- engineers
//
//		r 		- rifleman
//		car		- carabineer
//		smg		- submachinegunner

// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

_rifle = "AKS_74"; _riflemag = "30Rnd_545x39_AK";																							// Standard Riflemen (Spotter, HMG Assistant Gunner, MMG Assistant Gunner, Assistant Automatic Rifleman, MAT Assistant Gunner, HAT Assistant Gunner, MTR Assistant Gunner, Rifleman)

_carbine = "AKS_74_U"; _carbinemag = "30Rnd_545x39_AK"; 																					// Standard Carabineer (Medic, HMG Gunner, Rifleman (AT), Rifleman (AA), MAT Gunner, HAT Gunner, MTR Gunner, Carabineer)

_smg = "bizon"; _smgmag = "64Rnd_9x19_Bizon";																								// Standard Submachine Gun/Personal Defence Weapon (Vehicle Crew, Aircraft Pilot, Submachinegunner)

_glrifle = "AK_74_GL_kobra"; _glriflemag = "30Rnd_545x39_AK"; _glmag = "1Rnd_HE_GP25";														// Rifle with GL and HE grenades (CO, DC, FTLs)
_glsmokewhite = "1Rnd_Smoke_GP25"; _glsmokegreen = "1Rnd_SmokeGreen_GP25"; _glsmokered = "1Rnd_SmokeRed_GP25";    							// Smoke for FTLs, Squad Leaders, etc 
_glflarewhite = "FlareWhite_GP25"; _glflarered = "FlareRed_GP25"; _glflareyellow = "FlareYellow_GP25"; _glflaregreen = "FlareGreen_GP25";	// Flares for FTLs, Squad Leaders, etc

_pistol = "Makarov"; _pistolmag = "8Rnd_9x18_Makarov";																						// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)

_grenade = "HandGrenade_East"; _smokegrenade = "SmokeShell";_smokegrenadegreen = "SmokeShellGreen";																				// Grenades

_bagmedium = "TK_Assault_Pack_EP1";		// 8+ slots																							// Backpack for assistant gunners (AAR, AMMG, AMAT, AHAT), so that they don't have to drop ammo themselves
_baglarge =  "TK_ALICE_Pack_EP1"; 		// 12+ slots
		//  6 Slots: "CZ_Vestpouch_EP1"
		//  8 Slots: "US_Assault_Pack_EP1", "US_Patrol_Pack_EP1", "TK_Assault_Pack_EP1", "TK_RPG_Backpack_EP1"
		// 12 Slots: "US_Backpack_EP1", "TK_ALICE_Pack_EP1",
		// 13 Slots: "BAF_AssaultPack_RifleAmmo"
		// 14 Slots: "DE_Backpack_Specops_EP1", "CZ_Backpack_EP1"

// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

_AR = "RPK_74"; _ARmag = "75Rnd_545x39_RPK";																								// Automatic Rifleman

_MMG = "PK"; _MMGmag = "100Rnd_762x54_PK";																									// Medium MG

_HMG = "DSHkM_Mini_TriPod_TK_INS_Bag_EP1";																									// Heavy MG (note: HMG is an assembled weapon, gunner carries weapon)
_HMGmount = "Tripod_Bag";																													// Assistant Heavy MG (note: HMG is an assembled weapon, assistant carries bipod/tripd)

_RAT = "RPG7V"; _RATmag = "PG7V";																											// Rifleman AT

_MAT = "RPG7V"; _MATmag1 = "PG7V"; _MATmag2 = "PG7VR";																						// Medium AT

_HAT = "MetisLauncher"; _HATmag1 = "AT13"; _HATmag2 = "AT13";																				// Heavy AT Gunner

_MTR = "2b14_82mm_TK_Bag_EP1";																												// Mortar Gunner (note: Mortar is an assembled weapon, gunner carries weapon)
_MTRmount = "Tripod_Bag";																													// Mortar Assistant Gunner (note: Mortar is an assembled weapon, assistant carries bipod/tripd)

_RAA = "Strela"; _RAAmag = "Strela";																										// Rifleman AA (anti-air)

_SNrifle = "SVD"; _SNriflemag = "10Rnd_762x54_SVD";																							// Sniper

_mine = "Mine"; _satchel = "pipebomb";																										// Engineer

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;							// expecting name of unit; originally passed by using 'this' in unit init

// ====================================================================================

// PREPARE UNIT FOR GEAR ADDITION
// The following code removes all existing weapons and backpacks

removeBackpack _unit;
removeallweapons _unit;
_unit addweapon "NVGoggles"; 					// add universal NVG for this faction

//removeAllItems _unit;						// remove default items: map, compass, watch, radio (and GPS for team/squad leaders)
////_unit addweapon "ItemGPS";					// add universal GPS for this faction (nb: misc items not cleared
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
		{_unit addmagazine _glmag} foreach [1,2,3];
		{_unit addmagazine _glsmokewhite} foreach [1,2,3];
		_unit addweapon _glrifle;									//_COrifle
		{_unit addmagazine _pistolmag} foreach [1,2];
		_unit addweapon _pistol;		
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1]
		_unit addweapon "Binocular";
		_unit addweapon "ItemGPS";
		if (_useBackpacks==1) then {
			_unit addBackpack _bagmedium;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag, 6];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];	
			(unitBackpack _unit) addMagazineCargoGlobal [_glmag, 1];
		};
	};
  
// LOADOUT: DEPUTY COMMANDER
	case "dc":
	{
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_DCriflemag
		{_unit addmagazine _glmag} foreach [1,2,3];
		{_unit addmagazine _glsmokewhite} foreach [1,2,3];
		_unit addweapon _glrifle;									//_DCrifle
		{_unit addmagazine _pistolmag} foreach [1,2];
		_unit addweapon _pistol;		
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1]
		_unit addweapon "Binocular";
		_unit addweapon "ItemGPS";
		if (_useBackpacks==1) then {
			_unit addBackpack _bagmedium;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag, 6];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];	
			(unitBackpack _unit) addMagazineCargoGlobal [_glmag, 1];
		};
	}; 

// LOADOUT: MEDIC
	case "m":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6,7];	
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade;} foreach [1,2,3,4];		
	};

// LOADOUT: FIRE TEAM LEADER
	case "ftl":
	{
		{_unit addmagazine _glriflemag} foreach [1,2,3,4,5,6,7];	//_FTLriflemag
		{_unit addmagazine _glmag} foreach [1,2,3,4];
		{_unit addmagazine _glsmokewhite} foreach [1,2,3,4];
		_unit addweapon _glrifle;									//_FTLrifle		
		{_unit addmagazine _grenade} foreach [1,2];
		{_unit addmagazine _smokegrenade;} foreach [1,2];
		{_unit addmagazine _smokegrenadegreen;} foreach [1]
		_unit addweapon "Binocular";
		_unit addweapon "ItemGPS";
		if (_useBackpacks==1) then {
			_unit addBackpack _bagmedium;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag, 6];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];	
			(unitBackpack _unit) addMagazineCargoGlobal [_glmag, 1];
		};
	};	
	

// LOADOUT: AUTOMATIC RIFLEMAN
	case "ar":
	{
		{_unit addmagazine _ARmag} foreach [1,2,3,4];
		_unit addweapon _AR;		
		{_unit addmagazine _pistolmag} foreach [1,2];
		_unit addweapon _pistol;
	};	
	
// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
	case "aar":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
		_unit addweapon _rifle;		
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _smokegrenade;} foreach [1];
			// Put ammo in backpack. If not OA unit, then should add directly to inv of unit instead.
		if (_useBackpacks==1) then {
			{_unit addmagazine _riflemag} foreach [1,2];
			{_unit addmagazine _grenade} foreach [1];
			{_unit addmagazine _smokegrenade;} foreach [1];
			_unit addBackpack _baglarge;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_RATmag, 1];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		} else {
			{_unit addmagazine _ARmag} foreach [1,2];
		};
	};						
	
// LOADOUT: RIFLEMAN (AT)	
	case "rat":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6];
		_unit addweapon _carbine;
		{_unit addmagazine _RATmag} foreach [1];				
		_unit addweapon _RAT;
	};		
	
// LOADOUT: SURFACE TO AIR MISSILE GUNNER 
	case "samg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5,6];
		_unit addweapon _carbine;
		{_unit addmagazine _RAAmag} foreach [1];				
		_unit addweapon _RAA;
	};			
	
// LOADOUT: ASSISTANT SURFACE TO AIR MISSILE GUNNER
	case "samag":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6];
		_unit addweapon _rifle;
			// Put ammo in backpack. If not OA unit, then should add directly to inv of unit instead.
		if (_useBackpacks==1) then {
			_unit addBackpack _baglarge;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_RAAmag, 2];
		} else {
			{_unit addmagazine _RAAmag} foreach [1,2];
		};			
	};			
	
// LOADOUT: MEDIUM MG GUNNER	
	case "mmgg":
	{
		{_unit addmagazine _MMGmag} foreach [1,2,3,4];
		_unit addweapon _MMG;		
		{_unit addmagazine _pistolmag} foreach [1,2];
		_unit addweapon _pistol;
	};			

// LOADOUT: MEDIUM MG ASSISTANT GUNNER	
	case "mmgag":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";		
			// Put ammo in backpack. If not OA unit, then should add directly to inv of unit instead.
		if (_useBackpacks==1) then {
			_unit addBackpack _bagmedium;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 2];
		} else {
			{_unit addmagazine _MMGmag} foreach [1,2];
		};				
	};
	
// LOADOUT: HEAVY MG GUNNER
	case "hmgg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
			// If not an OA unit, this attachment cannot carry an HMG
			_unit addBackpack _HMG;
	};	
	
// LOADOUT: HEAVY MG ASSISTANT GUNNER
	case "hmgag":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";			
			// If not an OA unit, this attachment cannot carry an HMG 
			_unit addBackpack _HMGmount;
	};		

// LOADOUT: MEDIUM AT GUNNER
	case "matg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3];
		_unit addweapon _carbine;
		{_unit addmagazine _MATmag1} foreach [1,2,3];
		{_unit addmagazine _MATmag2} foreach [1];
		_unit addweapon _MAT;			
	};	
	
// LOADOUT: MEDIUM AT ASSISTANT GUNNER	
	case "matag":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";		
			// Put ammo in backpack. If not OA unit, then should add directly to inv of unit instead.
		if (_useBackpacks==1) then {
			_unit addBackpack _baglarge;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 1];
			(unitBackpack _unit) addMagazineCargoGlobal [_MATmag2, 2];
		} else {
			{_unit addmagazine _MATmag1} foreach [1];
			{_unit addmagazine _MATmag2} foreach [1,2];
		};				
			
	};	
	
// LOADOUT: HEAVY AT GUNNER
	case "hatg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		{_unit addmagazine _HATmag1} foreach [1];
		_unit addweapon _HAT;			
	};	
	
// LOADOUT: HEAVY AT ASSISTANT GUNNER	
	case "hatag":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";		
			// Put ammo in backpack. If not OA unit, then should add directly to inv of unit instead.
		if (_useBackpacks==1) then {
			_unit addBackpack _baglarge;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_HATmag1, 1];
			(unitBackpack _unit) addMagazineCargoGlobal [_HATmag2, 2];
		} else {
			{_unit addmagazine _HATmag1} foreach [1];
			{_unit addmagazine _HATmag2} foreach [1];
		};					
	};		
	
// LOADOUT: MORTAR GUNNER
	case "mtrg":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
			// If not an OA unit, this attachment cannot carry a mortar
			_unit addBackpack _MTR;
	};	
	
// LOADOUT: MORTAR ASSISTANT GUNNER
	case "mtrag":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
		_unit addWeapon "Binocular_Vector";			
			// If not an OA unit, this attachment cannot carry a mortar 
			_unit addBackpack _MTRmount;
	};		
	
// LOADOUT: SNIPER
	case "sn":
	{
		{_unit addmagazine _SNriflemag} foreach [1,2];
		_unit addweapon _SNrifle;
		_unit addweapon "Binocular";
	};		
	
// LOADOUT: SPOTTER
	case "sp":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4];
		_unit addweapon _rifle;
		_unit addWeapon "Binocular_Vector";		
			// There are no camoflaged backpacks so all spotters carry spare sniper ammo on themselves
			{_unit addmagazine _SNriflemag} foreach [1];
	};			
	
// LOADOUT: GROUND VEHICLE CREW
	case "c":
	{
		{_unit addmagazine _smgmag} foreach [1,2,3,4];
		_unit addweapon _smg;
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
		{_unit addmagazine _carbinemag} foreach [1,2,3,4];
		_unit addweapon _carbine;
		{_unit addmagazine _smokegrenade} foreach [1];
		{_unit addmagazine _grenade} foreach [1];
		{_unit addmagazine _satchel} foreach [1,2];
		{_unit addmagazine _mine} foreach [1];
			// Put ammo in backpack. If not OA unit, then should add directly to inv of unit instead.
		if (_useBackpacks==1) then {
			_unit addBackpack _baglarge;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_satchel, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_mine, 1];	
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];	
			(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
		}; // no else; engineer inventory already full with 4 mags, 1 gren, 1 smoke, 2 satchels, 1 mine		
	};	
		
// LOADOUT: RIFLEMAN
	case "r":
	{
		{_unit addmagazine _riflemag} foreach [1,2,3,4,5,6,7];
		_unit addweapon _rifle;
	};

// LOADOUT: CARABINEER
	case "car":
	{
		{_unit addmagazine _carbinemag} foreach [1,2,3,4,5];
		_unit addweapon _carbine;
	};

// LOADOUT: SUBMACHINEGUNNER
	case "smg":
	{
		{_unit addmagazine _smgmag} foreach [1,2,3,4];
		_unit addweapon _smg;
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

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING
_unit selectweapon primaryweapon _unit;