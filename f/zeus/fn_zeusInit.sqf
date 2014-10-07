if (!isServer) exitWith {};

private ["_unit","_addons","_objects","_curator"];

_unit = [_this,0,objNull,[objNull]] call bis_fnc_param;
_addons = [_this,1,true,["",true,[]]] call bis_fnc_param;
_objects = [_this,2,true,[objNull,true,[]]] call bis_fnc_param;
_announce = [_this,3,false,[false]] call bis_fnc_param;

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

if (_announce) then {
	[["Alert",[format ["%1 has become curator!",name _units]]],"BIS_fnc_showNotification",true] call BIS_fnc_MP;
};

_curator