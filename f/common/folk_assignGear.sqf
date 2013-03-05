// F2 - OA Assign Gear v2
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_faction","_typeofUnit","_unit","_useBackpacks"];
private [
//"_faction",												
"_glrifle","_glriflemag","_glmag",						
"_glsmokewhite","_glsmokegreen","_glsmokered",			
"_glflarewhite","_glflarered","_glflareyellow","_glflaregreen",
"_AR","_ARmag",											
"_MMG","_MMGmag",										
"_HMG","_HMGmount",				
"_RAT","_RATmag",			
"_MAT","_MATmag1","_MATmag2",
"_HAT","_HATmag1","_HATmag2",
"_MTR","_MTRmount",					
"_RAA","_RAAmag",			
"_SNrifle","_SNriflemag",			
"_pistol","_pistolmag",									
"_grenade","_smokegrenade","_smokegreen",									
"_rifle","_riflemag",									
"_carbine","_carbinemag",								
"_smg","_smgmag",										
"_bagmedium","_baglarge",
"_mine","_satchel",
"_radio1","_radio2","_radio3"
];

// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what faction the player's slot belongs to, and stores
// it in the private variable _faction

_typeofUnit = toLower (_this select 0);
_unit = _this select 1;
_faction = toLower (faction _unit);

// If the unitfaction is different from the group leader's faction and the unit is not a vehicle, the latters faction is used
if ((_unit isKindOF "CAManBase")&&(_faction != toLower (faction (leader group _unit)))) then {_faction = toLower (faction (leader group _unit))};

_useBackpacks = paramsArray select 0;
_useACRE = paramsArray select 1;



// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (assignGear.sqf): Player faction: %1",_faction];
	};

// ====================================================================================

// GEAR: NATO
// The following block of code executes only if the player is in a US slot; it 
// automatically includes a file which contains the appropriate equipment data.

if (_faction == "BLU_F") then {
#include "folk_assignGear_nato.sqf"
};

// ====================================================================================

// GEAR: IRAN
// The following block of code executes only if the player is in a USMC slot; it 
// automatically includes a file which contains the appropriate equipment data.

if (_faction == "OPF_F") then {
#include "folk_assignGear_iran.sqf"
};


// GEAR: ACRE
// The following block of code executes only if the ACRE parameter is set to true; it 
// automatically includes a file which contains the appropriate equipment data.

//if (_useACRE == 1) then {
//#include "folk_assignGear_acre.sqf"
//};

// ====================================================================================

// DEBUG

// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

if (isNil "_carbine") then { //_carbine should exist unless no faction has been called
	player globalchat format ["DEBUG (assignGear.sqf): Faction %1 is not defined.",_faction];
} else {
 	if (f_var_debugMode == 1) then	{
		player sideChat format ["DEBUG (assignGear.sqf): Gear for %1: %1 slot selected.",_unit,_faction,_typeofUnit];
	};
};

// ====================================================================================

// DELETE PRE-COMPILE UNITS
// Two units are placed on the map (lower left-hand corner) to aid with the assignGear
// scripts. After a short while we delete these (so they do not confuse the spectator
// script).

if (isServer) then {
	[] execVM "f\common\folk_assignGearCleanUp.sqf";
};