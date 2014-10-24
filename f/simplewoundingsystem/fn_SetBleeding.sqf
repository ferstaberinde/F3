_unit = _this select 0;
_value = _this select 1;

_unit setVariable ["f_wound_bleeding",_value];
if(!_value) then {[] spawn f_fnc_WoundedEffect;};