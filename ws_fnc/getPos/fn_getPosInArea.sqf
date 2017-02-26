/* ws_fnc_getPosInArea
Latest: 11.10.2013
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Based on Moricky's BIS_fnc_randomPosTrigger

USAGE
[area] call ws_fnc_getPosInArea

PARAMETERS
1. Either trigger or marker (rectangle/ellipse)

FEATURE
Return a random position within a marker or trigger area

RETURNS
positional array
*/


private ["_count","_area","_shape","_center","_pos","_px","_py","_vector"];

_count = count _this;
_area = _this select 0;

_shape = "";
_center = [];
_pos = [_area] call ws_fnc_getEPos;
_dir = 360;

//Checking the variables we have against what is expected
[_area,["STRING","OBJECT"],"ws_fnc_getPosInAREA"] call ws_fnc_typecheck;

switch (typeName _area) do {
	case "OBJECT": { _center = getPos _area;_area = triggerarea _area;  _shape = _area select 3; _dir = _area select 2;};
	case "STRING":{ _center = getMarkerPos _area; _shape = MarkerShape _area; _dir = markerDir _area;_area = markerSize _area;};
};

if (typename _shape == typename "") then {
	switch (_shape) do {
		case "RECTANGLE": {_shape = true;};
		case "ELLIPSE": {_shape = false;};
		default {_shape=true};
	};
};

// Get random position

_pX = _area select 0;
_pY = _area select 1;

_vector = if (_shape) then {

	//--- Rectangle
	[
		(-_pX + 2 * random _pX),
		(-_pY + 2 * random _pY)
	];
} else {

	//--- Ellipse
	private ["_ranDir"];
	_ranDir = random 360;
	[
		(cos _ranDir * random _pX),
		(sin _ranDir * random _pY)
	];
};

// Rotate vector
_vector = +_vector;
_dir = -_dir;
_pX = _vector select 0;
_pY = _vector select 1;
_vector set [0, (cos _dir)*_px - (sin _dir)*_py];
_vector set [1, (sin _dir)*_px + (cos _dir)*_py];

// Return new position
_pos = [
	(_center select 0) + (_vector select 0),
	(_center select 1)+ (_vector select 1),
	0
];

_pos