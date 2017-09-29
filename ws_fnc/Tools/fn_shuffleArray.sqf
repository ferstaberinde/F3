//ws_fnc_shuffleArray
/*
FEATURE
Shuffles given array

USAGE
array call ws_fnc_shuffleArray

RETURNS
shuffled array
*/

_arr = param [0,[]];

for "_i" from 1 to (count _arr) do {
    _arr pushBack (_arr deleteAt floor random (count _arr));
};

_arr
