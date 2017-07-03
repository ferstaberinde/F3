params ["_unit"];
_unit switchMove ((getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit >> "interpolateTo")) select 0);
(vehicle _unit) addAction  ["Pull out wounded", {_this remoteExec ["f_fnc_EjectWounded"];}, nil, 5, false, true, "", "[_target] call f_fnc_HasWounded", 5];
