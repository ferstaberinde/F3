_game = productVersion;
if (isNil "_game") then {_game == "a2"} else {_game = _game select 1};		//if productversion doesn't work we're on a A2 version <1.62
if (toLower _game != "arma3") then {_game == "a2"} else {_game == "a3"};	//let's simplify things, we're either on a2 or a3

_game