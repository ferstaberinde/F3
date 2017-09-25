params ["_unit"];

_unit playMove ([_unit] call f_fnc_findDeadAnim);
(vehicle _unit) addAction  ["Pull out wounded", {_this remoteExec ["f_fnc_EjectWounded"];}, nil, 5, false, true, "", "[_target] call f_fnc_HasWounded", 5];
