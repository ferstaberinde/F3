#include "\a3\functions_f_mp_mark\Revive\defines.inc"
// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
_veh = _this select 0;
_ret = false;
{

	if(_x getVariable ["#revDownInVeh", false]) then
	{
		_ret = true;
	};
}	foreach crew _veh;
_ret