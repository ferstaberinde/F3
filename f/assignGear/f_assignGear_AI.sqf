// F3 - Assign Gear Script - AI
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Make sure that the script is only run on the server

if (isServer) exitWith {};

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_unit","_faction","_unitFactions","_unitClasses"];

// ====================================================================================

// SETUP CUSTOM VARIABLES

// The factions of all units which should be affected
_unitFactions = ["blu_f", "opf_f", "ind_f","blu_g_f","opf_g_f","ind_g_f"];

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
	["_mg_"			,	"mgg"	],
	["_amg_"		,	"mmgag"	],
	["_at_"			,	"matg"	],
	["_aat_"		,	"matag"	],
	["_aa_"			,	"msamg"	],
	["_aaa_"		,	"msamag"],
	["_uav_"		,	"uav"	],
	["_m_"			,	"sn"	],
	["_sniper_"		,	"sn"	],
	["_spotter_"	,	"sp"	],
	["_diver_"		,	"div"	],
	["_repair_"		,	"vd"	],
	["_crew_"		,	"vd"	],
	["_helipilot_"	,	"pp"	],
	["_helicrew_"	,	"pc"	],
	["_pilot_"		,	"pp"	]

];

// ====================================================================================

// LOOP THROUGH AI UNITS AND ASSIGN GEAR

{

	sleep 0.1;
	_unit = _x;

	// Check if the unit was already touched by the F3 Assign Gear Component
	if (!(_unit getvariable ["f_var_assignGear_done", false]) && {_unit isKindOf "Man"}) then {


			_faction = toLower (faction _unit);
			// If the unit's faction is allowed, proceed
			if (_faction in _unitFactions) then {
				{
					// If the unit's classname corresponds to a class in the array, set it's gear accordingly
					if [toLower (_x select 0),toLower (typeOf _unit)] call BIS_fnc_inString exitWith {
						[[_unitClasses select 1, _unit], "f_fnc_assignGear", _unit] call BIS_fnc_MP;
					};

					// Otherwise set the default rifleman equipment
					[["r", _unit], "f_fnc_assignGear", _unit] call BIS_fnc_MP;

				} forEach _unitClasses;

			} else {
				// If the faction is not allowed, set the assignGear variable to true to ignore the unit from now on
				_x setvariable ["f_var_assignGear_done", true,true];
			};
	};
} foreach allUnits;
