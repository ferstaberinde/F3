//input must be whole number; roll will be 1/input; e.g.: input of 5 will give 1/5 chance
_chance = round(_this select 0) - 1;
_result = false;
_roll = round(random(_chance));
if (_roll == _chance) then {_result = true};

_result