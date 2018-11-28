// F3 - Set Group ID Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES
private ["_grp"];

params [
	["_grp_var", "", [""]],
	["_grp_id", "", [""]]
];

// Check first if the group exists

_grp = missionNamespace getVariable[_grp_var,grpNull];
if(!isNull _grp && _grp isEqualType grpNull) then {
	_grp setGroupId [_grp_id,"GroupColor0"];
};
