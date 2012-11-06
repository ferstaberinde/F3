// F2 - Folk Assign Gear Script - Czech Republic Equipment
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
//		gren	- grenadier
//
//		v_car	- car/4x4
//		v_tr	- truck
//		v_ifv	- ifv
//
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

_radio1 = "ACRE_PRC117F"; //longrange
_radio2 = "ACRE_PRC148";  //midrange
_radio3 = "";

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;							// expecting name of unit; originally passed by using 'this' in unit init

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
		_unit addWeapon _radio1;
		_unit addWeapon _radio2;
	};
  
// LOADOUT: DEPUTY COMMANDER AND SQUAD LEADER
	case "dc":
	{
		_unit addWeapon _radio1;
		_unit addWeapon _radio2;
	}; 

// LOADOUT: MEDIC
	case "m":
	{
		_unit addWeapon _radio2;
	};

// LOADOUT: FIRE TEAM LEADER
	case "ftl":
	{
		_unit addWeapon _radio2;
	};	


// LOADOUT: AUTOMATIC RIFLEMAN
	case "ar":
	{
		_unit addWeapon _radio2;
	};	
	
// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
	case "aar":
	{
		_unit addWeapon _radio2;
	};			
	
// LOADOUT: RIFLEMAN (AT)	
	case "rat":
	{
		_unit addWeapon _radio2;
	};		
	
// LOADOUT: SURFACE TO AIR MISSILE GUNNER 
	case "samg":
	{
		_unit addWeapon _radio2;
	};			
	
// LOADOUT: ASSISTANT SURFACE TO AIR MISSILE GUNNER
	case "samag":
	{
		_unit addWeapon _radio2;
	};			
	
// LOADOUT: MEDIUM MG GUNNER	
	case "mmgg":
	{
		_unit addWeapon _radio2;
	};			

// LOADOUT: MEDIUM MG ASSISTANT GUNNER	
	case "mmgag":
	{
		_unit addWeapon _radio2;		
	};
	
// LOADOUT: HEAVY MG GUNNER
	case "hmgg":
	{
		_unit addWeapon _radio2;
	};	
	
// LOADOUT: HEAVY MG ASSISTANT GUNNER
	case "hmgag":
	{
		_unit addWeapon _radio2;
	};		

// LOADOUT: MEDIUM AT GUNNER
	case "matg":
	{
		_unit addWeapon _radio2;	
	};	
	
// LOADOUT: MEDIUM AT ASSISTANT GUNNER	
	case "matag":
	{
		_unit addWeapon _radio2;
	};	
	
// LOADOUT: HEAVY AT GUNNER
	case "hatg":
	{
		_unit addWeapon _radio2;	
	};	
	
// LOADOUT: HEAVY AT ASSISTANT GUNNER	
	case "hatag":
	{
		_unit addWeapon _radio2;			
	};		
	
// LOADOUT: MORTAR GUNNER
	case "mtrg":
	{
		_unit addWeapon _radio2;
	};	
	
// LOADOUT: MORTAR ASSISTANT GUNNER
	case "mtrag":
	{
		_unit addWeapon _radio2;
	};		
	
// LOADOUT: SNIPER
	case "sn":
	{
		_unit addWeapon _radio2;
	};		
	
// LOADOUT: SPOTTER
	case "sp":
	{
		_unit addWeapon _radio2;
	};			
	
// LOADOUT: GROUND VEHICLE CREW
	case "c":
	{
		if(leader group _unit == _unit) then {
				_unit addWeapon _radio1;
			};
			_unit addWeapon _radio2;
	};			
	
// LOADOUT: AIR VEHICLE PILOTS
	case "p":
	{
		if(leader group _unit == _unit) then {
				_unit addWeapon _radio1;
			};
			_unit addWeapon _radio2;				
	};		
	
// LOADOUT: ENGINEER
	case "eng":
	{
			_unit addWeapon _radio2;	
	};	
		
// LOADOUT: RIFLEMAN
	case "r":
	{
		_unit addWeapon _radio2;	
	};

// LOADOUT: CARABINEER
	case "car":
	{
		_unit addWeapon _radio2;	
	};

// LOADOUT: SUBMACHINEGUNNER
	case "smg":
	{
		_unit addWeapon _radio2;	
	};

// LOADOUT: GRENADIER
	case "gren":
	{
		_unit addWeapon _radio2;	
	};

// CARGO: CAR - room for 10 weapons and 50 cargo items
	case "v_car":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_radio2, 1];
		_unit addWeaponCargoGlobal [_radio1, 1];
	};	
	
// CARGO: TRUCK - room for 50 weapons and 200 cargo items
	case "v_tr":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_radio2, 4];
		_unit addWeaponCargoGlobal [_radio1, 4];

	};
	
// CARGO: IFV - room for 10 weapons and 100 cargo items
	case "v_ifv":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_radio2, 2];
		_unit addWeaponCargoGlobal [_radio1, 2];

	};

	
// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
		_unit addWeapon _radio2;		
		if (true) exitwith {player globalchat format ["DEBUG (f\common\folk_assignGear.sqf): Unit = %1. Gear template %2 does not exist, used Rifleman instead.",_unit,_typeofunit]};
   };


// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING
_unit selectweapon primaryweapon _unit;