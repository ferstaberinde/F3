// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Group IDs need to be set before the ORBAT listing can be created
waitUntil {scriptDone f_script_setGroupIDs};

// Define needed variables
private ["_orbatText", "_groups", "_precompileGroups"];
_orbatText = "<br />NOTE<br />
The ORBAT below is only accurate at mission start.<br />
<br />
ORBAT<br />";
_groups = [];
_hiddenGroups = [group F3_Precompile_East] + [group F3_Precompile_West];

{
	// Add to ORBAT if side matches, group isn't already listed, and group has players
	if ((side _x == side group player) && !(_x in _groups) && ({isPlayer _x} count units _x) > 0) then {
		_groups = _groups + [_x];
	};
} forEach allGroups;

// Remove groups we don't want to show
_groups = _groups - _hiddenGroups;

// Loop through the group, print out group ID and leader name
{
	_mkrName = format ["mkr_%1",_x];
	_orbatText = _orbatText + format["<marker name='%3'>%1</marker> %2", _x, name leader _x,_mkrname] + "<br />";
} forEach _groups;

// Insert final result into subsection ORBAT of section Notes
player createDiaryRecord ["diary", ["ORBAT", _orbatText]];
