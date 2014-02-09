// F3 - Caching Script Group Uncacher
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

 {
        if(_x != leader _this && !("Driver" in assignedVehicleRole _x)) then {
                        _x allowDamage true;
                        _x enableSimulation true;

                        _x enableAI "TARGET";
                        _x enableAI "AUTOTARGET";
                        _x enableAI "ANIM";
                        _x enableAI "FSM";
        };
        _x hideObject false;
        if (vehicle _x != _x) then {(vehicle _x) hideObject false};

} forEach units _this;

true