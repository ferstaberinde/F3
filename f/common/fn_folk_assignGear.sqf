// F3 - Folk Assign Gear Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_faction","_typeofUnit","_unit"];
private [
//"_faction",
"_glrifle","_glriflemag","_glriflemag_tr","_glmag",
"_glsmokewhite","_glsmokegreen","_glsmokered",
"_glflarewhite","_glflarered","_glflareyellow","_glflaregreen",
"_AR","_ARmag",	"_ARmag_tr",
"_MMG","_MMGmag","_MMGmag_tr",
"_HMG","_HMGmount",
"_RAT","_RATmag",
"_MAT","_MATmag1","_MATmag2",
"_HAT","_HATmag1","_HATmag2",
"_MTR","_MTRmount",
"_RAA","_RAAmag",
"_SNrifle","_SNriflemag",
"_pistol","_pistolmag",
"_grenade","_smokegrenade","_smokegreen",
"_rifle","_riflemag","_riflemag_tr",
"_carbine","_carbinemag","_carbinemag_tr",
"_smg","_smgmag","_smgmag_tr",
"_bagmedium","_baglarge",
"_ATmine","_satchel",
"_medkit","_rifle_attach",
"_carbine_attach","_smg_attach",
"_glrifle_attach","_AR_attach",
"_MMG_attach","_SNrifle_attach"
,"_APmine", "_nvg"
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

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (assignGear.sqf): Player faction: %1",_faction];
	};

// ====================================================================================

// GEAR: BLUFOR > BLUE
// The following block of code executes only if the player is in a BLUE slot; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction == "BLU_F") then {
#include "folk_assignGear_nato.sqf"
};

// ====================================================================================

// GEAR: OPFOR > RED
// The following block of code executes only if the player is in a RED slot; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction == "OPF_F") then {
#include "folk_assignGear_csat.sqf"
};

// ====================================================================================

// GEAR: INDEPEDENT > GREEN
// The following block of code executes only if the player is in a GREEN slot; it
// automatically includes a file which contains the appropriate equipment data.

if(_faction == "IND_F") then {
#include "folk_assignGear_aaf.sqf";
};

// ====================================================================================

// GEAR: ACRE
// The following block of code executes only if the ACRE parameter is set to true; it
// automatically includes a file which contains the appropriate equipment data.

_useACRE = paramsArray select 2;

if (_useACRE == 1) then {
	_this execVM "f\common\fa_ACRE_assignGear.sqf";
};

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

