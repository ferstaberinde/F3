// F2 - Multiplayer Ending Controller 
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
// Not used.

// ====================================================================================

// CREATE TRIGGER
// This trigger listens for a new f_endSelected value, then calls f_mpEndReceiver.sqf
// when fired. That script will then dynamically change this same trigger to become
// the appropriate end trigger, and then fire it.

f_trgEndReceiver = createTrigger ["EmptyDetector", [7,7]];
f_trgEndReceiver setTriggerArea [0,0,0,false];
f_trgEndReceiver setTriggerActivation ["NONE","PRESENT",false];
f_trgEndReceiver setTriggerType "SWITCH";
f_trgEndReceiver setTriggerStatements ["f_endSelected != -1;","this = [] execVM 'f\common\f_mpEndReceiver.sqf';",""];

// ====================================================================================

if (true) exitWith {};
