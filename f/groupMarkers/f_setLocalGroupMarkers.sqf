// F3 - Folk Group Markers
// Credits and documentation: https://github.com/folkarps/F3/wiki
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
	["_unitfaction", toLower ([leader group player] call f_fnc_virtualFaction), [""]]
];

// ====================================================================================

private _groups = [];

// Markers seen by players in NATO, NATO (Pacific) & NATO (Woodland) slots.
if (_unitfaction in ["blu_f","blu_t_f","blu_w_f","nato","natowoodland","natopacific"]) then {
	_groups = f_var_groupData_blufor_nato;
};

// Markers seen by players in FIA slots. Move "fia" to OPFOR FIA or INDFOR FIA if using them.
if (_unitfaction in ["blu_g_f","fia"]) then {
	_groups = f_var_groupData_blufor_fia;
};

// Markers seen by players in Gendarmerie slots.
if (_unitfaction in ["blu_gen_f"]) then {
	_groups = f_var_groupData_blufor_gen;
};

// Markers seen by players in CTRG slots.
if (_unitfaction in ["blu_ctrg_f","ctrg"]) then {
	_groups = f_var_groupData_blufor_ctrg;
};

// Markers seen by players in CSAT & CSAT (Pacific) slots.
if (_unitfaction in ["opf_f","opf_t_f","csat","csatpacific"]) then {
	_groups = f_var_groupData_opfor_csat;
};

// Markers seen by players in OPFOR-FIA slots. Add "fia" if using "fia" with Virtual Faction, and remove it from BLUFOR FIA.
if (_unitfaction in ["opf_g_f"]) then {
	_groups = f_var_groupData_opfor_fia;
};

// Markers seen by players in Spetsnaz slots.
if (_unitfaction in ["opf_r_f","spetsnaz"]) then {
	_groups = f_var_groupData_opfor_spetsnaz;
};

// Markers seen by players in NPR (Looters) slots.
if (_unitfaction in ["ind_l_f","npr"]) then {
	_groups = f_var_groupData_opfor_npr;
};

// Markers seen by players in AAF slots.
if (_unitfaction in ["ind_f","aaf"]) then {
	_groups = f_var_groupData_indfor_aaf;
};

// Markers seen by players in LDF slots.
if (_unitfaction in ["ind_e_f","ldf"]) then {
	_groups = f_var_groupData_indfor_ldf;
};

// Markers seen by players in INDEPENDENT-FIA slots. Add "fia" if using "fia" with Virtual Faction, and remove it from BLUFOR FIA.
if (_unitfaction in ["ind_g_f"]) then {
	_groups = f_var_groupData_indfor_fia;
};

// Markers seen by players in SYNDIKAT slots.
if (_unitfaction in ["ind_c_f","syndikat"]) then {
	_groups = f_var_groupData_indfor_syn;
};

// Markers seen by players in 3IFB (virtual) slots.
if (_unitfaction in ["3ifb"]) then {
	_groups = f_var_groupData_indfor_3ifb;
};

// Markers seen by players in Civilian slots.
if (_unitfaction in ["civ_f","civ_idap_f"]) then {
	_groups = f_var_groupData_civ;
};

// ====================================================================================

{
	_x params ["_grpName", "_icon", "_markerText", "_color", "_id"];
	if (_icon != "") then {
		// Note: if a group is defined in the mission file, it exists even when
		//       no players are in this group yet.
		private _grpOrUnit = missionNamespace getVariable [_grpName,objNull];
		if (_grpOrUnit isEqualType grpNull) then {
			_x spawn f_fnc_localGroupMarker;
		} else {
			_x spawn f_fnc_localSpecialistMarker;
		};
	};
} forEach _groups;

// ====================================================================================
