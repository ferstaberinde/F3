// F2 - OA Briefing
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f\common\f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unitfaction"];

// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what faction the player's slot belongs to, and stores
// it in the private variable _unitfaction

_unitfaction = toLower (faction player);

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Player faction: %1",_unitfaction];
	};

// ====================================================================================

// BRIEFING: US
// The following block of code executes only if the player is in a US slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "bis_us") exitwith {

#include "f\common\f_briefing_us.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: BRITISH ARMED FORCES
// The following block of code executes only if the player is in a BRITISH ARMED FORCES
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "bis_baf") exitwith {

#include "f\common\f_briefing_baf.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: TAKISTANI ARMY
// The following block of code executes only if the player is in a TAKISTANI ARMY slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "bis_tk") exitwith {

#include "f\common\f_briefing_tk.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: TAKISTANI MILITIA
// The following block of code executes only if the player is in a TAKISTANI MILITIA slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "bis_tk_ins") exitwith {

#include "f\common\f_briefing_tk_ins.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: TAKISTANI LOCALS (INDEPENDENT)
// The following block of code executes only if the player is in a TAKISTANI LOCALS (INDEPENDENT) slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "bis_tk_gue") exitwith {

#include "f\common\f_briefing_tk_gue.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: UN
// The following block of code executes only if the player is in a UN slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "bis_un") exitwith {

#include "f\common\f_briefing_un.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: CZECH REPUBPLIC
// The following block of code executes only if the player is in a CZECH REPUBPLIC slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "bis_cz") exitwith {

#include "f\common\f_briefing_cz.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: GERMAN
// The following block of code executes only if the player is in a GERMAN slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "bis_ger") exitwith {

#include "f\common\f_briefing_ger.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: CIVILIAN (TAKISTANI)
// The following block of code executes only if the player is in a CIVILIAN (TAKISTANI) slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "bis_tk_civ") exitwith {

#include "f\common\f_briefing_tk_civ.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: CIVILIAN (SPECIAL)
// The following block of code executes only if the player is in a CIVILIAN (SPECIAL) slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "bis_civ_special") exitwith {

#include "f\common\f_briefing_civ_special.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// ARMA 2 FACTIONS
// Briefings for the ArmA 2 Vanilla factions

// ====================================================================================

// RUSSIA

if (_unitfaction == "ru") exitwith {

#include "f\common\f_briefing_ru.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// OPFOR INSURGENTS

if (_unitfaction == "ins") exitwith {

#include "f\common\f_briefing_ins.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// USMC

if (_unitfaction == "usmc") exitwith {

#include "f\common\f_briefing_usmc.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// CDF

if (_unitfaction == "cdf") exitwith {

#include "f\common\f_briefing_cdf.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// NAPA

if (_unitfaction == "gue") exitwith {

#include "f\common\f_briefing_gue.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};
// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

player globalchat format ["DEBUG (briefing.sqf): Faction %1 is not defined.",_unitfaction];