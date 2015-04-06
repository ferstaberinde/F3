f_cam_forcedExit = true;
closeDialog 1;
["f_spect_tags","onEachFrame"] call bis_fnc_removeStackedEventHandler;
["f_spect_cams","onEachFrame"] call bis_fnc_removeStackedEventHandler;
terminate f_cam_updatevalues_script;
(call f_cam_GetCurrentCam) cameraEffect ["terminate","back"];
hintSilent "Spectator system has been forcefully closed";
{
	_var = _x getVariable ["f_cam_fired_eventid",nil];
	if(!isNil "_var") then
	{
		_x removeEventHandler ["fired",_var];
	};

} foreach (allunits + vehicles);