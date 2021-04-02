// F3 - Briefing
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

if (!hasInterface) exitWith {}; //Exit if not a player.

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
	waitUntil {sleep 0.1; !isNull player};
};

// DEBUG HELPER FUNCTION
private _fnc_debug = {
	params [["_faction", "", [""]]];
	if (f_param_debugMode == 1) then
	{
		player sideChat format ["DEBUG (fn_createBriefing.sqf): Briefing for %1 selected.",_faction];
	};
};

// ====================================================================================

// DETECT PLAYER FACTION (use faction from group leader)
private _unitfaction = toLower ([leader group player] call f_fnc_virtualFaction);

// DEBUG
if (f_param_debugMode == 1) then
{
	player sideChat format ["DEBUG (fn_createBriefing.sqf): Player faction: %1",_unitfaction];
};

// ====================================================================================

// BRIEFING: CREDITS
#if __has_include("f_briefing_credits.sqf")
	#include "f_briefing_credits.sqf"
#endif

// ====================================================================================

// BRIEFING: ADMIN
if (serverCommandAvailable "#kick" || !isMultiplayer) then {
	#if __has_include("f_briefing_admin.sqf")
		#include "f_briefing_admin.sqf"
		["host"] call _fnc_debug;
	#endif
};

// ====================================================================================
// BRIEFING: FACTION SPECIFIC
// The following code blocks include faction-specific briefing files.

// BLUFOR > NATO
if (_unitfaction in ["blu_f","blu_t_f","blu_w_f","nato","natowoodland","natopacific"]) exitwith {
	#if __has_include("f_briefing_nato.sqf")
		#include "f_briefing_nato.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// FIA
if (_unitfaction in ["blu_g_f","ind_g_f","opf_g_f","fia"]) exitwith {
	#if __has_include("f_briefing_fia.sqf")
		#include "f_briefing_fia.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// BLUFOR > GENDARMERIE
if (_unitfaction in ["blu_gen_f"]) exitwith {
	#if __has_include("f_briefing_gendarmerie.sqf")
		#include "f_briefing_gendarmerie.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// OPFOR > CSAT
if (_unitfaction in ["opf_f","opf_t_f","csat","csatpacific"]) exitwith {
	#if __has_include("f_briefing_csat.sqf")
		#include "f_briefing_csat.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// OPFOR > Spetsnaz
if (_unitfaction in ["opf_r_f","spetsnaz"]) exitwith {
	#if __has_include("f_briefing_spetsnaz.sqf")
		#include "f_briefing_spetsnaz.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// INDEPENDENT > AAF
if (_unitfaction in ["ind_f","aaf"]) exitwith {
	#if __has_include("f_briefing_aaf.sqf")
		#include "f_briefing_aaf.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// INDEPENDENT > LDF
if (_unitfaction in ["ind_e_f","ldf"]) exitwith {
	#if __has_include("f_briefing_ldf.sqf")
		#include "f_briefing_ldf.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// INDEPENDENT > SYNDIKAT
if (_unitfaction in ["ind_c_f","syndikat"]) exitwith {
	#if __has_include("f_briefing_syndikat.sqf")
		#include "f_briefing_syndikat.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// INDEPENDENT > NPR (Looters)
if (_unitfaction in ["ind_l_f","npr"]) exitwith {
	#if __has_include("f_briefing_npr.sqf")
		#include "f_briefing_npr.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};


// BLUFOR > CTRG
if (_unitfaction in ["blu_ctrg_f","ctrg"]) exitwith {
	#if __has_include("f_briefing_ctrg.sqf")
		#include "f_briefing_ctrg.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// CIVILIAN and IDAP
if (_unitfaction in ["civ_f", "civ_idap_f"]) exitwith {
	#if __has_include("f_briefing_civ.sqf")
		#include "f_briefing_civ.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// VIRTUAL FACTION > 3IFB
if (_unitfaction in ["3ifb"]) exitwith {
	#if __has_include("f_briefing_3ifb.sqf")
		#include "f_briefing_3ifb.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// ZEUS
if (_unitfaction == "" && ! (typeOf player isEqualTo "VirtualSpectator_F")) exitwith {
	#if __has_include("f_briefing_zeus.sqf")
		#include "f_briefing_zeus.sqf"
		[_unitfaction] call _fnc_debug;
	#endif
};

// Virtual Spectator
if (typeOf player isEqualTo "VirtualSpectator_F") exitwith {
};

// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

player globalchat format ["DEBUG (fn_createBriefing.sqf): Faction %1 is not defined.",_unitfaction];
