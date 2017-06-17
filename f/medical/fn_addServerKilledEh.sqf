_unit = _this select 0;
_originalOwnerId = _this select 1;
_eh = _unit addEventHandler ["Killed",f_fnc_reviveEhKilledInVeh];
diag_log format["adding event handler %1", _eh];
_unit setVariable ["f3_revive_ehKilled", _eh];