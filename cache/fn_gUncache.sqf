/*
ws_fnc_gUncache
Latest: 15.01.2014

based on Black Mamba's work, which in turn is based on Nou and Jaynus' work. (All credit to them)

FEATURE
Enables Simulation and AI behaviour on all units but the group leader (or vehicle crew). Moves all disabled units out of view.
*/

 {
    _x enableSimulationGlobal true;
    _x hideObjectGlobal false;


    // If the group leader is moving, set his group back next to him
    if (speed leader _this > 0 && vehicle _x == _x) then {
    	_x setPosATL (formationPosition _x);
	};

	if (vehicle _x != _x) then {(vehicle _x) hideObjectGlobal false};

sleep 0.1;
} forEach units _this;

true