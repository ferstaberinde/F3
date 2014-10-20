if(f_cam_mapMode == 0) exitWith {};
disableSerialization;
_fullmapWindow = _this select 0;
_camera = ([] call f_cam_GetCurrentCam);
_fullmapWindow drawIcon ["\A3\ui_f\data\GUI\Rsc\RscDisplayMissionEditor\iconCamera_ca.paa", [0,0,0,1],getpos _camera ,20,20,getDir _camera,"",0];
{
	_pos = getpos _x;
	_x1 = _pos select 0;
	_y = _pos select 1;
	if(alive _x) then
	{
		_name = "";
		if(isPlayer _x) then {_name = name _x};
		if(leader _x == _x && {isPlayer _x} count units _x > 0) then {_name = format["%1 - %2",toString(toArray(groupID (group _x)) - [45]),_name]};
		if(vehicle _x != _x && crew (vehicle _x) select 0 == _x || vehicle _x == _x) then
		{
			_icon = (vehicle _x getVariable ["f_cam_icon",""]);
			if(_icon == "") then {_icon = gettext (configfile >> "CfgVehicles" >> typeOf (vehicle _x) >> "icon");vehicle _x setVariable ["f_cam_icon",_icon]};
			_fullmapWindow drawIcon [_icon,[side _x] call BIS_fnc_sideColor,getpos _x,19,19,getDir (vehicle _x),_name,1];
		};
	};

} foreach allunits;
f_cam_fired = f_cam_fired - [objNull];
if(f_cam_tracerOn) then
{
	{
		if(!isNull  _x) then
		{
			_pos = getpos _x;
			_newPos = [(_pos select 0) + (3 * sin(getdir _x)), (_pos select 1) + (3 * cos(getdir _x)), _pos select 2];
			_fullmapWindow drawLine [_pos,_newPos,[1,0,0,1]];
		};
	} foreach f_cam_fired;
};

