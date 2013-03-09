// F3 - OA Assign Gear Clean Up
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DELETE PRE-COMPILE UNITS
// Two units are placed on the map (lower left-hand corner) to aid with the assignGear
// scripts. After a short while we delete these (so they do not confuse the spectator
// script).

sleep 3;
deleteVehicle F2_Precompile_East;
deleteVehicle F2_Precompile_West;

// ====================================================================================