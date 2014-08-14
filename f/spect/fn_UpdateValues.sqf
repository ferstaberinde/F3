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
	ctrlMapAnimClear ((findDisplay 9228) displayCtrl 1350);
	((findDisplay 9228) displayCtrl 1350) ctrlMapAnimAdd [0.3, f_cam_map_zoom,visiblePosition (camTarget f_cam_camera)];
	ctrlMapAnimCommit ((findDisplay 9228) displayCtrl 1350);
    f_cam_units = allGroups;
	f_cam_players = call F_fnc_GetPlayers;
	if(alive f_cam_curTarget) then
	{
		ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
	}
	else
	{
		ctrlSetText [1000,format ["Spectating:%1", "Dead"]];
	};
	_listBox =  2100;


	_tempArr = [];
	if(f_cam_playersOnly) then
	{
		_tempArr = f_cam_players;
	}
	else
	{
		_tempArr = f_cam_units;
	};
	{
		if(!(_x in f_cam_listUnits)) then
		{
			_text = toString(toArray(groupID _x) - [45]);
			_index = lbAdd [_listBox,_text];
			_x SetVariable ["f_spect_listBoxIndex",_index];
			f_cam_listUnits = f_cam_listUnits + [_x];
			lbSetColor [_listBox,_index,[side _x,false] call BIS_fnc_sideColor];
			{
				if(alive _x) then
					{
						if(!(_x in f_cam_listUnits) && !(_x iskindof "VirtualMan_F")) then
						{
							f_cam_listUnits = f_cam_listUnits + [_x];
							_text = "	" + name _x;
							_index = lbAdd [_listBox,_text];
							_x SetVariable ["f_spect_listBoxIndex",_index];
						};
					};
			} foreach units _x;
		};
	} foreach _tempArr;
	{
		_index = _x GetVariable ["f_spect_listBoxIndex",-1];
		if(typeName _x == "GROUP") then
		{
			if(_index >= 0 && ({alive _x} count units _x) > 0 && {lbText [_listBox,_index] != (toString(toArray(groupID _x) - [45]))}) then
			{
				// there is no lbSetText, so just punt it out of the list and fix it up there..
				lbDelete [_listBox,_index];
				f_cam_listUnits = f_cam_listUnits - [_x];
				[] call f_cam_checkIndex;
			};
			if(({alive _x} count units _x) <= 0  && _index >= 0) then
			{
				lbDelete [_listBox,_index];
				f_cam_listUnits = f_cam_listUnits - [_x];
				[] call f_cam_checkIndex;
			};
		}
		else
		{

			if(_index >= 0 && alive _x && {lbText [_listBox,_index] != "	" + name _x}) then
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
		};
	} foreach f_cam_listUnits;
	sleep 1;
};