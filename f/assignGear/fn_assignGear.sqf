// F3 - Folk ARPS Assign Gear Script (Server-side)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS


// ====================================================================================

// DETECT unit FACTION
// The following code detects what faction the unit's slot belongs to, and stores
// it in the private variable _faction. It can also be passed as an optional parameter.


params["_typeofUnit","_unit"];
private _faction = toLower (faction _unit);

_typeofUnit = toLower _typeofUnit;
_faction = toLower (param[2, (faction _unit)]);

// ====================================================================================

// INSIGNIA
// This block will give units insignia on their uniforms.

// NATO and CSAT have different styles of insignia to match the different uniforms for
// Altis and Tanoa. Additionally, CSAT has an urban camo option. The following variables
// can be changed to apply the desired style of insignia to the NATO and CSAT platoons.

_insignia_style_NATO = "Altis"; // Options: "Altis" | "Tanoa"
_insignia_style_CSAT = "Altis"; // Options: "Altis" | "Tanoa" | "Urban"

_insignia_styles = [_insignia_style_NATO,_insignia_style_CSAT];
[_unit,_typeofUnit,_insignia_styles] spawn {
	#include "f_assignInsignia.sqf"
};

// ====================================================================================

// DECIDE IF THE SCRIPT SHOULD RUN
// Depending on locality the script decides if it should run

if !(local _unit) exitWith {};

// ====================================================================================

// SET A PUBLIC VARIABLE
// A public variable is set on the unit, indicating their type. This is mostly relevant for the F3 respawn component

_unit setVariable ["f_var_assignGear",_typeofUnit,true];

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS 2
// Used by the faction-specific scripts

private ["_attach1","_attach2","_silencer1","_silencer2","_scope1","_scope2","_scope3","_bipod1","_bipod2","_attachments","_silencer","_hg_silencer1","_hg_scope1","_hg_attachments","_rifle","_riflemag","_riflemag_tr","_carbine","_carbinemag","_carbinemag_tr","_smg","_smgmag","_smgmag_tr","_diverWep","_diverMag1","_diverMag2","_glrifle","_glriflemag","_glriflemag_tr","_glmag","_glsmokewhite","_glsmokegreen","_glsmokered","_glflarewhite","_glflarered","_glflareyellow","_glflaregreen","_pistol","_pistolmag","_grenade","_Mgrenade","_smokegrenade","_smokegrenadegreen","_firstaid","_medkit","_nvg","_uavterminal","_chemgreen","_chemred","_chemyellow","_chemblue","_bagsmall","_bagmedium","_baglarge","_bagmediumdiver","_baguav","_baghmgg","_baghmgag","_baghatg","_baghatag","_bagmtrg","_bagmtrag","_baghsamg","_baghsamag","_AR","_ARmag","_ARmag_tr","_MMG","_MMGmag","_MMGmag_tr","_Tracer","_DMrifle","_DMriflemag","_RAT","_RATmag","_MAT","_MATmag1","_MATmag2","_SAM","_SAMmag","_HAT","_HATmag1","_HATmag2","_SNrifle","_SNrifleMag","_ATmine","_satchel","_APmine1","_APmine2","_light","_heavy","_diver","_pilot","_crew","_ghillie","_specOp","_baseUniform","_baseHelmet","_baseGlasses","_lightRig","_mediumRig","_heavyRig","_diverUniform","_diverHelmet","_diverRig","_diverGlasses","_pilotUniform","_pilotHelmet","_pilotRig","_pilotGlasses","_crewUniform","_crewHelmet","_crewRig","_crewGlasses","_ghillieUniform","_ghillieHelmet","_ghillieRig","_ghillieGlasses","_sfuniform","_sfhelmet","_sfRig","_sfGlasses","_typeofUnit","_unit","_isMan","_backpack","_typeofBackPack","_loadout","_COrifle","_mgrenade","_DC","_SLrifle","_JTACrifle","_ftlrifle","_grenrifle","_typeofunit"];

// ====================================================================================

// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.

_unit setVariable ["f_var_assignGear_done",false,true];

// ====================================================================================

// DEBUG
if (f_param_debugMode == 1) then
{
	_unit sideChat format ["DEBUG (assignGear.sqf): unit faction: %1",_faction];
};

// ====================================================================================

// GEAR: BLUFOR > NATO
// The following block of code executes only if the unit belongs to the NATO faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_f","nato"]) then {
	#include "f_assignGear_nato.sqf"
	// #include "f_assignGear_natoPacific.sqf" // Use NATO Pacific loadouts on NATO non-Pacific units (e.g. Folk ARPS Platoons)
};

// ====================================================================================

// GEAR: BLUFOR > NATO (Pacific)
// The following block of code executes only if the unit belongs to the NATO (Pacific) faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_t_f","natopacific"]) then {
	#include "f_assignGear_natoPacific.sqf"
};

// ====================================================================================

// GEAR: BLUFOR > GENDARMERIE
// The following block of code executes only if the unit belongs to the gendarmerie faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_gen_f"]) then {
	#include "f_assignGear_gendarmerie.sqf"
};

// ====================================================================================

// GEAR: OPFOR > CSAT
// The following block of code executes only if the unit belongs to the CSAT faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["opf_f","csat"]) then {
	#include "f_assignGear_csat.sqf"
	// #include "f_assignGear_csatPacific.sqf" // Use CSAT Pacific loadouts on CSAT non-Pacific units (e.g. Folk ARPS Platoons)
};

// ====================================================================================

// GEAR: OPFOR > CSAT (Pacific)
// The following block of code executes only if the unit belongs to the CSAT (Pacific) faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["opf_t_f","csatpacific"]) then {
	#include "f_assignGear_csatPacific.sqf"
};

// ====================================================================================

// GEAR: INDEPEDENT > AAF
// The following block of code executes only if the unit belongs to the AAF faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["ind_f","aaf"]) then {
	#include "f_assignGear_aaf.sqf"
};

// ====================================================================================

// GEAR: FIA
// The following block of code executes only if the unit belongs to the FIA slot (any side); it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_g_f","opf_g_f","ind_g_f","fia"]) then {
	#include "f_assignGear_fia.sqf"
	//#include "f_assignGear_fiaAK.sqf" // Alternative FIA loadouts using AKs and RPG-7s
};

// ====================================================================================

// GEAR: CTRG
// The following block of code executes only if the unit belongs to the CTRG faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_ctrg_f","ctrg"]) then {
	#include "f_assignGear_ctrg.sqf"
};

// ====================================================================================

// GEAR: INDEPEDENT > SYNDIKAT
// The following block of code executes only if the unit is manually assigned the Syndikat faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["ind_c_f","syndikat"]) then {
	#include "f_assignGear_syndikat.sqf"
};

// ====================================================================================

// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.

_unit setVariable ["f_var_assignGear_done",true,true];

// ====================================================================================

// DEBUG

// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

if (isNil "_carbine") then { //_carbine should exist unless no faction has been called
	player globalchat format ["DEBUG (assignGear.sqf): Faction %1 is not defined.",_faction];
} else {
 	if (f_param_debugMode == 1) then	{
		player sideChat format ["DEBUG (assignGear.sqf): Gear for %1: %1 slot selected.",_unit,_faction,_typeofUnit];
	};
};

// ====================================================================================
