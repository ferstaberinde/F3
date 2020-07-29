// F3 - Set Group IDs
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// Automatically assigns intelligible names to groups

// SET GROUP IDS
// Execute setGroupID Function for all factions
// Note: The actual group IDs are defined in f/groupMarkers/fn_groupData.sqf
{
	_x params ["_grp", "", "", "", "_id"];
	if (_id != "") then {
		[_grp, _id] call f_fnc_setGroupID;
	}
} forEach f_var_groupData_all;

// ====================================================================================

// Warn if there are groups with playable units that are not present in f_var_groupData_all
// Otherwise groups would show a generic name in the chat and in the ORBAT briefing page.
private _groupDataGroups = f_var_groupData_all apply {
		missionNamespace getVariable[_x select 0,grpNull]
	} select {
		_x isEqualType grpNull && {! (_x isEqualTo grpNull)}
	};

private _playableGroups = playableUnits select {
		roleDescription _x find " Reporter" < 0
	} apply {group _x};
_playableGroups = _playableGroups arrayIntersect _playableGroups;
private _groupsWithoutIDs = _playableGroups select {! (_x in _groupDataGroups)};
if (count _groupsWithoutIDs > 0) then {
	private _msg = format ["ERROR (f_setGroupIDs.sqf): %1 groups have no group ID set: %2", count _groupsWithoutIDs, _groupsWithoutIDs];
	systemChat _msg;
	diag_log _msg;
};
