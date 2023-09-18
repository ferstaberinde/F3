// F3 - Mission Maker Teleport
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// REMOVE ACTION
// Remove the action if we don't have any uses left

if (isNil "f_mapClickTeleportAction") exitWith {};

f_var_mapClickTeleport_Used = f_var_mapClickTeleport_Used + 1;

if (f_var_mapClickTeleport_Uses != 0 && f_var_mapClickTeleport_Used >= f_var_mapClickTeleport_Uses) then {
	player removeAction f_mapClickTeleportAction;
};
