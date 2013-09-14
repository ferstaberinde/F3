private ["_grp","_colorTeam"];
_grp = _this select 0;
_unit = _this select 1;
waitUntil {!isnil "f_TeamLeaderSync" && !isnil "f_var_debugMode"};
// if he is still alive and groupLeader
while{_unit == (leader _grp) && alive _unit} do
{
	{
		// if unit in my group is alive lets check his teamColor
		if(alive _x) then
		{
			_colorTeam = ((assignedTeam _x) call f_getColorMarker);
			// if _colorTeam is not equal to whatever is set on the unit we must update the other units in the group
			if((_x getvariable ["assignedTeam","ColorWhite"]) != _colorTeam) then
			{
				// debug messages
				if (f_var_debugMode == 1) then {player sidechat format["%1 ---- %2 by %3",(_x getvariable ["assignedTeam","ColorWhite"])	,_colorTeam,_unit];};
				// sends a call to each unit in the group to call f_setLocalMarkerVar with the [x_colorTeam] as args.
				[[_x,_colorTeam] , "f_setLocalMarkerVar", (units _grp), false] spawn BIS_fnc_MP;

			};
		};

	} foreach units _grp;
	sleep 3;
};
// if the group is not gone.
if(!isnil "_grp") then
{
	// get the new leader
	_x = leader _grp;
	// tell him to start running the sync.
	[[_grp,_x] , "f_TeamLeaderSync",_x, false] spawn BIS_fnc_MP;
};