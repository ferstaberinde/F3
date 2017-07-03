#include "\a3\functions_f_mp_mark\Revive\defines.inc"
// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
params ["_veh"];
{ _x getVariable ["#revDownInVeh", false] } count crew _veh > 0
