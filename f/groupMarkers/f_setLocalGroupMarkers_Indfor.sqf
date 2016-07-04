// F3 - Folk Group Markers - INDFOR
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MARKERS: INDEPEDENT > AAF
// Markers seen by players in AAF slots.

if (_unitfaction in ["ind_f"]) then {
	["GrpAAF_CO",_hq, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpAAF_DC",_hq, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpAAF_COV",_ifv, "COV", "ColorYellow"] spawn f_fnc_localGroupMarker;

	["GrpAAF_ASL",_hq, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpAAF_A1",_ft, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpAAF_A2",_ft, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpAAF_AV",_ifv, "AV", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpAAF_BSL",_hq, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpAAF_B1",_ft, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpAAF_B2",_ft, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpAAF_BV",_ifv, "BV", "ColorBlue"] spawn f_fnc_localGroupMarker;

	["GrpAAF_CSL",_hq, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpAAF_C1",_ft, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpAAF_C2",_ft, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpAAF_CV",_ifv, "CV", "ColorGreen"] spawn f_fnc_localGroupMarker;

	["GrpAAF_JSL",_hq, "JSL", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpAAF_J1",_ft, "J1", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpAAF_J2",_ft, "J2", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpAAF_JV",_ifv, "JV", "ColorPink"] spawn f_fnc_localGroupMarker;

	["GrpAAF_MMG1",_sup, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_MMG2",_sup, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_HMG1",_sup, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_MAT1",_lau, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_MAT2",_lau, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_HAT1",_lau, "HAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_MTR1",_mor, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_MSAM1",_lau, "MSAM1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_HSAM1",_lau, "HSAM1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_ST1",_rec, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_DT1",_rec, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_ENG1",_eng, "ENG1", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpAAF_IFV1",_ifv, "IFV1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_IFV2",_ifv, "IFV2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpAAF_TNK1",_tnk, "TNK1", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpAAF_TH1",_hel, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpAAF_TH2",_hel, "TH2", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpAAF_TH3",_hel, "TH3", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpAAF_TH4",_hel, "TH4", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpAAF_AH1",_hel, "AH1", "ColorRed"] spawn f_fnc_localGroupMarker;

	["UnitAAF_CO_M",_med, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitAAF_DC_M",_med, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitAAF_ASL_M",_med, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitAAF_BSL_M",_med, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitAAF_CSL_M",_med, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
};

// ====================================================================================

// MARKERS: INDEPENDENT > FIA
// Markers seen by players in INDEPENDENT-FIA slots.

if (_unitfaction in ["ind_g_f"]) then {
	["GrpIFIA_CO",_hq, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_DC",_hq, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_COV",_ifv, "COV", "ColorYellow"] spawn f_fnc_localGroupMarker;

	["GrpIFIA_ASL",_hq, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_A1",_ft, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_A2",_ft, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_AV",_ifv, "AV", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpIFIA_BSL",_hq, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_B1",_ft, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_B2",_ft, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_BV",_ifv, "BV", "ColorBlue"] spawn f_fnc_localGroupMarker;

	["GrpIFIA_CSL",_hq, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_C1",_ft, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_C2",_ft, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_CV",_ifv, "CV", "ColorGreen"] spawn f_fnc_localGroupMarker;

	["GrpIFIA_JSL",_hq, "JSL", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_J1",_ft, "J1", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_J2",_ft, "J2", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_JV",_ifv, "JV", "ColorPink"] spawn f_fnc_localGroupMarker;

	["GrpIFIA_MMG1",_sup, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_MMG2",_sup, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_HMG1",_sup, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_MAT1",_lau, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_MAT2",_lau, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_HAT1",_lau, "HAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_MTR1",_mor, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_MSAM1",_lau, "MSAM1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_HSAM1",_lau, "HSAM1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_ST1",_rec, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_DT1",_rec, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_ENG1",_eng, "ENG1", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpIFIA_IFV1",_ifv, "TECH1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_IFV2",_ifv, "TECH2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_TNK1",_tnk, "TNK1", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpIFIA_TH1",_hel, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_TH2",_hel, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_TH3",_hel, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_TH4",_hel, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_TH5",_hel, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_TH6",_hel, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_TH7",_hel, "TH7", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpIFIA_TH8",_hel, "TH8", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpIFIA_AH1",_hel, "AH1", "ColorRed"] spawn f_fnc_localGroupMarker;

	["UnitIFIA_CO_M",_med, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitIFIA_DC_M",_med, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitIFIA_ASL_M",_med, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitIFIA_BSL_M",_med, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitIFIA_CSL_M",_med, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
};

// ====================================================================================

// MARKERS: INDEPENDENT > SYNDIKAT
// Markers seen by players in SYNDIKAT slots.

if (_unitfaction in ["ind_c_f"]) then {
	["GrpSyn_CO",_hq, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpSyn_DC",_hq, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpSyn_COV",_ifv, "COV", "ColorYellow"] spawn f_fnc_localGroupMarker;

	["GrpSyn_ASL",_hq, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpSyn_A1",_ft, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpSyn_A2",_ft, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpSyn_AV",_ifv, "AV", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpSyn_BSL",_hq, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpSyn_B1",_ft, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpSyn_B2",_ft, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpSyn_BV",_ifv, "BV", "ColorBlue"] spawn f_fnc_localGroupMarker;

	["GrpSyn_CSL",_hq, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpSyn_C1",_ft, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpSyn_C2",_ft, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpSyn_CV",_ifv, "CV", "ColorGreen"] spawn f_fnc_localGroupMarker;

	["GrpSyn_JSL",_hq, "JSL", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpSyn_J1",_ft, "J1", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpSyn_J2",_ft, "J2", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpSyn_JV",_ifv, "JV", "ColorPink"] spawn f_fnc_localGroupMarker;

	["GrpSyn_MMG1",_sup, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_MMG2",_sup, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_HMG1",_sup, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_MAT1",_lau, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_MAT2",_lau, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_HAT1",_lau, "HAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_MTR1",_mor, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_MSAM1",_lau, "MSAM1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_HSAM1",_lau, "HSAM1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_ST1",_rec, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_DT1",_rec, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_ENG1",_eng, "ENG1", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpSyn_IFV1",_ifv, "TECH1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpSyn_IFV2",_ifv, "TECH2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpSyn_TNK1",_tnk, "TNK1", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpSyn_TH1",_hel, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpSyn_TH2",_hel, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpSyn_TH3",_hel, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpSyn_TH4",_hel, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpSyn_TH5",_hel, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpSyn_TH6",_hel, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpSyn_TH7",_hel, "TH7", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpSyn_TH8",_hel, "TH8", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpSyn_AH1",_hel, "AH1", "ColorRed"] spawn f_fnc_localGroupMarker;

	["UnitSyn_CO_M",_med, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitSyn_DC_M",_med, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitSyn_ASL_M",_med, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitSyn_BSL_M",_med, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
	["UnitSyn_CSL_M",_med, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
};

// ====================================================================================