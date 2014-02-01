/* ws_fnc_checkHC
Checks whether client is headless client or not
*/

_hc = false;
if (! hasInterface && ! isServer) then {_hc = true} else {_hc = false};
if (isNil "ws_var_HC") then {ws_var_HC = "unassigned";};
if (_hc) then {ws_var_hc = name player; publicVariable "ws_var_hc";};

_hc