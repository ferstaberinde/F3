// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
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
#include "f_briefing_credits.sqf"

// ====================================================================================

// BRIEFING: ADMIN
if (serverCommandAvailable "#kick" || !isMultiplayer) then {
	#include "f_briefing_admin.sqf"
	["host"] call _fnc_debug;
};

// ====================================================================================
// BRIEFING: FACTION SPECIFIC
// The following code blocks include faction-specific briefing files.

// BLUFOR > NATO
if (_unitfaction in ["blu_f","blu_t_f"]) exitwith {
	#include "f_briefing_nato.sqf"
	[_unitfaction] call _fnc_debug;
};

// FIA
if (_unitfaction in ["blu_g_f","ind_g_f","opf_g_f"]) exitwith {
	#include "f_briefing_fia.sqf"
	[_unitfaction] call _fnc_debug;
};

// BLUFOR > GENDARMERIE
if (_unitfaction in ["blu_gen_f"]) exitwith {
	#include "f_briefing_gendarmerie.sqf"
	[_unitfaction] call _fnc_debug;
};

// OPFOR > CSAT
if (_unitfaction in ["opf_f","opf_t_f"]) exitwith {
	#include "f_briefing_csat.sqf"
	[_unitfaction] call _fnc_debug;
};

// INDEPENDENT > AAF
if (_unitfaction in ["ind_f"]) exitwith {
	#include "f_briefing_aaf.sqf"
	[_unitfaction] call _fnc_debug;
};

// INDEPENDENT > SYNDIKAT
if (_unitfaction in ["ind_c_f"]) exitwith {
	#include "f_briefing_syndikat.sqf"
	[_unitfaction] call _fnc_debug;
};

// BLUFOR > CTRG
if (_unitfaction in ["blu_ctrg_f"]) exitwith {
	#include "f_briefing_ctrg.sqf"
	[_unitfaction] call _fnc_debug;
};

// CIVILIAN and IDAP
if (_unitfaction in ["civ_f", "civ_idap_f"]) exitwith {
	#include "f_briefing_civ.sqf"
	[_unitfaction] call _fnc_debug;
};

// VIRTUAL FACTION > 3IFB
if (_unitfaction in ["3ifb"]) exitwith {
	#include "f_briefing_3ifb.sqf"
	[_unitfaction] call _fnc_debug;
};

// ZEUS
if (_unitfaction == "" && ! (typeOf player isEqualTo "VirtualSpectator_F")) exitwith {
	#include "f_briefing_zeus.sqf"
	["zeus"] call _fnc_debug;
};

// Virtual Spectator
if (typeOf player isEqualTo "VirtualSpectator_F") exitwith {
};

// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

player globalchat format ["DEBUG (fn_createBriefing.sqf): Faction %1 is not defined.",_unitfaction];
