// F3 - Curator Init
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES

private ["_unit","_addons","_objects","_curator"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_unit = [_this,0,objNull,[objNull]] call bis_fnc_param;
_addons = [_this,1,true,["",true,[]]] call bis_fnc_param;
_objects = [_this,2,true,[objNull,true,[]]] call bis_fnc_param;
_announce = [_this,3,false,[false]] call bis_fnc_param;

// ====================================================================================

// SETUP CURATOR

// Exit if no unit was passed
if (isNull _unit) exitWith {};

// Make sure a side logic exists, if not create it
if (isNil "f_var_sideCenter") then {
	f_var_sideCenter = createCenter sideLogic;
	publicVariable "f_var_sideCenter";
};

// Create the curator module and set it up properly
_curator = (createGroup f_var_sideCenter) createUnit ["ModuleCurator_F",[0,0,0] , [], 0, ""];
_curator setVariable ["Addons",3];
_curator setVariable ["owner",format["%1",_unit]];

// Assign the passed unit as curator
_unit assignCurator _curator;

//Add desired addons
[_curator,_addons] call f_fnc_zeusAddAddons;

//Add desired objects
[_curator,_objects] call f_fnc_zeusAddObjects;

// Reduce costs for all actions
_curator setCuratorWaypointCost 0;
{_curator setCuratorCoef [_x,0];} forEach ["place","edit","delete","destroy","group","synchronize"];

// If announce is set to true, the new curator will be announced to all players
if (_announce) then {
	[["Alert",[format ["%1 has become curator!",name _units]]],"BIS_fnc_showNotification",true] call BIS_fnc_MP;
};

// Return the newly created curator
_curator