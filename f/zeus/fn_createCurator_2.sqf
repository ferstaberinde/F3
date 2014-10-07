if (!isServer) exitWith {};

_unit = [[_this],0,objNull,[objNull]] call bis_fnc_param;

if (isNull _unit) exitWith {};

// Make sure a side logic exists, if not create it
if (isNil "f_var_sideCenter") then {
	f_var_sideCenter = createCenter sideLogic;
};

// Create the curator module and set it up properly
_curator = (createGroup f_var_sideCenter) createUnit ["ModuleCurator_F",[0,0,0] , [], 0, ""];
_curator setVariable ["Addons",3];
_curator setVariable ["owner",format["%1",_unit]];

// Assign the passed unit as curator
_unit assignCurator _curator;

// Add all allowed addons to curator list
_cfgPatches = configfile >> "cfgpatches";
for "_i" from 0 to (count _cfgPatches - 1) do {
	_class = _cfgPatches select _i;
	if (isclass _class) then {_addons set [count _addons,configname _class];};
};
_curator addcuratoraddons _addons;

// Add all active units to curator lists
_curator addCuratorEditableObjects [(vehicles+allUnits),true];

// Reduce costs for all actions
_curator setCuratorWaypointCost 0;
{_curator setCuratorCoef [_x,0];} forEach ["place","edit","delete","destroy","group","synchronize"];