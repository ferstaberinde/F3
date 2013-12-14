// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// inital
f_cam_angle = 360;
f_cam_zoom = 3;
f_cam_height = 3;



// simple..
while{true} do
{



	// if freemode.
	if(f_cam_mode == 0) then
	{

		cameraEffectEnableHUD true;

		_target = visiblePosition (camTarget f_cam_camera);
		_point = getpos f_cam_camera;
		_pointX = _point select 0;
		_pointY = _point select 1;
		_pointZ = _point select 2;
		_targetX = _target select 0;
		_targetY = _target select 1;
		_targetZ = _target select 2;



		_point =  [(_target select 0) + (sin((f_cam_angle))*f_cam_zoom) , (_target select 1) + (cos((f_cam_angle))*f_cam_zoom) ,f_cam_height];
		_valueX = 0.03;
		_valueY = 0.03;
		if(f_cam_mShift) then
		{
			_valueY = 0.05;
			_valueX = 0.1;
		};

		f_cam_camera camSetPos _point;
		if(f_cam_detlaX > (safezonew/6)*3) then
		{
			_max = 1 max f_cam_detlaX;
			f_cam_angle = f_cam_angle - _valueX*(abs(f_cam_detlaX-1));
		};
		if(f_cam_detlaX < -((safezonew/6)*3)+1) then
		{
			f_cam_angle = f_cam_angle + _valueX*(abs(f_cam_detlaX));
		};
		if (f_cam_detlaY > (safezoneh/6)*3) then
		{
			f_cam_height = f_cam_height - _valueY*(abs(f_cam_detlaY-1));
		};
		if (f_cam_detlaY < -((safezoneh/6)*3)+1)then
		{
			f_cam_height = f_cam_height +  _valueY*(abs(f_cam_detlaY));
		};
		f_cam_height = 0.3 max f_cam_height;
		f_cam_zoom = 0.3 max f_cam_zoom;
		if(f_cam_mode == 0) then
		{
		f_cam_camera camCommit 0;

		waitUntil {(camCommitted f_cam_camera)};
		};
	};
	// first person
	if(f_cam_mode == 1) then
	{
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
