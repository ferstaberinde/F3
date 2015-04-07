disableSerialization;
_show = _this select 0;
_disp = findDisplay 9228;
if(f_cam_menuWorking) exitWith {};
if(_show && !f_cam_menuShown) then
{
	f_cam_menuWorking = true;
	f_cam_menuShown = true;
	{
		_pos = ctrlPosition (_disp displayCtrl _x);
		_pos set [1,(_pos select 1) + 0.03];
		(_disp displayCtrl _x) ctrlSetPosition _pos;
	} foreach f_cam_menuControls;
	{(_disp displayCtrl _x) ctrlCommit 0.6; } foreach f_cam_menuControls;
	waitUntil {ctrlCommitted (_disp displayCtrl (f_cam_menuControls select 0))};
	f_cam_menuWorking = false;
};
if(!_show && f_cam_menuShown) then
{
	f_cam_menuWorking = true;
	f_cam_menuShown = false;
	{
		_pos = ctrlPosition (_disp displayCtrl _x);
		_pos set [1,(_pos select 1) - 0.03];
		(_disp displayCtrl _x) ctrlSetPosition _pos;
	} foreach f_cam_menuControls;
	{(_disp displayCtrl _x) ctrlCommit 0.6; } foreach f_cam_menuControls;
	waitUntil {ctrlCommitted (_disp displayCtrl (f_cam_menuControls select 0))};
	f_cam_menuWorking = false;
};