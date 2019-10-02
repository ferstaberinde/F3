// F3 - Assign Gear Script - AI
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// SERVER CHECK
// Make sure that the script is only run on the server

if !(isServer) exitWith {};

// ====================================================================================

// SETUP CUSTOM VARIABLES

// The default gear type picked when no corresponding entry is found in the _unitClasses array
// Set _defaultclass to "" to let these units keep their default gear
// Be careful not to apply armed loadouts to units that should not be armed (e.g. civilians)
private _defaultclass = "";

// The factions that should be ignored
private _excludeFactions = ["civ_f","blu_gen_f"];
// Other factions:
//["blu_f","blu_t_f","opf_f","opf_t_f","ind_f","ind_c_f","blu_g_f","opf_g_f","ind_g_f"


// The unit classes and their corresponding F3 Assign Gear Component type
private _unitClasses = [

	["_unarmed_"	,	""		],
	["_officer_"	,	"co"	],
	["_colonel_"	,	"co"	],
	["_sl_"			,	"dc"	],
	["_tl_"			,	"ftl"	],
	["_lite_"		,	"car"	],
	["_ar_"			,	"ar"	],
	["_aar_"		,	"aar"	],
	["_a_"			,	"aar"	],
	["_lat_"		,	"rat"	],
	["_medic_"		,	"m"		],
	["_gl_"			,	"gren"	],
	["_exp_"		,	"eng"	],
	["_engineer_"	,	"engm"	],
	["_mg_"			,	"mmgg"	],
	["_amg_"		,	"mmgag"	],
	["_at_"			,	"matg"	],
	["_aat_"		,	"matag"	],
	["_aa_"			,	"msamg"	],
	["_aaa_"		,	"msamag"],
	["_uav_"		,	"uav"	],
	["_jtac_"		,	"jtac"	],
	["_m_"			,	"dm"	],
	["_sniper_"		,	"sn"	],
	["_spotter_"	,	"sp"	],
	["_diver_"		,	"div"	],
	["_repair_"		,	"vd"	],
	["_crew_"		,	"vd"	],
	["_helipilot_"	,	"pp"	],
	["_helicrew_"	,	"pc"	],
	["_pilot_"		,	"pp"	],

	//Syndikat Units
	["_Para_1_"		,	"r"		],
	["_Para_2_"		,	"ftl"	],
	["_Para_3_"		,	"m"		],
	["_Para_4_"		,	"ar"	],
	["_Para_5_"		,	"rat"	],
	["_Para_6_"		,	"gren"	],
	["_Para_7_"		,	"car"	],
	["_Para_8_"		,	"eng"	],
	["_Bandit_1_"		,	"m"		],
	["_Bandit_2_"		,	"rat"	],
	["_Bandit_3_"		,	"ar"	],
	["_Bandit_4_"		,	"ftl"	],
	["_Bandit_5_"		,	"r"		],
	["_Bandit_6_"		,	"gren"	],
	["_Bandit_7_"		,	"car"	],
	["_Bandit_8_"		,	"engm"	],

	["_soldier_"	,	"r"		]
	// No comma after the last array!

];

// ====================================================================================

// Interpret parameters
private _units = if (count _this == 0) then [{waitUntil {scriptDone f_script_setLocalVars};f_var_men},{_this}];

//Only process units that have not been touched by the F3 Assign Gear Component
_units = _units select { ! (_x getvariable ["f_var_assignGear_done", false]) };
//Only process non-playerableUnits
_units = _units select {!(_x in playableUnits) && (_x isKindOf "Man")};

// LOOP THROUGH AI UNITS AND ASSIGN GEAR
{
	sleep 0.1;
	private _unit = _x;
	private _faction = toLower ([_unit] call f_fnc_virtualFaction);

	// If the unit's faction is allowed, proceed
	if !(_faction in _excludeFactions) then {

		// If the unit's classname corresponds to a class in the assignment array, use that gear class
		private _classIndex = _unitClasses findIf {toLower (typeOf _unit) find toLower (_x select 0) != -1};

		//Set the class to the _defaultclass or the one found in the _unitClasses array.
		private _class = _defaultclass;
		if (_classIndex != -1) then {
			_class = _unitClasses select _classIndex select 1;
		};

		// Set the gear according to the class
		if (_class != "") then {
			[_class, _unit] remoteExecCall ["f_fnc_assignGear", _unit];
		};

	} else {
		// If the faction is not allowed, set the assignGear variable to true to ignore the unit from now on
		_x setvariable ["f_var_assignGear_done", true,true];
	};
} foreach _units;
