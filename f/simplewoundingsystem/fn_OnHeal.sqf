// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// runs on the healer.
_unit = _this select 0;
_healer = _this select 1;
_ret = false;

if(_unit == _healer && _unit getVariable ["revive_down",false] ) then{_ret = true};

// if unit is bleeding, stop bleeding
if(_unit getVariable ["revive_bleeding",false]) then
{
	[[_unit,false], "f_fnc_SetBleeding", _unit] spawn BIS_fnc_MP;
};

// if unit is down and healer is not down himself (aka _ret), revive him.
if(_unit getVariable ["revive_down",false] && !_ret) then
{
	[[_unit,false], "f_fnc_SetDowned", true] spawn BIS_fnc_MP;
};
_ret