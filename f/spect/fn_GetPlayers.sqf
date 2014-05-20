// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// gets all the playable units and filter out the AI.
private ["_arr"];
_arr = [];
{
	if(isplayer _x) then {_arr = _arr + [_x]};

} foreach playableunits;
_arr