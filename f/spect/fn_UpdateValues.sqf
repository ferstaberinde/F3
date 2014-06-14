// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================

// updaes values for the units listbox.
f_cam_checkIndex =
{
	{
		_x SetVariable ["f_spect_listBoxIndex",_forEachIndex];
	} foreach f_cam_listUnits;
};
while {true} do
{
    f_cam_units = allunits;
	f_cam_players = call F_fnc_GetPlayers;
	f_cam_units = f_cam_units - f_cam_players;
	f_cam_units = f_cam_players + f_cam_units;
	f_spect_locMarker setMarkerPosLocal getpos f_cam_curTarget;
	f_spect_locMarker setMarkerDirLocal (direction f_cam_curTarget);
	if(alive f_cam_curTarget) then
	{
		ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
	}
	else
	{
		ctrlSetText [1000,format ["Spectating:%1", "Dead"]];
	};
	_listBox =  2100;
	//lbClear _listBox;
	_tempArr = f_cam_units;
	if(f_cam_playersOnly) then
	{
		_tempArr = f_cam_players;
	};
	{
		if(alive _x) then
		{
			if(!(_x in f_cam_listUnits) && !(_x iskindof "VirtualMan_F")) then
			{
				f_cam_listUnits = f_cam_listUnits + [_x];
				_index = lbAdd [_listBox,name _x];
				_x SetVariable ["f_spect_listBoxIndex",_index];
				lbSetColor [_listBox,_index,[side _x,false] call BIS_fnc_sideColor];
			};
		};
	} foreach _tempArr;
	{
		_index = _x GetVariable ["f_spect_listBoxIndex",-1];
		if(_index >= 0 && alive _x && {lbText [_listBox,_index] != name _x}) then
		{
			// there is no lbSetText, so just punt it out of the list and fix it up there..
			lbDelete [_listBox,_index];
			f_cam_listUnits = f_cam_listUnits - [_x];
			[] call f_cam_checkIndex;
		};
		if(!alive _x) then
		{
			if(_index >= 0) then
			{
				lbDelete [_listBox,_index];
				f_cam_listUnits = f_cam_listUnits - [_x];
				[] call f_cam_checkIndex;
			};
		};
	} foreach f_cam_listUnits;
	sleep 5;
};