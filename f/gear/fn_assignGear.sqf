// F3 - Folk Assign Gear Script (Client-side)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Run this script only on players
if (isServer && isDedicated) exitWith {};

// Declare Variables
_typeofUnit = toLower (_this select 0);
_unit = _this select 1;

// Bounce it to the server
[[_typeOfUnit,_unit],"f_fnc_assignGearS",false,true] call BIS_fnc_MP;