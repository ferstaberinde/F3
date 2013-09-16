//ws_fnc_selectRandom
/*
FEATURE
Get a random value from an array
(As Bis_fnc_selectRandom is bugged: https://dev-heaven.net/issues/69439)

USAGE
[array] call ws_fnc_selectRandom

RETURNS
random selection
*/

_selection = _this select (floor (random (count _this)));
[_selection,["ARRAY"],format ["ws_fnc_selectRandom: %1",_selection]] call ws_fnc_typecheck;

_selection