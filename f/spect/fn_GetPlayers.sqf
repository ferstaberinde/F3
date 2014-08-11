// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// gets all the player groups and filter out the AI.
private ["_arr"];
_arr = [];
{
	if({isPlayer _x} count (units _x) > 0) then {_arr = _arr + [_x]};

} foreach allGroups;
_arr
