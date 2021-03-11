// F3 - Folk ARPS Assign Gear Script (Server-side)
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// INTERPRET PASSED VARIABLES

// The following interprets what has been passed to this script
params[
	["_typeofUnit", "", [""]],
	["_unit", objNull, [objNull]]
];
private _isMan = _unit isKindOf "CAManBase"; // We check if we're dealing with a soldier or a vehicle
_typeofUnit = toLower _typeofUnit; // Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)

// ====================================================================================

// DETECT unit FACTION
// The following code detects what faction the unit's slot belongs to, and stores
// it in the private variable _faction. It can also be passed as an optional parameter.

private _faction = toLower (param[2, ([_unit] call f_fnc_virtualFaction)]);

// ====================================================================================

// INSIGNIA
// This block will give units insignia on their uniforms.

// NATO and CSAT have different styles of insignia to match the different uniforms for
// Altis and Tanoa. Additionally, CSAT has an urban camo option. The following variables
// can be changed to apply the desired style of insignia to the NATO and CSAT platoons.

_insignia_style_NATO = "Altis"; // Options: "Altis" | "Tanoa"
_insignia_style_CSAT = "Altis"; // Options: "Altis" | "Tanoa" | "Urban"

_insignia_styles = [_insignia_style_NATO,_insignia_style_CSAT];
[_unit,_typeofUnit,_insignia_styles] spawn f_fnc_assignInsignia;

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

private ["_binoculars","_lau_attach1","_lau_attachments","_attach1","_attach2","_silencer1","_silencer2","_scope1","_scope2","_scope3","_bipod1","_bipod2","_attachments","_silencer","_hg_silencer1","_hg_scope1","_hg_attachments","_rifle","_riflemag","_riflemag_tr","_carbine","_carbinemag","_carbinemag_tr","_shotgun","_shotgunmag1","_shotgunmag2","_smg","_smgmag","_smgmag_tr","_diverWep","_diverMag1","_diverMag2","_glrifle","_glriflemag","_glriflemag_tr","_glmag","_glsmokewhite","_glsmokegreen","_glsmokered","_glflarewhite","_glflarered","_glflareyellow","_glflaregreen","_pistol","_pistolmag","_grenade","_Mgrenade","_smokegrenade","_smokegrenadegreen","_smokegrenadeblue","_smokegrenadepurple","_firstaid","_medkit","_nvg","_nvgPilot","_uavterminal","_chemgreen","_chemred","_chemyellow","_chemblue","_bag","_bagLarge","_bagmediumdiver","_baguav","_baghmgg","_baghmgag","_baghatg","_baghatag","_bagmtrg","_bagmtrag","_baghsamg","_baghsamag","_bagRadio","_AR","_ARmag","_ARmag_tr","_MMG","_MMGmag","_MMGmag_tr","_Tracer","_DMrifle","_DMriflemag","_RAT","_RATmag1","_RATmag2","_MAT","_MATmag1","_MATmag2","_SAM","_SAMmag","_HAT","_HATmag1","_HATmag2","_SNrifle","_SNrifleMag","_ATmine","_satchel","_APmine1","_APmine2","_diver","_pilot","_crew","_ghillie","_specOp","_baseUniform","_baseHelmet","_baseGlasses","_lightRig","_mediumRig","_heavyRig","_diverUniform","_diverHelmet","_diverRig","_diverGlasses","_pilotUniform","_pilotHelmet","_pilotRig","_pilotGlasses","_crewUniform","_crewHelmet","_crewRig","_crewGlasses","_ghillieUniform","_ghillieHelmet","_ghillieRig","_ghillieGlasses","_sfuniform","_sfhelmet","_sfRig","_sfGlasses","_backpack","_typeofBackPack","_loadout","_COrifle","_mgrenade","_DC","_SLrifle","_JTACrifle","_ftlrifle","_grenrifle","_typeofunit","_jet","_jetUniform","_jetHelmet","_jetRig","_jetGlasses","_vip","_vipUniform","_vipHelmet","_vipRig","_vipGlasses"];

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
	// #include "f_assignGear_natoWoodland.sqf" // Use NATO Woodland loadouts on NATO non-Woodland units (e.g. Folk ARPS Platoons)
};

// ====================================================================================

// GEAR: BLUFOR > NATO (Pacific)
// The following block of code executes only if the unit belongs to the NATO (Pacific) faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_t_f","natopacific"]) then {
	#include "f_assignGear_natoPacific.sqf"
};

// ====================================================================================

// GEAR: BLUFOR > NATO (Woodland)
// The following block of code executes only if the unit belongs to the NATO (Woodland) faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_w_f","natowoodland"]) then {
	#include "f_assignGear_natoWoodland.sqf"
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

// GEAR: OPFOR > Spetsnaz
// The following block of code executes only if the unit belongs to the Spetsnaz faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["opf_r_f","spetsnaz"]) then {
	#include "f_assignGear_spetsnaz.sqf"
};

// ====================================================================================

// GEAR: INDEPENDENT > AAF
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
};

// ====================================================================================

// GEAR: CTRG
// The following block of code executes only if the unit belongs to the CTRG faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_ctrg_f","ctrg"]) then {
	#include "f_assignGear_ctrg.sqf"
};

// ====================================================================================

// GEAR: INDEPENDENT > SYNDIKAT
// The following block of code executes only if the unit is manually assigned the Syndikat faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["ind_c_f","syndikat"]) then {
	#include "f_assignGear_syndikat.sqf"
};

// ====================================================================================

// GEAR: INDEPENDENT > LDF
// The following block of code executes only if the unit belongs to the LDF faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["ind_e_f","ldf"]) then {
	#include "f_assignGear_ldf.sqf"
};

// ====================================================================================

// GEAR: INDEPENDENT > NPR
// The following block of code executes only if the unit belongs to the NPR faction; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["ind_l_f","npr"]) then {
	#include "f_assignGear_npr.sqf"
};

// ====================================================================================

// VIRTUAL FACTIONS

// GEAR: 3IFB
// The following block of code executes only if the unit is assigned to the 3IFB virtual faction
// with f_fnc_setVirtualFaction; it automatically includes a file which contains the appropriate
// equipment data.
if (_faction in ["3ifb"]) then {
	#include "f_assignGear_3IFB.sqf"
};

// ====================================================================================

// Handle weapon switching, weapon attachments, etc

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// Add extra FAKs,
	// because the assignGear files were made when the sws was still existing.
	private _numExtraFAK = 2;
	for "_i" from 1 to _numExtraFAK do {
		_unit addItem _firstaid;
	};

	// Handle weapon attachments
	#include "f_assignGear_attachments.sqf";

	// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING
	_unit selectweapon primaryweapon _unit;

};


// ====================================================================================

// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.

_unit setVariable ["f_var_assignGear_done",true,true];

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
