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
#if __has_include("f_briefing_admin.sqf")
	if (serverCommandAvailable "#kick" || !isMultiplayer) then {
		#include "f_briefing_admin.sqf"
		["host"] call _fnc_debug;
	};
#endif

// ====================================================================================
// BRIEFING: FACTION SPECIFIC
// The following code blocks include faction-specific briefing files.

// BLUFOR > NATO
#if __has_include("f_briefing_nato.sqf")
	if (_unitfaction in ["blu_f","blu_t_f","blu_w_f","nato","natowoodland","natopacific"]) exitwith {
		#include "f_briefing_nato.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// FIA
#if __has_include("f_briefing_fia.sqf")
	if (_unitfaction in ["blu_g_f","ind_g_f","opf_g_f","fia"]) exitwith {
		#include "f_briefing_fia.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// BLUFOR > GENDARMERIE
#if __has_include("f_briefing_gendarmerie.sqf")
	if (_unitfaction in ["blu_gen_f"]) exitwith {
		#include "f_briefing_gendarmerie.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// OPFOR > CSAT
#if __has_include("f_briefing_csat.sqf")
	if (_unitfaction in ["opf_f","opf_t_f","csat","csatpacific"]) exitwith {
		#include "f_briefing_csat.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// OPFOR > Spetsnaz
#if __has_include("f_briefing_spetsnaz.sqf")
	if (_unitfaction in ["opf_r_f","spetsnaz"]) exitwith {
		#include "f_briefing_spetsnaz.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// INDEPENDENT > AAF
#if __has_include("f_briefing_aaf.sqf")
	if (_unitfaction in ["ind_f","aaf"]) exitwith {
		#include "f_briefing_aaf.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// INDEPENDENT > LDF
#if __has_include("f_briefing_ldf.sqf")
	if (_unitfaction in ["ind_e_f","ldf"]) exitwith {
		#include "f_briefing_ldf.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// INDEPENDENT > SYNDIKAT
#if __has_include("f_briefing_syndikat.sqf")
	if (_unitfaction in ["ind_c_f","syndikat"]) exitwith {
		#include "f_briefing_syndikat.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// INDEPENDENT > NPR (Looters)
#if __has_include("f_briefing_npr.sqf")
	if (_unitfaction in ["ind_l_f","npr"]) exitwith {
		#include "f_briefing_npr.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif


// BLUFOR > CTRG
#if __has_include("f_briefing_ctrg.sqf")
	if (_unitfaction in ["blu_ctrg_f","ctrg"]) exitwith {
		#include "f_briefing_ctrg.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// CIVILIAN and IDAP
#if __has_include("f_briefing_civ.sqf")
	if (_unitfaction in ["civ_f", "civ_idap_f"]) exitwith {
		#include "f_briefing_civ.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// VIRTUAL FACTION > 3IFB
#if __has_include("f_briefing_3ifb.sqf")
	if (_unitfaction in ["3ifb"]) exitwith {
		#include "f_briefing_3ifb.sqf"
		[_unitfaction] call _fnc_debug;
	};
#endif

// ZEUS
#if __has_include("f_briefing_zeus.sqf")
	if (_unitfaction == "" && ! (typeOf player isEqualTo "VirtualSpectator_F")) exitwith {
		#include "f_briefing_zeus.sqf"
		["zeus"] call _fnc_debug;
	};
#endif

// Virtual Spectator
if (typeOf player isEqualTo "VirtualSpectator_F") exitwith {
};

// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

player globalchat format ["DEBUG (fn_createBriefing.sqf): Faction %1 is not defined.",_unitfaction];
