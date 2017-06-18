#include "\a3\functions_f_mp_mark\Revive\defines.inc"
// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
diag_log format ["%1 is going", _this];
_veh = _this select 0;

{
	if(_x getVariable ["#revDownInVeh", false]) then
	{
        _originalOwnerId = _x getVariable["#revOwner", 0];
        diag_log format ["telling %1 to reinhabit", _originalOwnerId];
        [_x] remoteExec ["f_fnc_reInhabitBody", _originalOwnerId];
	};
} forEach crew _veh;
_veh removeAction (_this select 2);