/* ws_fnc_checkHC
Checks whether client is headless client or not

SETS
- ws_var_isHC (bool) to true where client is HC
- ws_var_HCs  (array) contains all present HCs

RETURNS
true/false for HC/not-HC
*/

private _hc = false;
ws_var_isHC = false;
["ws_var_HCs",[],true] call ws_fnc_setGVar;

if (!hasInterface && !isServer) then {
	_hc = true;
	ws_var_isHC=true;

	if !(player in ws_var_HCs) then {
		ws_var_HCs pushback (player); publicVariable "ws_var_HCs";
	};
};

_hc
