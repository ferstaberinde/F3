_pos = _this select 0;
_dist = _this select 1;

_ret = [(_pos select 0) + (_dist - (random(2 * _dist))), (_pos select 1) + (_dist - (random(2 * _dist)))];

_ret