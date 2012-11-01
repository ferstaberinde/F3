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
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

_radio1 = "";
_radio2 = "";
_radio3 = "";

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;							// expecting name of unit; originally passed by using 'this' in unit init

// ====================================================================================

// PREPARE UNIT FOR GEAR ADDITION
// The following code removes all existing weapons and backpacks

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
	
	};
  
// LOADOUT: DEPUTY COMMANDER
	case "dc":
	{
	
	}; 

// LOADOUT: MEDIC
	case "m":
	{
			
	};

// LOADOUT: FIRE TEAM LEADER
	case "ftl":
	{
	
	};	


// LOADOUT: AUTOMATIC RIFLEMAN
	case "ar":
	{
		
	};	
	
// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
	case "aar":
	{
	
	};			
	
// LOADOUT: RIFLEMAN (AT)	
	case "rat":
	{
		
	};		
	
// LOADOUT: SURFACE TO AIR MISSILE GUNNER 
	case "samg":
	{
		
	};			
	
// LOADOUT: ASSISTANT SURFACE TO AIR MISSILE GUNNER
	case "samag":
	{
			
	};			
	
// LOADOUT: MEDIUM MG GUNNER	
	case "mmgg":
	{
		
	};			

// LOADOUT: MEDIUM MG ASSISTANT GUNNER	
	case "mmgag":
	{
				
	};
	
// LOADOUT: HEAVY MG GUNNER
	case "hmgg":
	{
		
	};	
	
// LOADOUT: HEAVY MG ASSISTANT GUNNER
	case "hmgag":
	{
		
	};		

// LOADOUT: MEDIUM AT GUNNER
	case "matg":
	{
			
	};	
	
// LOADOUT: MEDIUM AT ASSISTANT GUNNER	
	case "matag":
	{
		
	};	
	
// LOADOUT: HEAVY AT GUNNER
	case "hatg":
	{
			
	};	
	
// LOADOUT: HEAVY AT ASSISTANT GUNNER	
	case "hatag":
	{
					
	};		
	
// LOADOUT: MORTAR GUNNER
	case "mtrg":
	{
		
	};	
	
// LOADOUT: MORTAR ASSISTANT GUNNER
	case "mtrag":
	{
		
	};		
	
// LOADOUT: SNIPER
	case "sn":
	{
	
	};		
	
// LOADOUT: SPOTTER
	case "sp":
	{
		
	};			
	
// LOADOUT: GROUND VEHICLE CREW
	case "c":
	{
	
	};			
	
// LOADOUT: AIR VEHICLE PILOTS
	case "p":
	{
						
	};		
	
// LOADOUT: ENGINEER
	case "eng":
	{
			
	};	
		
// LOADOUT: RIFLEMAN
	case "r":
	{
		
	};

// LOADOUT: CARABINEER
	case "car":
	{
		
	};

// LOADOUT: SUBMACHINEGUNNER
	case "smg":
	{
		
	};

// LOADOUT: GRENADIER
	case "gren":
	{
		
	};


	
// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
				
		if (true) exitwith {player globalchat format ["DEBUG (f\common\folk_assignGear.sqf): Unit = %1. Gear template %2 does not exist, used Rifleman instead.",_unit,_typeofunit]};
   };


// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING
_unit selectweapon primaryweapon _unit;