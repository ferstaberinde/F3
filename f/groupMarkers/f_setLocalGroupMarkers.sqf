// F3 - Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
	waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what faction the player's slot belongs to, and stores
// it in the private variable _unitfaction
params [
	["_unitfaction", toLower (faction (leader group player)), [""]]
];

// ====================================================================================

private _groups = [];

// Markers seen by players in NATO, NATO (Pacific) & CTRG slots.
if (_unitfaction in ["blu_f","blu_t_f","blu_ctrg_f"]) then {
	_groups = f_var_groupData_blufor_nato;
};

// Markers seen by players in FIA & CTRG slots.
if (_unitfaction in ["blu_g_f","blu_ctrg_f"]) then {
	_groups = f_var_groupData_blufor_fia;
};

// Markers seen by players in gendarmerie slots.
if (_unitfaction in ["blu_gen_f"]) then {
	_groups = f_var_groupData_blufor_gen;
};

// Markers seen by players in CSAT & CSAT (Pacific) slots.
if (_unitfaction in ["opf_f","opf_t_f"]) then {
	_groups = f_var_groupData_opfor_csat;
};

// Markers seen by players in OPFOR-FIA slots.
if (_unitfaction in ["opf_g_f"]) then {
	_groups = f_var_groupData_opfor_fia;
};

// Markers seen by players in AAF slots.
if (_unitfaction in ["ind_f"]) then {
	_groups = f_var_groupData_indfor_aaf;
};

// Markers seen by players in INDEPENDENT-FIA slots.
if (_unitfaction in ["ind_g_f"]) then {
	_groups = f_var_groupData_indfor_fia;
};

// Markers seen by players in SYNDIKAT slots.
if (_unitfaction in ["ind_c_f"]) then {
	_groups = f_var_groupData_indfor_syn;
};

// ====================================================================================

{
	_x params ["_group", "_icon", "_markerText", "_color", "_id"];
	if (_icon != "") then {
		if (_group find "Unit" >= 0) then {
			_x spawn f_fnc_localSpecialistMarker;
		} else {
			_x spawn f_fnc_localGroupMarker;
		};
	};
} forEach _groups;

// ====================================================================================
