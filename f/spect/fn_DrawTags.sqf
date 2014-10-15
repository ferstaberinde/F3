// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
// draw tags
if(!f_cam_toggleTags || f_cam_mapMode == 2 ) exitWith{};
{
	if({isPlayer _x} count units _x > 0) then
	{
		_visPos = getPosVisual leader _x;
		_color = [side _x] call BIS_fnc_sideColor;
		_color = [_color select 0,_color select 1,_color select 2,0.3];
		_str = (toString(toArray(groupID _x) - [45]));
		drawIcon3D ["\A3\ui_f\data\map\markers\nato\b_inf.paa", _color,[_visPos select 0,_visPos select 1,(_visPos select 2) +100], 1, 1, 0,_str, 2, 0.02, "TahomaB"];
	};
	{
		if(alive _x && {_x isKindOf "CAManBase"} && !(_x iskindof "VirtualMan_F") && (call f_cam_GetCurrentCam) distance _x < 1000) then
		{
			if(vehicle _x == _x || vehicle _x != _x && (crew vehicle _x) select 0 == _x) then
			{
				_visPos = getPosVisual _x;
				_color = [side _x] call BIS_fnc_sideColor;
				_color = [_color select 0,_color select 1,_color select 2,0.6];
				_str = "";
				if(f_cam_toggleTagsName && alive _x && isPlayer _x) then
				{
					_str = name _x;
				};
				drawIcon3D [gettext (configfile >> "CfgVehicles" >> typeOf (vehicle _x) >> "icon"), _color,[_visPos select 0,_visPos select 1,(_visPos select 2) +2.2], 0.5, 0.5, 0,_str, 1, 0.04, "TahomaB"];
			};
		};
	} foreach units _x;
} forEach allGroups;

