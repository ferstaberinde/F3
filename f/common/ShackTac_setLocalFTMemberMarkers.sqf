// F3 - ShackTactical Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

{
	[_x, 0, "ColorYellow"] execVM "f\common\ShackTac_localFTMemberMarker.sqf";
}
forEach units (group player);

// ====================================================================================

if (true) exitWith {};
