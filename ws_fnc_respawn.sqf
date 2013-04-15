//WIP

_unit = _this select 0;
_args = _this select 1;
_respawns = _this select 2;  

//UNIT RESPAWN
//Every 5 seconds we'll get a headcount of the group and if it's zero, a new group with the same conditions will spawn
//To make this work we have to spawn a script run in parallel, as we can't use sleep in call space (where this function is run)
//and don't need to check every frame, which a while loop without sleep does

if (_respawns) > 0 then {
	[_unit,_args] spawn {
		_unit = _this select 0;
		_args = _this select 1;
		
		if (typename _unit == "OBJECT") then {_grp = group (crew _unit select 0);};
		if (typename _unit == "GROUP") then {_grp = _unit};

		while {_check > 0} do {
			_check = {alive _x} count (units _grp);
			sleep 5;
		};
		
		if (typename _unit == "GROUP") then {_unit = _args call ws_fnc_createGroup};
		if (typename _unit == "OBJECT") then {_unit = _args call ws_fnc_createVehicle};
		_respawns = _respawns - 1;
		waituntil {!(isNil "_unit")};
		[_unit,_args,(_respawns - 1)] call ws_fnc_respawn;
	};
};

[_grp,_respawns]