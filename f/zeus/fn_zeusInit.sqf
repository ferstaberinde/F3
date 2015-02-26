// // F3 Zeus Support  - Initialization
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES

private ["_unit","_addons","_objects","_curator","_createModule"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_unit = [_this,0,objNull] call bis_fnc_param;
_addons = [_this,1,[],["",true,[]]] call bis_fnc_param;
_objects = [_this,2,[],[objNull,true,[],west]] call bis_fnc_param;
_announce = [_this,3,false] call bis_fnc_param;

// ====================================================================================

// SETUP CURATOR

// Exit if no unit was passed
if (isNull _unit) exitWith {};

// Exit if no unit was passed
if !(isNull (getAssignedCuratorLogic _unit)) exitWith {
	diag_log format ["DEBUG (f\zeus\fn_zeusInit.sqf): ZEUS already assigned to %1.",_unit];
	systemchat format ["DEBUG (f\zeus\fn_zeusInit.sqf): ZEUS already assigned to %1.",_unit];
};

// Exit if the unit is not a player
if !(isPlayer _unit) exitWith {
	diag_log format ["DEBUG (f\zeus\fn_zeusInit.sqf): Did not assign ZEUS to %1 because it is not under control of a player.",_unit];
	systemchat format ["DEBUG (f\zeus\fn_zeusInit.sqf): Did not assign ZEUS to %1 because it is not under control of a player.",_unit];
};

// Make sure a side logic exists, if not create it
if (isNil "f_var_sideCenter") then {
	f_var_sideCenter = createCenter sideLogic;
	publicVariable "f_var_sideCenter";
};

// Create a new curator logic
_curator = (createGroup f_var_sideCenter) createUnit ["ModuleCurator_F",[0,0,0] , [], 0, ""];

// Assign the passed unit as curator
_unit assignCurator _curator;

//Add desired addons
[_curator,_addons] spawn f_fnc_zeusAddAddons;

//Add desired objects
[_curator,_objects] spawn f_fnc_zeusAddObjects;

// Reduce costs for all actions
_curator setCuratorWaypointCost 0;
{_curator setCuratorCoef [_x,0];} forEach ["place","edit","delete","destroy","group","synchronize"];

// Check if F3 AI Skill Selector is active and assign corresponding event-handler
if({!isNil _x} count ["f_param_AISkill_BLUFOR","f_param_AISkill_INDP","f_param_AISkill_OPFOR"] > 0) then {
    _curator addEventHandler ['CuratorObjectPlaced',{{[[_x],"f_fnc_setAISkill",_x,false,true] spawn BIS_fnc_MP;} forEach crew(_this select 1)}];
};

// If announce is set to true, the new curator will be announced to all players
if (_announce) then {
	[["Alert",[format ["%1 has become curator!",name _unit]]],"BIS_fnc_showNotification",true] call BIS_fnc_MP;
};

// ====================================================================================

// Return the newly created curator
_curator