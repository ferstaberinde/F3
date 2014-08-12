if(f_cam_mapMode != 2) exitWith {};
disableSerialization;
_displayDialog = (findDisplay 9228);
_fullmapWindow = _displayDialog displayCtrl 1360;
_camera = f_cam_camera;
switch(f_cam_mode) do
{
	case 0:
	{
  		_camera = f_cam_camera; // Standard
	};
	case 1:
	{
		_camera = cameraOn; // FP
	};
	case 3:
	{
		_camera = f_cam_freecamera; // freecam
	};
};

_fullmapWindow drawIcon ["\A3\ui_f\data\GUI\Rsc\RscDisplayMissionEditor\iconCamera_ca.paa", [0,0,0,1],getpos cameraOn ,20,20,getDir cameraOn,"",0];
{
	if(typeName _x == "Object") then
	{
		_name = "";
		_icon = "";
		if(isPlayer _x) then {_name = name _x};
		if(leader _x == _x && {isPlayer _x} count (units _x) > 0 ) then {_name = format["%1 %2",groupID (group _x),_name]};
		if(vehicle _x != _x && crew (vehicle _x) select 0 == _x) then {_icon = "\A3\ui_f\data\map\markers\military\box_CA.paa"};
		if(vehicle _x == _x) then {_icon = "\A3\ui_f\data\map\markers\military\triangle_CA.paa"};
		_fullmapWindow drawIcon [_icon,[side _x] call BIS_fnc_sideColor,getpos _x,19,19,getDir (vehicle _x),_name,1];
	};


} foreach f_cam_listUnits;

