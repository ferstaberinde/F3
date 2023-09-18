// F3 - Caching Script Group Uncacher
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

{
	_x enableSimulationGlobal true;
	_x hideObjectGlobal false;

	// If the group leader is moving, set his group back next to him
	if (speed leader _this > 0 && vehicle _x == _x) then {
		_x setPosATL [(formationPosition _x) select 0, (formationPosition _x) select 1, 0];
	};

	if (vehicle _x != _x) then {(vehicle _x) hideObjectGlobal false};

	sleep 0.1;
} forEach units _this;

true
