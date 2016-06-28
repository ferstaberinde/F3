// F3 - Assign Gear Script - AI
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Make sure that the script is only run on the server

if !(isServer) exitWith {};

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_units","_unit","_faction","_known","_excludeFactions","_unitClasses"];

// ====================================================================================

// SETUP CUSTOM VARIABLES

// The default gear type picked when no corresponding entry is found in the _unitClasses array
// Set _defaultclass to "" to let these units keep their default gear
_defaultclass = "";

// The factions that should be ignored
_excludeFactions = ["civ_f","blu_gen_f"];
// Other factions:
//["blu_f","blu_t_f","opf_f","opf_t_f","ind_f","ind_c_f","blu_g_f","opf_g_f","ind_g_f"


// The unit classes and their corresponding F3 Assign Gear Component type
_unitClasses = [

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
	["_Bandit_8_"		,	"engm"	]

	// No comma after the last array!

];

// ====================================================================================

// Interpret parameters
_units = if (count _this == 0) then [{waitUntil {scriptDone f_script_setLocalVars};f_var_men},{_this}];

// LOOP THROUGH AI UNITS AND ASSIGN GEAR
{
	sleep 0.1;
	_unit = _x;

	// Check if the unit was already touched by the F3 Assign Gear Component
	if (!(_unit getvariable ["f_var_assignGear_done", false]) && {!(_unit in playableUnits) && (_unit isKindOf "Man")}) then {

			_faction = toLower (faction _unit);

			// If the unit's faction is allowed, proceed
			if !(_faction in _excludeFactions) then {
				_known = false;
				{
					_known = [toLower (_x select 0),toLower (typeOf _unit)] call BIS_fnc_inString;

					// If the unit's classname corresponds to a class in the assignment array, set it's gear accordingly
					if (_known) exitWith {
						[[_x select 1, _unit], "f_fnc_assignGear", _unit,false,true] call BIS_fnc_MP;
					};
				} forEach _unitClasses;

				// If the class is not in the _unitClasses array
				if (!_known) then {
					if (_defaultclass != "") then {
						[[_defaultclass, _unit], "f_fnc_assignGear", _unit,false,true] call BIS_fnc_MP;
					};
				};

			} else {
				// If the faction is not allowed, set the assignGear variable to true to ignore the unit from now on
				_x setvariable ["f_var_assignGear_done", true,true];
			};
	};
} foreach _units;
