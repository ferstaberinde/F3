#include "\a3\functions_f_mp_mark\Revive\defines.inc"
// F3 - SimpleWoundingSystem
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
params ["_veh", "", "_action"];
_veh removeAction (_action);
if(isServer) then {
    {
        if(_x getVariable ["#revDownInVeh", false]) then
        {
            _originalOwnerId = _x getVariable["#revOwner", -1];
            if(_originalOwnerId != -1) then {
                [_x] remoteExec ["f_fnc_reInhabitBody", _originalOwnerId];
            };
        };
    } forEach crew _veh;
};
