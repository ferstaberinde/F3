private ["_grp","_colorTeam"];
_grp = _this select 0;
_unit = _this select 1;
while{_unit == (leader _grp) && alive _unit} do
{
	{
		if(alive _x) then
		{
			_colorTeam = ((assignedTeam _x) call f_getColorMarker);

			if((_x getvariable ["assignedTeam","ColorWhite"]) != _colorTeam) then
			{
				player sidechat format["%1 ---- %2 by %3",(_x getvariable ["assignedTeam","ColorWhite"])	,_colorTeam,_unit];
				[[_x,_colorTeam] , "f_setLocalMarkerVar", (units _grp), false] spawn BIS_fnc_MP;

			};
		};
	
	} foreach units _grp;
	sleep 3;
};
if(!isnil "_grp") then
{
	_x = leader _grp;
	[[_grp,_x] , "f_TeamLeaderSync",_x, false] spawn BIS_fnc_MP;
};