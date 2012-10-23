// F2 - ShackTactical Fireteam Member Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
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
