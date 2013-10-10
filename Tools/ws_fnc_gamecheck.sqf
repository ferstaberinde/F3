/*ws_fnc_selectRandom
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Checks whether A2:CO or A3 is running

USAGE
[] call ws_fnc_gameCheck

RETURNS
"a2" for ARMA2 (all versions)
"a3" for ARMA3
*/

_game = productVersion; //if productversion doesn't work we're on a A2 version <1.62
if (isNil "_game") then {_game == "a2"} else {
if (_game select 1 != "ARMA3") then {_game = "a2"} else {_game = "a3"}};

if (isNil "ws_game_a3") then {
	switch (_game) do {
	case "a2": {ws_game_a3 = false;};
	case "a3": {ws_game_a3 = true;};
	};
publicvariable "ws_game_a3";};

_game