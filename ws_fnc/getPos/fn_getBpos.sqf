/* WS_fnc_getBpos
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Thanks to Rommel's CBA_fnc_taskDefend and Binesi's improved BIS_fnc_taskDefend

FEATURE
Collect all building positions for a building.
Assign array variable (ws_bpos) to building containing all valid building positions.

USAGE
[building] call ws_fnc_getBpos

RETURNS
array containing all building positions
*/

private ["_debug","_bposarray","_mkr"];
_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};

params [
	["_building", objNull, [objNull]]
];

if isNil "_building" exitWith {};
_bposarray = _building getVariable ["ws_bPos",false];

if (!(_bposarray isEqualType [])) then {

	_bposarray = _building buildingPos -1;

	if (_debug) then {{_mkr = createMarker [format ["%1-bpos",_x],_x];_mkr setMarkerSize [0.3,0.3];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorWhite";} forEach _bposarray;};

	_building setVariable ["ws_bPos",_bposarray,true];
};

_bposarray
