// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// ====================================================================================

// SET KEY VARIABLES

params [
	["_obj", objNull, [objNull]],
	["_pos", [0,0,0], [[]]],
	["_height", 0, [0]]
];

// ====================================================================================

// LOCALITY CHECK
// The component should not run anywhere else but where the unit is local by default
// This check is a redundancy to ensure this

if !(local _obj) exitWith {};

// ====================================================================================

// SET DISPERSION

private _dispersion = 100; // The maximum dispersion for units when HALO jumping
private _dispersionHeight = 15; //The maximum dispersion in height when HALO jumping
if (_height == 0) then {
	_dispersion = 10;
	_dispersionHeight = 0;
};

// ====================================================================================

// HANDLING VEHICLES

if ( ! (_obj isKindOf "CAManBase") ) then {
	// Disable dispersion, so that the vehicle can be placed exactly where we want.
	// e.g. on roads, where no obstacles are in the way.
	_dispersion = 0;

	if (_height == 0) then {
		private _emptyPosition = (_pos findEmptyPosition [0, 150, typeOf _obj]);
		if (count _emptyPosition >= 2) then {
			_pos = _emptyPosition;
		}
	};
};

// ====================================================================================

// TELEPORT UNITS

// Make sure the _pos array has 3 elements and set the height
_pos set [2, _height];

_pos = _pos vectorAdd [random _dispersion - random _dispersion, random _dispersion - random _dispersion, random _dispersionHeight - random _dispersionHeight];
_obj setPos _pos;

// Display a notification that the teleport is done
// Note: crew on a man returns a single element array containing that man
["MapClickTeleport",[f_var_mapClickTeleport_textDone]] remoteExecCall ["BIS_fnc_showNotification", (crew _obj) select {isPlayer _x}];

// ====================================================================================

// HALO

// If unit or vehicle is paradropping, a parachute is added
if (_height > 0) then {
	[_obj] spawn f_fnc_mapClickTeleportParachute;
};
