// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
// draw tags
_ents = (getpos f_cam_camera) nearEntities [["CAManBase","LandVehicle","Helicopter","Plane","Ship_F"], 500];
{
	if(alive _x && {_x isKindOf "SoldierWB"} || {alive _x && (count crew _x) > 0}) then
	{
	_visPos = visiblePosition _x;
	_color = [side _x] call BIS_fnc_sideColor;
	_color = [_color select 0,_color select 1,_color select 2,0.6];
	drawIcon3D [_x call f_cam_getIcon, _color,[_visPos select 0,_visPos select 1,((getPosATL _x) select 2) +2], 0.6, 0.6, 90,"", 1, 0.05, "TahomaB"];
	};
} forEach _ents;

