// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
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

// If the unitfaction is different from the group leader's faction, the latters faction is used
if (_unitfaction != toLower (faction (leader group player))) then {_unitfaction = toLower (faction (leader group player))};

// As PMC units are used as exchange medics and engineers, they are defaulted to the UN briefing.
// Change "bis_un" to "bis_tk_gue" when using the TK Local Platoon
if (_unitfaction == "pmc_baf") then {_unitfaction = "bis_un"}; 

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Player faction: %1",_unitfaction];
	};

// ====================================================================================

// BRIEFING: NATO
// The following block of code executes only if the player is in a US slot; it 
// automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "BLU_F") exitwith {

#include "f\common\f_briefing_nato.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: IRAN
// The following block of code executes only if the player is in a BRITISH ARMED FORCES
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "OPF_F") exitwith {

#include "f\common\f_briefing_iran.sqf"

// DEBUG
	if (f_var_debugMode == 1) then
	{
	player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.",_unitfaction];
	};
};

// ====================================================================================

// BRIEFING: CIVILIAN
// The following block of code executes only if the player is in a BRITISH ARMED FORCES
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitfaction == "CIV_F") exitwith {

#include "f\common\f_briefing_civ.sqf"

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