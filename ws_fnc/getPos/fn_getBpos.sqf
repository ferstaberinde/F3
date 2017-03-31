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

private ["_debug","_building","_bposarray","_i","_occupied"];
_debug = false; if !(isNil "ws_debug") then {_debug = ws_debug};

// Buildings to ignore
_badarray = [];

_building = _this select 0;
_bposarray = _building getVariable ["ws_bPos",false];
[_building,["OBJECT"],format ["ws_fnc_getBpos: %1",_building]] call ws_fnc_typecheck;
_i = 0;

if (typeName _bposarray != typeName []) then {

	_bposarray = [];
	_bp = _building buildingpos _i;

	while {str _bp != "[0,0,0]"} do {
		   if (count _bp == 3) then {
				_bposarray pushback (_bp);
			};

			_i = _i + 1;
			_bp = _building buildingpos _i;
	};

	if (_debug) then {{_mkr = createMarker [format ["%1-bpos",_x],_x];_mkr setMarkerSize [0.3,0.3];_mkr setMarkerType "mil_dot";_mkr setMarkerColor "ColorWhite";} forEach _bposarray;};

	_building setVariable ["ws_bPos",_bposarray,true];
};

//["ws_fnc_getBpos DBG1: ",[_building,(_building getVariable "ws_bpos"),_occupied],""] call ws_fnc_debugText;

_bposarray