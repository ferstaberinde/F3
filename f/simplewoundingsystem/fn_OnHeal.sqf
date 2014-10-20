// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// runs on the healer.
_unit = _this select 0;
_healer = _this select 1;
_ret = true;
[_unit,_healer] spawn {
	_unit = _this select 0;
	_healer = _this select 1;
	_t = 0;
	waitUntil {uiSleep 0.1;_t = _t + 0.5;(animationState _healer) == "ainvpknlmstpslaywrfldnon_medic" || _t > 5};
	_t = 0;
	waitUntil {uiSleep 0.1;_t = _t + 0.5;(animationState _healer) != "ainvpknlmstpslaywrfldnon_medic" || _t > 5};
	if ((time - _t) > 5) ExitWith {}; // adding a timeout is smart! waituntils are infinite, and can possible presist
	// if unit is bleeding, stop bleeding
	if(_unit getVariable ["f_wound_bleeding",false]) then
	{
		[[_unit,false], "f_fnc_SetBleeding", true] spawn BIS_fnc_MP;
	};

	// if unit is down , revive him.
	if(_unit getVariable ["f_wound_down",false] ) then
	{
		[[_unit,false], "f_fnc_SetDowned", true] spawn BIS_fnc_MP;
	};
};
_ret