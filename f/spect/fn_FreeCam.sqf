// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// inital
f_cam_angle = 360;
f_cam_zoom = 3;
f_cam_height = 3;
f_cam_fovZoom = 1.2;
_centerX = safeZoneX + safeZoneW/2;
_centerY = safezoneY + safeZoneH/2;
f_cam_camera camSetFov 1.2;
// simple..
// ====================================================================================
waitUntil {

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
	if(f_cam_mode == 3) then
	{
		cameraEffectEnableHUD true;

		_currPos = getposASL f_cam_freecamera;
		_mX = 0;
		_mY = 0;
		_mZ = 0;
		_accel = 0.8;
		_accelshift = 2;
		if(f_cam_freecam_buttons select 0) then // W
		{
			if(f_cam_shift_down) then
			{
				_mY = _accelshift;
			}
			else
			{
				_mY = _accel;
			};
		};
		if(f_cam_freecam_buttons select 1) then // S
		{
			if(f_cam_shift_down) then
			{
				_mY = -_accelshift;
			}
			else
			{
				_mY = -_accel;
			};
		};
		if(f_cam_freecam_buttons select 2) then // A
		{
			if(f_cam_shift_down) then
			{
				_mX = -_accelshift;
			}
			else
			{
				_mX = -_accel;
			};
		};

		if(f_cam_freecam_buttons select 3) then // D
		{
			if(f_cam_shift_down) then
			{
				_mX = _accelshift;
			}
			else
			{
				_mX = _accel;
			};
		};
		if(f_cam_freecam_buttons select 4) then // Q
		{
			_mZ = 0.5;
		};
		if(f_cam_freecam_buttons select 5) then // Z
		{
			_mZ = -0.5;
		};

		_rX = (f_cam_angleX + 360) % 360;

		_x = (_currPos select 0) + (_mX * (cos f_cam_angleX)) + (_mY * (sin f_cam_angleX));
		_y = (_currPos select 1) - (_mX * (sin f_cam_angleX)) + (_mY * (cos f_cam_angleX));
		_z = (_currPos select 2) + _mZ;
		f_cam_freecamera setPosASL [_x,_y,_z max (getTerrainHeightASL [_x,_y])];
		f_cam_freecamera setDir f_cam_angleX;
		[f_cam_freecamera,f_cam_angleY,0] call BIS_fnc_setPitchBank;
	};
	false
};
// ====================================================================================