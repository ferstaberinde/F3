// F3 - Set Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_i"];

// ====================================================================================

// SET KEY VARIABLES

_i = 1;

// ====================================================================================

// CHECK GROUP SIZE
// If the group isn't a full fireteam, leave teams as default.

if( (count (units (group player))) < 3 ) exitWith {};

// WAIT FOR GAME START

waitUntil{alive player};

sleep 3;

// SET TEAM COLOURS

{
	// If AR/AAR
	if( (_i == 2) or (_i == 3) ) then {

		_x assignTeam "RED";

	} else {

		_x assignTeam "BLUE";

	};


	_i = _i + 1;

} foreach units (group player);

// ===================================================================================== 

if (true) exitWith {};
