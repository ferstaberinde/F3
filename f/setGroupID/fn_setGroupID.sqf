// F3 - Set Group ID Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES
private ["_grp"];

// Check first if the group exists

_grp = missionNamespace getVariable[(_this select 0),grpNull];
if(!isNull _grp) then {
	_grp setGroupId [(_this select 1),"GroupColor0"];
};
