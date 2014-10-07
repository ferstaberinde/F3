fa_fnc_createCurator = {

        if (!isServer) exitWith {};

        _unit = _this;

        if (isNil "f_var_sideCenter") then {
                f_var_sideCenter = createCenter sideLogic;
        };

        _curator = (createGroup f_var_sideCenter) createUnit ["ModuleCurator_F",[0,0,0] , [], 0, ""];
        _curator setVariable ["Addons",3];
        _unit assignCurator _curator;


         _cfgPatches = configfile >> "cfgpatches";
        for "_i" from 0 to (count _cfgPatches - 1) do {
            _class = _cfgPatches select _i;    if (isclass _class) then {_addons set [count _addons,configname _class];};
        };


        _curator addcuratoraddons _addons;

        _curator addCuratorEditableObjects [(vehicles+allUnits),true];

        _curator setCuratorWaypointCost 0;

        {_curator setCuratorCoef [_x,0];} forEach ["place","edit","delete","destroy","group","synchronize"];

};

publicVariable "fa_fnc_createCurator";

[player,"fa_fnc_createCurator",false] call BIS_fnc_MP;