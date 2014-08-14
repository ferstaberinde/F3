// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
// draw tags
if(!f_cam_toggleTags) exitWith{};
{
	if(alive _x && {_x isKindOf "SoldierWB"} && !(_x iskindof "VirtualMan_F") && ([] call f_cam_GetCurrentCam) distance _x <= 500 || {alive _x && (count crew _x) > 0 && !(_x iskindof "VirtualMan_F") && ([] call f_cam_GetCurrentCam) distance _x <= 500}) then
	{
		if(vehicle _x == _X || vehicle _x != _x && (crew vehicle _x) select 0 == _x) then
		{
			_visPos = visiblePositionASL _x;
			if(!(surfaceIsWater _visPos)) then {_visPos = ASLtoATL (_visPos)};
			_color = [side _x] call BIS_fnc_sideColor;
			_color = [_color select 0,_color select 1,_color select 2,0.6];
			_str = "";
			if(f_cam_toggleTagsName && alive _x && isPlayer _x) then
			{
				_str = name _x;
			};
			// _x call F_fnc_GetIcon
			drawIcon3D [gettext (configfile >> "CfgVehicles" >> typeOf (vehicle _x) >> "icon"), _color,[_visPos select 0,_visPos select 1,(_visPos select 2) +2.2], 1, 1, 0,_str, 2, 0.04, "TahomaB"];
		};
	};
} forEach allunits;

