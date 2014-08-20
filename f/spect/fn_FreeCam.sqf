// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// inital
f_cam_angle = 360;
f_cam_zoom = 3;
f_cam_height = 3;
f_cam_fovZoom = 0.7;
_centerX = safeZoneX + safeZoneW/2;
_centerY = safezoneY + safeZoneH/2;

f_cam_camera camSetFov 0.7;
// simple..
while{true} do
{

	// if freemode.
	f_cam_camera camSetFov f_cam_fovZoom;
	if(f_cam_mode == 0) then
	{
			cameraEffectEnableHUD true;
			_commitTime = ((1.0 - ((speed vehicle f_cam_curTarget)/65))/3) max 0.1;
			_delta = (-(2*(0.3 max f_cam_zoom)));
			_zLevel = sin(f_cam_angleY)*(2*(0.3 max f_cam_zoom));
			//_pos = getpos f_cam_curTarget;
			_visPos = visiblePositionASL f_cam_curTarget;
			if(!(surfaceIsWater _visPos)) then {_visPos = ASLtoATL (_visPos)};
			f_cam_fakecamera camSetPos [_visPos select 0,_visPos select 1,(_visPos select 2) + 1.5];
			f_cam_fakecamera camCommit _commitTime;
			f_cam_camera camSetRelPos[(sin(f_cam_angleX)*_delta)*cos(f_cam_angleY), (cos(f_cam_angleX)*_delta)*cos(f_cam_angleY), _zLevel];
			f_cam_camera camCommit _commitTime;
	};
	// first person
	if(f_cam_mode == 1) then
	{
//		player setpos (getpos cameraOn);
		if(vehicle cameraOn != cameraOn) then
		{
			_mode = "internal";
			if(gunner (vehicle cameraon) == cameraon) then {_mode = "gunner"};
			if(driver (vehicle cameraon) == cameraon) then {_mode = "gunner"};
			if(commander (vehicle cameraon) == cameraon) then {_mode = "gunner"};
			vehicle cameraOn switchCamera _mode;
		};
		if(vehicle cameraOn == cameraOn && !f_cam_ads) then
		{
			cameraon switchCamera "internal";
		};
	};
};
