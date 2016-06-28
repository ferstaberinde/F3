// F3 - Folk Group Markers - OPFOR
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MARKERS: OPFOR > CSAT
// Markers seen by players in CSAT & CSAT (Pacific) slots.

if (_unitfaction in ["opf_f","opf_t_f"]) then {
	["GrpCSAT_CO",_hq, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_DC",_hq, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_COV",_ifv, "COV", "ColorYellow"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_ASL",_hq, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_A1",_ft, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_A2",_ft, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_AV",_ifv, "AV", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_BSL",_hq, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_B1",_ft, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_B2",_ft, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_BV",_ifv, "BV", "ColorBlue"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_CSL",_hq, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_C1",_ft, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_C2",_ft, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_CV",_ifv, "CV", "ColorGreen"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_JSL",_hq, "JSL", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_J1",_ft, "J1", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_J2",_ft, "J2", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_JV",_ifv, "JV", "ColorPink"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_MMG1",_sup, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_MMG2",_sup, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_HMG1",_sup, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_MAT1",_lau, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_MAT2",_lau, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_HAT1",_lau, "HAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_MTR1",_mor, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_MSAM1",_lau, "MSAM1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_HSAM1",_lau, "HSAM1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_ST1",_rec, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_DT1",_rec, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_ENG1",_eng, "ENG1", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_IFV1",_ifv, "IFV1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_IFV2",_ifv, "IFV2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TNK1",_tnk, "TNK1", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_TH1",_hel, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH2",_hel, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH3",_hel, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH4",_hel, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH5",_hel, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH6",_hel, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH7",_hel, "TH7", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH8",_hel, "TH8", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_AH1",_hel, "AH1", "ColorRed"] spawn f_fnc_localGroupMarker;

	["UnitCSAT_CO_M",_med, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitCSAT_DC_M",_med, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitCSAT_ASL_M",_med, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitCSAT_BSL_M",_med, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitCSAT_CSL_M",_med, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
};

// ====================================================================================

// MARKERS: OPFOR > FIA
// Markers seen by players in OPFOR-FIA slots.

if (_unitfaction in ["opf_g_f"]) then {
	["GrpOFIA_CO",_hq, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_DC",_hq, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_COV",_ifv, "COV", "ColorYellow"] spawn f_fnc_localGroupMarker;

	["GrpOFIA_ASL",_hq, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_A1",_ft, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_A2",_ft, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_AV",_ifv, "AV", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpOFIA_BSL",_hq, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_B1",_ft, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_B2",_ft, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_BV",_ifv, "BV", "ColorBlue"] spawn f_fnc_localGroupMarker;

	["GrpOFIA_CSL",_hq, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_C1",_ft, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_C2",_ft, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_CV",_ifv, "CV", "ColorGreen"] spawn f_fnc_localGroupMarker;

	["GrpOFIA_JSL",_hq, "JSL", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_J1",_ft, "J1", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_J2",_ft, "J2", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_JV",_ifv, "JV", "ColorPink"] spawn f_fnc_localGroupMarker;

	["GrpOFIA_MMG1",_sup, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_MMG2",_sup, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_HMG1",_sup, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_MAT1",_lau, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_MAT2",_lau, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_HAT1",_lau, "HAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_MTR1",_mor, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_MSAM1",_lau, "MSAM1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_HSAM1",_lau, "HSAM1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_ST1",_rec, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_DT1",_rec, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_ENG1",_eng, "ENG1", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpOFIA_IFV1",_ifv, "TECH1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_IFV2",_ifv, "TECH2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_TNK1",_tnk, "TNK1", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpOFIA_TH1",_hel, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_TH2",_hel, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_TH3",_hel, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_TH4",_hel, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_TH5",_hel, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_TH6",_hel, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_TH7",_hel, "TH7", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpOFIA_TH8",_hel, "TH8", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpOFIA_AH1",_hel, "AH1", "ColorRed"] spawn f_fnc_localGroupMarker;

	["UnitOFIA_CO_M",_med, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitOFIA_DC_M",_med, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitOFIA_ASL_M",_med, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitOFIA_BSL_M",_med, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitOFIA_CSL_M",_med, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
};

// ====================================================================================