// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
// draw tags
if(!f_cam_toggleTags || f_cam_mapMode == 2 ) exitWith{};
{
	_drawUnits = [];
	_drawGroup = false;
	_isPlayerGroup = false;
	{
		_distToCam = (call f_cam_GetCurrentCam) distance _x;
		if(isPlayer _x) then {_isPlayerGroup = true};
		if(_distToCam < 200) then
		{
			_drawUnits pushBack _x;
		}
		else
		{
			_drawGroup = true;
		};
	} foreach units _x;
	_color = switch (side _x) do {
	    case blufor: {f_cam_blufor_color};
	    case opfor: {f_cam_opfor_color};
	    case independent: {f_cam_indep_color};
	    case civilian: {f_cam_civ_color};
	    default {f_cam_empty_color};
	};
	if(_drawGroup) then {
		_visPos = getPosATLVisual leader _x;
		if(surfaceIsWater _visPos) then  {_visPos = getPosASLVisual leader _x;};
		if(_isPlayerGroup) then {
			_color set [3,0.7];
		}
		else {
			_color set [3,0.4];
		};
		_str = _x getVariable ["f_cam_nicename",""];
		if(_str == "") then {
			_str = (toString(toArray(groupID (_x)) - [45]));
			_x setVariable ["f_cam_nicename",_str];
		};
		drawIcon3D ["\A3\ui_f\data\map\markers\nato\b_inf.paa", _color,[_visPos select 0,_visPos select 1,(_visPos select 2) +30], 1, 1, 0,_str, 2, 0.02];
	};

	{
		if(vehicle _x == _x && alive _x || vehicle _x != _x && (crew vehicle _x) select 0 == _x && alive _x) then
		{
			_visPos = getPosATLVisual _x;
			if(surfaceIsWater _visPos) then  {_visPos = getPosASLVisual _x;};
			_color set [3,0.6];
			_str = "";
			_icon = "\A3\ui_f\data\map\markers\military\dot_CA.paa";
			if(isPlayer _x) then
			{
				_str = name _x;
			};
			drawIcon3D [_icon, _color,[_visPos select 0,_visPos select 1,(_visPos select 2) +3], 0.7, 0.7, 0,_str, 1, 0.02];
		};
	} foreach _drawUnits;


} forEach allGroups;
