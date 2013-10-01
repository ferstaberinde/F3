// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================

// updaes values for the units listbox.
while {true} do
{
    f_cam_units = allunits;
	f_cam_players = call f_cam_getPlayers;
	ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
	_listBox = 2100;
	lbClear _listBox;
	if(f_cam_playersOnly) then
	{
		{
			if(alive _x) then
			{
				_index = lbAdd [_listBox,name _x];
			};
		} foreach f_cam_players;

	};
	if(!f_cam_playersOnly) then
	{
		{
			if(alive _x) then
			{
				_index = lbAdd [_listBox,name _x];
			};
		} foreach f_cam_units;

	};
	sleep 5;
};