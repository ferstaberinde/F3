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

[_this,["ARRAY"],format ["ws_fnc_selectRandom ERROR: %1",_this]] call ws_fnc_typecheck;
_selection = _this select (floor (random (count _this)));

_selection