// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
// draw tags
if(!f_cam_toggleTags) exitWith{};
_ents = (getpos f_cam_camera) nearEntities [["CAManBase","LandVehicle","Helicopter","Plane","Ship_F"], 500];
{
	if(alive _x && {_x isKindOf "SoldierWB"} && !(_x iskindof "VirtualMan_F")|| {alive _x && (count crew _x) > 0 && !(_x iskindof "VirtualMan_F")}) then
	{
		_visPos = visiblePositionASL _x;
		if(!(surfaceIsWater _visPos)) then {_visPos = ASLtoATL (_visPos)};
		_color = [side _x] call BIS_fnc_sideColor;
		_color = [_color select 0,_color select 1,_color select 2,0.6];
		_str = "";
		if(f_cam_toggleTagsName && isPlayer _x && alive _x) then
		{
			_str = name _x;
		};
		drawIcon3D [_x call F_fnc_GetIcon, _color,[_visPos select 0,_visPos select 1,(_visPos select 2) +2.2], 1, 1, 0,_str, 1, 0.04, "TahomaB"];
	};
} forEach _ents;


