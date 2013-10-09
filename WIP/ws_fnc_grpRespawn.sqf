/* ws_fnc_grpRespawn
Respawning AI group
*/

private ["_grp","_args","_respawns"];

_grp = _this select 0;
_args = _this select 1;
_respawns = _this select 2;

//Every 5 seconds we'll get a headcount of the group and if it's zero, a new group with the same conditions will spawn
//To make this work we have to spawn a script run in parallel, as we can't use sleep in call space (where this function is run)
//and don't need to check every frame, which a while loop without sleep does

if (_respawns > 0) then {
  _respawns = _respawns - 1;
	  [_grp,_param,_respawns] spawn {
	 	private ["_grp","_args"," _respawns","_check"];

		  _grp = _this select 0;
		  _args = _this select 1;
		  _respawns = _this select 2;

		  _check = count (units _grp);
		  while {_check > 0} do {
			 _check = {alive _x} count (units _grp);
			 sleep 5;
		  };
		  _grp = _args call ws_fnc_createGroup;
		  [_grp select 0,_grp select 1,_respawns] call ws_fnc_grpRespawn;
	  };
};