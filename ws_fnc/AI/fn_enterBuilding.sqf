/*ws_fnc_enterBuilding
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Thanks to Rommel's CBA_fnc_taskDefend and Binesi's improved BIS_fnc_taskDefend

USAGE
Minimal
[[array of units],[array of buildings]] call ws_fnc_enterBuilding
Full
[[array of units],[array of buildings],treshold] call ws_fnc_enterBuilding

FEATURE
Have a selection of units enter take positions in a selection of buildings

RETURNS
Units that haven't been put into a building position
*/

private ["_debug","_building","_bpos","_bposarray","_bposleft","_bUnits","_mkr","_unit","_i"];
_debug = if !(isNil "ws_debug") then {ws_debug} else {false};

params [
	["_units", [], [[]]],
	["_barray", [], [[]]],
	["_threshold", 1.0, [0]] //Fraction of building positions that can be taken before building is considered "full"
];

if (!(_barray isEqualType [])) then {_barray = [_barray]};
if (_threshold <= 0) then {_threshold = 0.8};

// As long we have units and a more than one building we loop through either
while {count _units > 0 && count _barray > 0} do {

	_building = selectRandom _barray;
	_bposarray = [_building] call ws_fnc_getBpos;

	if (count _bposarray > 0) then {

		// Get variables to check if building can be used
		_bUnits = _building getVariable ["ws_bUnits",0];
		_bposleft = _building getVariable ["ws_bPosLeft",+_bposarray];

		// Loop until we find a good building
		while {count _barray > 0 && {count _bposLeft == 0 || (_bUnits / (count _bposarray) >= _threshold)}} do {
			_barray = _barray - [_building];

			_building = selectRandom _barray;
			_bposarray = _building getVariable ["ws_bPos",[]];
			if (count _bposarray == 0) then {_bposarray = [_building] call ws_fnc_getBpos;};

			// Get variables in order to check if building can be used
			_bUnits = _building getVariable ["ws_bUnits",0];
			_bposleft = _building getVariable ["ws_bPosLeft",+_bposarray];
		};

		// If no good building was found, exit.
		if (count _barray == 0) exitWith {};

		// Otherwise continue to place unit:
		_unit = selectRandom _units;
		_units = _units - [_unit];

		//Get a building position and remove it from the array
		_i = floor (random (count _bposleft));
		_bpos = _bposleft select _i;
		_bposleft deleteAt _i;

		// Set the new variables for the building
		_building setVariable ["ws_bPosLeft",_bposleft,true];
		_building setVariable ["ws_bUnits",_bUnits+1,true];

		// For the unit spawn code to have it enter the building
		[_unit,_bpos] spawn {
			params ["_unit","_pos"];

			_unit setVariable ["ws_bpos",_pos,true];
			_unit doMove _pos;

			waitUntil {_unit distance _pos < 5};
			(group _unit) setSpeedMode "Limited";
			sleep 1;

			// Wait 30 seconds for the unit to get ready
			for "_i" from 0 to 30 do {
				if (unitReady _unit || _unit distance _pos < 1) exitWith {};
				sleep 1;
			};

			//Check the distance to the building position and the distance between z-levels (if the unit got stuck)
			if (((getPosATL _unit) select 2) - (_pos select 2) < 0.2) then {
				_unit setPosATL _pos;
				_unit moveTo _pos;

					// Wait another 10 seconds for the unit to get ready
					for "_i" from 0 to 10 do {
						if (unitReady _unit || _unit distance _pos < 1) exitWith {};
						sleep 1;
					};
			};

			dostop _unit;

			_unit spawn ws_fnc_setInsidePos;

			(group _unit) setSpeedMode "NORMAL";
		};

		if (_debug) then {
			_mkr = createMarker [format ["%1-bpos",_unit],_bpos];
			_mkr setMarkerSize [0.5,0.5];
			_mkr setMarkerType "mil_dot";
			_mkr setMarkerColor "ColorGreen";
			["ws_fnc_enterbuilding DBG3: ",[_building,(count _bposarray),(count _bposleft)]," - building: bpos/bposleft"] call ws_fnc_debugText;
		};

		// If the building doesn't have any bpos or is filled, it's removed from the building-array
		if (count _bposleft == 0 || {(_bUnits+1)/count _bposarray >= _threshold}) then {_barray = _barray - [_building]};

	};
};

_units
