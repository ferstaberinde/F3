// F3 - Caching Script Group Uncacher
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

 {
        if(_x != leader _this && !("Driver" in assignedVehicleRole _x)) then {
                        _x enableSimulationGlobal true;
        };
        _x hideObjectGlobal false;
        if (vehicle _x != _x) then {(vehicle _x) hideObjectGlobal false};

sleep 0.1;
} forEach units _this;

true