/* ws_getEPos
Returns the position of an entitiy

USAGE
entity call ws_fnc_getEPos;

PARAMETERS
1. Can be string (markername), object, groupname or location

RETURNS
positional array (ATL)
*/

private ["_e","_pos"];

_e = _this;
_pos = [];

//Getting a good position from the parsed values
switch (typename _e) do {
	case "STRING": {_pos = getMarkerPos _e};
	case "OBJECT": {_pos = getPosATL _e};
	case "GROUP": {_pos = getPosATL (leader _e)};
	case "LOCATION": {_pos = position _e};
	case "ARRAY": {_pos = _e;};
	default {[_e,["ARRAY","OBJECT","STRING","GROUP"],"ws_fnc_getEPos"] call ws_fnc_typecheck;};
};

_pos