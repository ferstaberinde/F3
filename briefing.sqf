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
		player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 selected.",_faction];
	};
};

// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what faction the player's slot belongs to, and stores
// it in the private variable _unitfaction

private _unitfaction = toLower (faction player);

// If the unitfaction is different from the group leader's faction, the latter faction is used
if (_unitfaction != toLower (faction (leader group player))) then {
	_unitfaction = toLower (faction (leader group player))
};

// DEBUG
if (f_param_debugMode == 1) then
{
	player sideChat format ["DEBUG (briefing.sqf): Player faction: %1",_unitfaction];
};

// ====================================================================================

// BRIEFING: ADMIN
// The following block of code executes only if the player is the current host
// it automatically includes a file which contains the appropriate briefing data.

if (serverCommandAvailable "#kick") then {

#include "f\briefing\f_briefing_admin.sqf"

	// DEBUG
	["host"] call _fnc_debug;
};

// ====================================================================================

// BRIEFING: BLUFOR > NATO
// The following block of code executes only if the player is in a NATO or NATO (Pacific) slot; it
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction in ["blu_f","blu_t_f"]) exitwith {

#include "f\briefing\f_briefing_nato.sqf"

	// DEBUG
	[_unitfaction] call _fnc_debug;
};

// ====================================================================================

// BRIEFING: FIA
// The following block of code executes only if the player is in a FIA slot; it
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction in ["blu_g_f","ind_g_f","opf_g_f"]) exitwith {

#include "f\briefing\f_briefing_fia.sqf"

	// DEBUG
	[_unitfaction] call _fnc_debug;
};

// ====================================================================================

// BRIEFING: BLUFOR > GENDARMERIE
// The following block of code executes only if the player is in a Gendarmerie slot; it
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction in ["blu_gen_f"]) exitwith {

#include "f\briefing\f_briefing_gendarmerie.sqf"

	// DEBUG
	[_unitfaction] call _fnc_debug;
};

// ====================================================================================

// BRIEFING: OPFOR > CSAT
// The following block of code executes only if the player is in a CSAT & CSAT (Pacific) slot; it
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction in ["opf_f","opf_t_f"]) exitwith {

#include "f\briefing\f_briefing_csat.sqf"

	// DEBUG
	[_unitfaction] call _fnc_debug;
};

// ====================================================================================

// BRIEFING: INDEPENDENT > AAF
// The following block of code executes only if the player is in a AAF
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction in ["ind_f"]) exitwith {

#include "f\briefing\f_briefing_aaf.sqf"

	// DEBUG
	[_unitfaction] call _fnc_debug;
};

// ====================================================================================

// BRIEFING: INDEPENDENT > SYNDIKAT
// The following block of code executes only if the player is in a Syndikat
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction in ["ind_c_f"]) exitwith {

#include "f\briefing\f_briefing_syndikat.sqf"

	// DEBUG
	[_unitfaction] call _fnc_debug;
};

// ====================================================================================

// BRIEFING: BLUFOR > CTRG
// The following block of code executes only if the player is in a CTRG
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction in ["blu_ctrg_f"]) exitwith {

#include "f\briefing\f_briefing_ctrg.sqf"

	// DEBUG
	[_unitfaction] call _fnc_debug;
};

// ====================================================================================

// BRIEFING: CIVILIAN and IDAP
// The following block of code executes only if the player is in a CIVILIAN
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction in ["civ_f", "civ_idap_f"]) exitwith {

#include "f\briefing\f_briefing_civ.sqf"

	// DEBUG
	[_unitfaction] call _fnc_debug;
};

// ====================================================================================

// BRIEFING: ZEUS
// The following block of code executes only if the player is in a ZEUS (Gamelogic) 
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "" && ! (typeOf player isEqualTo "VirtualSpectator_F")) exitwith {

#include "f\briefing\f_briefing_zeus.sqf"

	// DEBUG
	["zeus"] call _fnc_debug;
};


// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

player globalchat format ["DEBUG (briefing.sqf): Faction %1 is not defined.",_unitfaction];
