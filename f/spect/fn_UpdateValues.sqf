// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
_listBox =  2100;
// updaes values for the units listbox.
f_cam_checkIndex =
{
	{
		_x SetVariable ["f_spect_listBoxIndex",_forEachIndex];
	} foreach f_cam_listUnits;
};

// ====================================================================================
while {true} do
{
	// ====================================================================================
	// make the mini map track the player.

	ctrlMapAnimClear ((findDisplay 9228) displayCtrl 1350);
	((findDisplay 9228) displayCtrl 1350) ctrlMapAnimAdd [0.3, f_cam_map_zoom,visiblePosition (camTarget f_cam_camera)];
	ctrlMapAnimCommit ((findDisplay 9228) displayCtrl 1350);
	ctrlSetFocus ((findDisplay 9228) displayCtrl 1315);
	// ====================================================================================
	// update string.
	if(alive f_cam_curTarget) then
	{
		ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
	}
	else
	{
		ctrlSetText [1000,format ["Spectating:%1", "Dead"]];
	};
	// ====================================================================================
	// fetch units
	_groupArr = call F_fnc_GetPlayers;
    f_cam_units = ((_groupArr select 0) + (_groupArr select 1));
	f_cam_players = _groupArr select 0;
	// ====================================================================================
	// get the list for players or players/ai
	_tempArr = [];
	if(f_cam_playersOnly) then
	{
		_tempArr = f_cam_players;
	}
	else
	{
		_tempArr = f_cam_units;
	};

	// ====================================================================================
	// Check it and see if they have been added already
	{
		if(!(_x in f_cam_listUnits) && ({alive _x} count units _x) > 0 ) then
		{
			_text = toString(toArray(groupID _x) - [45]);
			_index = lbAdd [_listBox,_text];
			_x SetVariable ["f_spect_listBoxIndex",_index];
			f_cam_listUnits pushBack _x;
			lbSetColor [_listBox,_index,[side _x,false] call BIS_fnc_sideColor];
			{
				if(alive _x) then
					{
						if(!(_x in f_cam_listUnits) && !(_x iskindof "VirtualMan_F")) then
						{
							 f_cam_listUnits pushBack _x;
							_text = "	" + name _x;
		//					if(!isPlayer _x) then
		//					{
		//						_text = "	"+ "*AI*";
		//					};
							_index = lbAdd [_listBox,_text];
							_x SetVariable ["f_spect_listBoxIndex",_index];
						};
					};
			} foreach units _x;
		};
	} foreach _tempArr;

	// ====================================================================================
	// Check if they died etc.

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
			_val = lbText [_listBox,_index] != "	" + name _x;
		//	if(!isPlayer _x) then
		//	{
		//		_val = lbText [_listBox,_index] != "	"+ "*AI*";
		//	};
			if(_index >= 0 && alive _x && _val ) then
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