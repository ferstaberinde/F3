/* ws_getEPos
Returns the position of an entitiy

*/

_e = _this;
_pos = [];

//Getting a good position from the parsed values
switch (typename _e) do {
	case "STRING": {_pos = getMarkerPos _e};
	case "OBJECT": {_pos = getPosATL _e};
	case "GROUP": {_pos = getPosATL (leader _e)};
	case "LOCATION": {_pos = position _e};
	default {[_posloc,["ARRAY","OBJECT","STRING","GROUP"],"ws_fnc_getPos"] call ws_fnc_typecheck;};
};

_pos