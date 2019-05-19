// ====================================================================================
// CONFIGURE MARKER TYPES
// Using the marker classes (https://community.bistudio.com/wiki/cfgMarkers) we setup a number of variables to define which type of marker should be used for which group
// Note: They can be overriden for each group individually

// Groups
private _hq  = "b_hq";          // Command elements
private _ft  = "b_inf";         // Fireteams
private _sup = "b_support";     // Support units (MMG,HMG)
private _lau = "b_motor_inf";   // Launchers (MAT, HAT)
private _mor = "b_mortar";      // Mortars
private _eng = "b_maint";       // Engineers
private _ifv = "b_mech_inf";    // IFVs & APCs
private _tnk = "b_armor";       // Tanks
private _rec = "b_recon";       // Recon (ST)
private _hel = "b_air";         // Helicopters
private _pla = "b_plane";       // Planes
private _art = "b_art";         // Artillery

// Specialists
private _med = "b_med";         // Medic
private _uav = "b_uav";         // UAV

// ====================================================================================

// Defining group data arrays. Each element consists of:
//     * Group variable name
//     * CfgMarkers class name. If this is an empty string, no marker will be shown
//     * Group marker text
//     * Group marker color
//     * Group Identity - as displayed in chat. Should be a empty string for non-groups

f_var_groupData_blufor_nato = [
	["GrpNATO_CO",     _hq,  "CO",     "ColorYellow",  "NATO CO -"],
	["GrpNATO_DC",     _hq,  "DC",     "ColorYellow",  "NATO DC -"],
	["GrpNATO_COV",    _ifv, "COV",    "ColorYellow",  "NATO COV -"],

	["GrpNATO_ASL",    _hq,  "ASL",    "ColorRed",     "NATO ASL -"],
	["GrpNATO_A1",     _ft,  "A1",     "ColorRed",     "NATO A1 -"],
	["GrpNATO_A2",     _ft,  "A2",     "ColorRed",     "NATO A2 -"],
	["GrpNATO_AV",     _ifv, "AV",     "ColorRed",     "NATO AV -"],

	["GrpNATO_BSL",    _hq,  "BSL",    "ColorBlue",    "NATO BSL -"],
	["GrpNATO_B1",     _ft,  "B1",     "ColorBlue",    "NATO B1 -"],
	["GrpNATO_B2",     _ft,  "B2",     "ColorBlue",    "NATO B2 -"],
	["GrpNATO_BV",     _ifv, "BV",     "ColorBlue",    "NATO BV -"],

	["GrpNATO_CSL",    _hq,  "CSL",    "ColorGreen",   "NATO CSL -"],
	["GrpNATO_C1",     _ft,  "C1",     "ColorGreen",   "NATO C1 -"],
	["GrpNATO_C2",     _ft,  "C2",     "ColorGreen",   "NATO C2 -"],
	["GrpNATO_CV",     _ifv, "CV",     "ColorGreen",   "NATO CV -"],

	["GrpNATO_JSL",    _hq,  "JSL",    "ColorPink",    "NATO JSL -"],
	["GrpNATO_J1",     _ft,  "J1",     "ColorPink",    "NATO J1 -"],
	["GrpNATO_J2",     _ft,  "J2",     "ColorPink",    "NATO J2 -"],
	["GrpNATO_JV",     _ifv, "JV",     "ColorPink",    "NATO JV -"],

	["GrpNATO_MMG1",   _sup, "MMG1",   "ColorOrange",  "NATO MMG1 -"],
	["GrpNATO_MMG2",   _sup, "MMG2",   "ColorOrange",  "NATO MMG2 -"],
	["GrpNATO_HMG1",   _sup, "HMG1",   "ColorOrange",  "NATO HMG1 -"],
	["GrpNATO_MAT1",   _lau, "MAT1",   "ColorOrange",  "NATO MAT1 -"],
	["GrpNATO_MAT2",   _lau, "MAT2",   "ColorOrange",  "NATO MAT2 -"],
	["GrpNATO_HAT1",   _lau, "HAT1",   "ColorOrange",  "NATO HAT1 -"],
	["GrpNATO_MTR1",   _mor, "MTR1",   "ColorOrange",  "NATO MTR1 -"],
	["GrpNATO_MSAM1",  _lau, "MSAM1",  "ColorOrange",  "NATO MSAM1 -"],
	["GrpNATO_HSAM1",  _lau, "HSAM1",  "ColorOrange",  "NATO HSAM1 -"],
	["GrpNATO_ST1",    _rec, "ST1",    "ColorOrange",  "NATO ST1 -"],
	["GrpNATO_DT1",    _rec, "DT1",    "ColorOrange",  "NATO DT1 -"],
	["GrpNATO_ENG1",   _eng, "ENG1",   "ColorOrange",  "NATO ENG1 -"],

	["GrpNATO_IFV1",   _ifv, "IFV1",   "ColorOrange",  "NATO IFV1 -"],
	["GrpNATO_IFV2",   _ifv, "IFV2",   "ColorOrange",  "NATO IFV2 -"],
	["GrpNATO_TNK1",   _tnk, "TNK1",   "ColorRed",     "NATO TNK1 -"],

	["GrpNATO_CAS1",   _pla, "CAS1",   "ColorOrange",  "NATO CAS1 -"],

	["GrpNATO_TH1",    _hel, "TH1",    "ColorRed",     "NATO TH1 -"],
	["GrpNATO_TH2",    _hel, "TH2",    "ColorRed",     "NATO TH2 -"],
	["GrpNATO_TH3",    _hel, "TH3",    "ColorBlue",    "NATO TH3 -"],
	["GrpNATO_TH4",    _hel, "TH4",    "ColorBlue",    "NATO TH4 -"],
	["GrpNATO_TH5",    _hel, "TH5",    "ColorGreen",   "NATO TH5 -"],
	["GrpNATO_TH6",    _hel, "TH6",    "ColorGreen",   "NATO TH6 -"],
	["GrpNATO_TH7",    _hel, "TH7",    "ColorOrange",  "NATO TH7 -"],
	["GrpNATO_TH8",    _hel, "TH8",    "ColorOrange",  "NATO TH8 -"],

	["GrpNATO_AH1",    _hel, "AH1",    "ColorRed",     "NATO AH1 -"],

	["UnitNATO_CO_M",  _med, "COM",    "ColorBlack",   ""],
	["UnitNATO_DC_M",  _med, "DCM",    "ColorBlack",   ""],
	["UnitNATO_ASL_M", _med, "AM",     "ColorBlack",   ""],
	["UnitNATO_BSL_M", _med, "BM",     "ColorBlack",   ""],
	["UnitNATO_CSL_M", _med, "CM",     "ColorBlack",   ""]
];

f_var_groupData_blufor_fia = [
	["GrpFIA_CO",      _hq,  "CO",     "ColorYellow",  "FIA CO -"],
	["GrpFIA_DC",      _hq,  "DC",     "ColorYellow",  "FIA DC -"],
	["GrpFIA_COV",     _ifv, "COV",    "ColorYellow",  "FIA COV -"],

	["GrpFIA_ASL",     _hq,  "ASL",    "ColorRed",     "FIA ASL -"],
	["GrpFIA_A1",      _ft,  "A1",     "ColorRed",     "FIA A1 -"],
	["GrpFIA_A2",      _ft,  "A2",     "ColorRed",     "FIA A2 -"],
	["GrpFIA_AV",      _ifv, "AV",     "ColorRed",     "FIA AV -"],

	["GrpFIA_BSL",     _hq,  "BSL",    "ColorBlue",    "FIA BSL -"],
	["GrpFIA_B1",      _ft,  "B1",     "ColorBlue",    "FIA B1 -"],
	["GrpFIA_B2",      _ft,  "B2",     "ColorBlue",    "FIA B2 -"],
	["GrpFIA_BV",      _ifv, "BV",     "ColorBlue",    "FIA BV -"],

	["GrpFIA_CSL",     _hq,  "CSL",    "ColorGreen",   "FIA CSL -"],
	["GrpFIA_C1",      _ft,  "C1",     "ColorGreen",   "FIA C1 -"],
	["GrpFIA_C2",      _ft,  "C2",     "ColorGreen",   "FIA C2 -"],
	["GrpFIA_CV",      _ifv, "CV",     "ColorGreen",   "FIA CV -"],

	["GrpFIA_JSL",     _hq,  "JSL",    "ColorPink",    "FIA JSL -"],
	["GrpFIA_J1",      _ft,  "J1",     "ColorPink",    "FIA J1 -"],
	["GrpFIA_J2",      _ft,  "J2",     "ColorPink",    "FIA J2 -"],
	["GrpFIA_JV",      _ifv, "JV",     "ColorPink",    "FIA JV -"],

	["GrpFIA_MMG1",    _sup, "MMG1",   "ColorOrange",  "FIA MMG1 -"],
	["GrpFIA_MMG2",    _sup, "MMG2",   "ColorOrange",  "FIA MMG2 -"],
	["GrpFIA_HMG1",    _sup, "HMG1",   "ColorOrange",  "FIA HMG1 -"],
	["GrpFIA_MAT1",    _lau, "MAT1",   "ColorOrange",  "FIA MAT1 -"],
	["GrpFIA_MAT2",    _lau, "MAT2",   "ColorOrange",  "FIA MAT2 -"],
	["GrpFIA_HAT1",    _lau, "HAT1",   "ColorOrange",  "FIA HAT1 -"],
	["GrpFIA_MTR1",    _mor, "MTR1",   "ColorOrange",  "FIA MTR1 -"],
	["GrpFIA_MSAM1",   _lau, "MSAM1",  "ColorOrange",  "FIA MSAM1 -"],
	["GrpFIA_HSAM1",   _lau, "HSAM1",  "ColorOrange",  "FIA HSAM1 -"],
	["GrpFIA_ST1",     _rec, "ST1",    "ColorOrange",  "FIA ST1 -"],
	["GrpFIA_DT1",     _rec, "DT1",    "ColorOrange",  "FIA DT1 -"],
	["GrpFIA_ENG1",    _eng, "ENG1",   "ColorOrange",  "FIA ENG1 -"],

	["GrpFIA_IFV1",    _ifv, "TECH1",  "ColorRed",     "FIA TECH1 -"],
	["GrpFIA_IFV2",    _ifv, "TECH2",  "ColorRed",     "FIA TECH2 -"],
	["GrpFIA_TNK1",    _tnk, "TNK1",   "ColorRed",     "FIA TNK1 -"],

	["GrpFIA_CAS1",    _pla, "CAS1",   "ColorOrange",  "FIA CAS1 -"],

	["GrpFIA_TH1",     _hel, "TH1",    "ColorRed",     "FIA TH1 -"],
	["GrpFIA_TH2",     _hel, "TH2",    "ColorRed",     "FIA TH2 -"],
	["GrpFIA_TH3",     _hel, "TH3",    "ColorBlue",    "FIA TH3 -"],
	["GrpFIA_TH4",     _hel, "TH4",    "ColorBlue",    "FIA TH4 -"],
	["GrpFIA_TH5",     _hel, "TH5",    "ColorGreen",   "FIA TH5 -"],
	["GrpFIA_TH6",     _hel, "TH6",    "ColorGreen",   "FIA TH6 -"],
	["GrpFIA_TH7",     _hel, "TH7",    "ColorOrange",  "FIA TH7 -"],
	["GrpFIA_TH8",     _hel, "TH8",    "ColorOrange",  "FIA TH8 -"],

	["GrpFIA_AH1",     _hel, "AH1",    "ColorRed",     "FIA AH1 -"],

	["UnitFIA_CO_M",   _med, "COM",    "ColorBlack",   ""],
	["UnitFIA_DC_M",   _med, "DCM",    "ColorBlack",   ""],
	["UnitFIA_ASL_M",  _med, "AM",     "ColorBlack",   ""],
	["UnitFIA_BSL_M",  _med, "BM",     "ColorBlack",   ""],
	["UnitFIA_CSL_M",  _med, "CM",     "ColorBlack",   ""]
];

f_var_groupData_blufor_gen = [
	["GrpGEN_CO",      _hq,  "CO",     "ColorYellow",  "Gendarmerie CO -"],
	["GrpGEN_DC",      _hq,  "DC",     "ColorYellow",  "Gendarmerie DC -"],
	["GrpGEN_A",       _hq,  "A",      "ColorRed",     "Gendarmerie Alpha -"],
	["GrpGEN_B",       _hq,  "B",      "ColorBlue",    "Gendarmerie Bravo -"],
	["GrpGEN_C",       _hq,  "C",      "ColorGreen",   "Gendarmerie Charlie -"],
	["GrpGEN_J",       _hq,  "J",      "ColorPink",    "Gendarmerie Juliet -"],
	["GrpGEN_MK",      _rec, "MK",     "ColorOrange",  "Gendarmerie Marksman -"],
	["GrpGEN_TH1",     _hel, "TH1",    "ColorOrange",  "Gendarmerie TH1 -"]
];

f_var_groupData_opfor_csat = [
	["GrpCSAT_CO",     _hq,  "CO",     "ColorYellow",  "CSAT CO -"],
	["GrpCSAT_DC",     _hq,  "DC",     "ColorYellow",  "CSAT DC -"],
	["GrpCSAT_COV",    _ifv, "COV",    "ColorYellow",  "CSAT COV -"],

	["GrpCSAT_ASL",    _hq,  "ASL",    "ColorRed",     "CSAT ASL -"],
	["GrpCSAT_A1",     _ft,  "A1",     "ColorRed",     "CSAT A1 -"],
	["GrpCSAT_A2",     _ft,  "A2",     "ColorRed",     "CSAT A2 -"],
	["GrpCSAT_AV",     _ifv, "AV",     "ColorRed",     "CSAT AV -"],

	["GrpCSAT_BSL",    _hq,  "BSL",    "ColorBlue",    "CSAT BSL -"],
	["GrpCSAT_B1",     _ft,  "B1",     "ColorBlue",    "CSAT B1 -"],
	["GrpCSAT_B2",     _ft,  "B2",     "ColorBlue",    "CSAT B2 -"],
	["GrpCSAT_BV",     _ifv, "BV",     "ColorBlue",    "CSAT BV -"],

	["GrpCSAT_CSL",    _hq,  "CSL",    "ColorGreen",   "CSAT CSL -"],
	["GrpCSAT_C1",     _ft,  "C1",     "ColorGreen",   "CSAT C1 -"],
	["GrpCSAT_C2",     _ft,  "C2",     "ColorGreen",   "CSAT C2 -"],
	["GrpCSAT_CV",     _ifv, "CV",     "ColorGreen",   "CSAT CV -"],

	["GrpCSAT_JSL",    _hq,  "JSL",    "ColorPink",    "CSAT JSL -"],
	["GrpCSAT_J1",     _ft,  "J1",     "ColorPink",    "CSAT J1 -"],
	["GrpCSAT_J2",     _ft,  "J2",     "ColorPink",    "CSAT J2 -"],
	["GrpCSAT_JV",     _ifv, "JV",     "ColorPink",    "CSAT JV -"],

	["GrpCSAT_MMG1",   _sup, "MMG1",   "ColorOrange",  "CSAT MMG1 -"],
	["GrpCSAT_MMG2",   _sup, "MMG2",   "ColorOrange",  "CSAT MMG2 -"],
	["GrpCSAT_HMG1",   _sup, "HMG1",   "ColorOrange",  "CSAT HMG1 -"],
	["GrpCSAT_MAT1",   _lau, "MAT1",   "ColorOrange",  "CSAT MAT1 -"],
	["GrpCSAT_MAT2",   _lau, "MAT2",   "ColorOrange",  "CSAT MAT2 -"],
	["GrpCSAT_HAT1",   _lau, "HAT1",   "ColorOrange",  "CSAT HAT1 -"],
	["GrpCSAT_MTR1",   _mor, "MTR1",   "ColorOrange",  "CSAT MTR1 -"],
	["GrpCSAT_MSAM1",  _lau, "MSAM1",  "ColorOrange",  "CSAT MSAM1 -"],
	["GrpCSAT_HSAM1",  _lau, "HSAM1",  "ColorOrange",  "CSAT HSAM1 -"],
	["GrpCSAT_ST1",    _rec, "ST1",    "ColorOrange",  "CSAT ST1 -"],
	["GrpCSAT_DT1",    _rec, "DT1",    "ColorOrange",  "CSAT DT1 -"],
	["GrpCSAT_ENG1",   _eng, "ENG1",   "ColorOrange",  "CSAT ENG1 -"],

	["GrpCSAT_IFV1",   _ifv, "IFV1",   "ColorOrange",  "CSAT IFV1 -"],
	["GrpCSAT_IFV2",   _ifv, "IFV2",   "ColorOrange",  "CSAT IFV2 -"],
	["GrpCSAT_TNK1",   _tnk, "TNK1",   "ColorRed",     "CSAT TNK1 -"],

	["GrpCSAT_CAS1",   _pla, "CAS1",   "ColorOrange",  "CSAT CAS1 -"],

	["GrpCSAT_TH1",    _hel, "TH1",    "ColorRed",     "CSAT TH1 -"],
	["GrpCSAT_TH2",    _hel, "TH2",    "ColorRed",     "CSAT TH2 -"],
	["GrpCSAT_TH3",    _hel, "TH3",    "ColorBlue",    "CSAT TH3 -"],
	["GrpCSAT_TH4",    _hel, "TH4",    "ColorBlue",    "CSAT TH4 -"],
	["GrpCSAT_TH5",    _hel, "TH5",    "ColorGreen",   "CSAT TH5 -"],
	["GrpCSAT_TH6",    _hel, "TH6",    "ColorGreen",   "CSAT TH6 -"],
	["GrpCSAT_TH7",    _hel, "TH7",    "ColorOrange",  "CSAT TH7 -"],
	["GrpCSAT_TH8",    _hel, "TH8",    "ColorOrange",  "CSAT TH8 -"],

	["GrpCSAT_AH1",    _hel, "AH1",    "ColorRed",     "CSAT AH1 -"],

	["UnitCSAT_CO_M",  _med, "COM",    "ColorBlack",   ""],
	["UnitCSAT_DC_M",  _med, "DCM",    "ColorBlack",   ""],
	["UnitCSAT_ASL_M", _med, "AM",     "ColorBlack",   ""],
	["UnitCSAT_BSL_M", _med, "BM",     "ColorBlack",   ""],
	["UnitCSAT_CSL_M", _med, "CM",     "ColorBlack",   ""]
];

f_var_groupData_opfor_fia = [
	["GrpOFIA_CO",     _hq,  "CO",     "ColorYellow",  "FIA O CO -"],
	["GrpOFIA_DC",     _hq,  "DC",     "ColorYellow",  "FIA O DC -"],
	["GrpOFIA_COV",    _ifv, "COV",    "ColorYellow",  "FIA O COV -"],

	["GrpOFIA_ASL",    _hq,  "ASL",    "ColorRed",     "FIA O ASL -"],
	["GrpOFIA_A1",     _ft,  "A1",     "ColorRed",     "FIA O A1 -"],
	["GrpOFIA_A2",     _ft,  "A2",     "ColorRed",     "FIA O A2 -"],
	["GrpOFIA_AV",     _ifv, "AV",     "ColorRed",     "FIA O AV -"],

	["GrpOFIA_BSL",    _hq,  "BSL",    "ColorBlue",    "FIA O BSL -"],
	["GrpOFIA_B1",     _ft,  "B1",     "ColorBlue",    "FIA O B1 -"],
	["GrpOFIA_B2",     _ft,  "B2",     "ColorBlue",    "FIA O B2 -"],
	["GrpOFIA_BV",     _ifv, "BV",     "ColorBlue",    "FIA O BV -"],

	["GrpOFIA_CSL",    _hq,  "CSL",    "ColorGreen",   "FIA O CSL -"],
	["GrpOFIA_C1",     _ft,  "C1",     "ColorGreen",   "FIA O C1 -"],
	["GrpOFIA_C2",     _ft,  "C2",     "ColorGreen",   "FIA O C2 -"],
	["GrpOFIA_CV",     _ifv, "CV",     "ColorGreen",   "FIA O CV -"],

	["GrpOFIA_JSL",    _hq,  "JSL",    "ColorPink",    "FIA O JSL -"],
	["GrpOFIA_J1",     _ft,  "J1",     "ColorPink",    "FIA O J1 -"],
	["GrpOFIA_J2",     _ft,  "J2",     "ColorPink",    "FIA O J2 -"],
	["GrpOFIA_JV",     _ifv, "JV",     "ColorPink",    "FIA O JV -"],

	["GrpOFIA_MMG1",   _sup, "MMG1",   "ColorOrange",  "FIA O MMG1 -"],
	["GrpOFIA_MMG2",   _sup, "MMG2",   "ColorOrange",  "FIA O MMG2 -"],
	["GrpOFIA_HMG1",   _sup, "HMG1",   "ColorOrange",  "FIA O HMG1 -"],
	["GrpOFIA_MAT1",   _lau, "MAT1",   "ColorOrange",  "FIA O MAT1 -"],
	["GrpOFIA_MAT2",   _lau, "MAT2",   "ColorOrange",  "FIA O MAT2 -"],
	["GrpOFIA_HAT1",   _lau, "HAT1",   "ColorOrange",  "FIA O HAT1 -"],
	["GrpOFIA_MTR1",   _mor, "MTR1",   "ColorOrange",  "FIA O MTR1 -"],
	["GrpOFIA_MSAM1",  _lau, "MSAM1",  "ColorOrange",  "FIA O MSAM1 -"],
	["GrpOFIA_HSAM1",  _lau, "HSAM1",  "ColorOrange",  "FIA O HSAM1 -"],
	["GrpOFIA_ST1",    _rec, "ST1",    "ColorOrange",  "FIA O ST1 -"],
	["GrpOFIA_DT1",    _rec, "DT1",    "ColorOrange",  "FIA O DT1 -"],
	["GrpOFIA_ENG1",   _eng, "ENG1",   "ColorOrange",  "FIA O ENG1 -"],

	["GrpOFIA_IFV1",   _ifv, "TECH1",  "ColorRed",     "FIA O TECH1 -"],
	["GrpOFIA_IFV2",   _ifv, "TECH2",  "ColorRed",     "FIA O TECH2 -"],
	["GrpOFIA_TNK1",   _tnk, "TNK1",   "ColorRed",     "FIA O TNK1 -"],

	["GrpOFIA_CAS1",   _pla, "CAS1",   "ColorOrange",  "FIA O CAS1 -"],

	["GrpOFIA_TH1",    _hel, "TH1",    "ColorRed",     "FIA O TH1 -"],
	["GrpOFIA_TH2",    _hel, "TH2",    "ColorRed",     "FIA O TH2 -"],
	["GrpOFIA_TH3",    _hel, "TH3",    "ColorBlue",    "FIA O TH3 -"],
	["GrpOFIA_TH4",    _hel, "TH4",    "ColorBlue",    "FIA O TH4 -"],
	["GrpOFIA_TH5",    _hel, "TH5",    "ColorGreen",   "FIA O TH5 -"],
	["GrpOFIA_TH6",    _hel, "TH6",    "ColorGreen",   "FIA O TH6 -"],
	["GrpOFIA_TH7",    _hel, "TH7",    "ColorOrange",  "FIA O TH7 -"],
	["GrpOFIA_TH8",    _hel, "TH8",    "ColorOrange",  "FIA O TH8 -"],

	["GrpOFIA_AH1",    _hel, "AH1",    "ColorRed",     "FIA O AH1 -"],

	["UnitOFIA_CO_M",  _med, "COM",    "ColorBlack",   ""],
	["UnitOFIA_DC_M",  _med, "DCM",    "ColorBlack",   ""],
	["UnitOFIA_ASL_M", _med, "AM",     "ColorBlack",   ""],
	["UnitOFIA_BSL_M", _med, "BM",     "ColorBlack",   ""],
	["UnitOFIA_CSL_M", _med, "CM",     "ColorBlack",   ""]
];

f_var_groupData_indfor_aaf = [
	["GrpAAF_CO",      _hq,  "CO",     "ColorYellow",  "AAF CO -"],
	["GrpAAF_DC",      _hq,  "DC",     "ColorYellow",  "AAF DC -"],
	["GrpAAF_COV",     _ifv, "COV",    "ColorYellow",  "AAF COV -"],

	["GrpAAF_ASL",     _hq,  "ASL",    "ColorRed",     "AAF ASL -"],
	["GrpAAF_A1",      _ft,  "A1",     "ColorRed",     "AAF A1 -"],
	["GrpAAF_A2",      _ft,  "A2",     "ColorRed",     "AAF A2 -"],
	["GrpAAF_AV",      _ifv, "AV",     "ColorRed",     "AAF AV -"],

	["GrpAAF_BSL",     _hq,  "BSL",    "ColorBlue",    "AAF BSL -"],
	["GrpAAF_B1",      _ft,  "B1",     "ColorBlue",    "AAF B1 -"],
	["GrpAAF_B2",      _ft,  "B2",     "ColorBlue",    "AAF B2 -"],
	["GrpAAF_BV",      _ifv, "BV",     "ColorBlue",    "AAF BV -"],

	["GrpAAF_CSL",     _hq,  "CSL",    "ColorGreen",   "AAF CSL -"],
	["GrpAAF_C1",      _ft,  "C1",     "ColorGreen",   "AAF C1 -"],
	["GrpAAF_C2",      _ft,  "C2",     "ColorGreen",   "AAF C2 -"],
	["GrpAAF_CV",      _ifv, "CV",     "ColorGreen",   "AAF CV -"],

	["GrpAAF_JSL",     _hq,  "JSL",    "ColorPink",    "AAF JSL -"],
	["GrpAAF_J1",      _ft,  "J1",     "ColorPink",    "AAF J1 -"],
	["GrpAAF_J2",      _ft,  "J2",     "ColorPink",    "AAF J2 -"],
	["GrpAAF_JV",      _ifv, "JV",     "ColorPink",    "AAF JV -"],

	["GrpAAF_MMG1",    _sup, "MMG1",   "ColorOrange",  "AAF MMG1 -"],
	["GrpAAF_MMG2",    _sup, "MMG2",   "ColorOrange",  "AAF MMG2 -"],
	["GrpAAF_HMG1",    _sup, "HMG1",   "ColorOrange",  "AAF HMG1 -"],
	["GrpAAF_MAT1",    _lau, "MAT1",   "ColorOrange",  "AAF MAT1 -"],
	["GrpAAF_MAT2",    _lau, "MAT2",   "ColorOrange",  "AAF MAT2 -"],
	["GrpAAF_HAT1",    _lau, "HAT1",   "ColorOrange",  "AAF HAT1 -"],
	["GrpAAF_MTR1",    _mor, "MTR1",   "ColorOrange",  "AAF MTR1 -"],
	["GrpAAF_MSAM1",   _lau, "MSAM1",  "ColorOrange",  "AAF MSAM1 -"],
	["GrpAAF_HSAM1",   _lau, "HSAM1",  "ColorOrange",  "AAF HSAM1 -"],
	["GrpAAF_ST1",     _rec, "ST1",    "ColorOrange",  "AAF ST1 -"],
	["GrpAAF_DT1",     _rec, "DT1",    "ColorOrange",  "AAF DT1 -"],
	["GrpAAF_ENG1",    _eng, "ENG1",   "ColorOrange",  "AAF ENG1 -"],

	["GrpAAF_IFV1",    _ifv, "IFV1",   "ColorOrange",  "AAF IFV1 -"],
	["GrpAAF_IFV2",    _ifv, "IFV2",   "ColorOrange",  "AAF IFV2 -"],
	["GrpAAF_TNK1",    _tnk, "TNK1",   "ColorRed",     "AAF TNK1 -"],

	["GrpAAF_CAS1",    _pla, "CAS1",   "ColorOrange",  "AAF CAS1 -"],

	["GrpAAF_TH1",     _hel, "TH1",    "ColorRed",     "AAF TH1 -"],
	["GrpAAF_TH2",     _hel, "TH2",    "ColorBlue",    "AAF TH2 -"],
	["GrpAAF_TH3",     _hel, "TH3",    "ColorGreen",   "AAF TH3 -"],
	["GrpAAF_TH4",     _hel, "TH4",    "ColorOrange",  "AAF TH4 -"],

	["GrpAAF_AH1",     _hel, "AH1",    "ColorRed",     "AAF AH1 -"],

	["UnitAAF_CO_M",   _med, "COM",    "ColorBlack",   ""],
	["UnitAAF_DC_M",   _med, "DCM",    "ColorBlack",   ""],
	["UnitAAF_ASL_M",  _med, "AM",     "ColorBlack",   ""],
	["UnitAAF_BSL_M",  _med, "BM",     "ColorBlack",   ""],
	["UnitAAF_CSL_M",  _med, "CM",     "ColorBlack",   ""]
];

f_var_groupData_indfor_fia = [
	["GrpIFIA_CO",     _hq,  "CO",     "ColorYellow",  "FIA I CO -"],
	["GrpIFIA_DC",     _hq,  "DC",     "ColorYellow",  "FIA I DC -"],
	["GrpIFIA_COV",    _ifv, "COV",    "ColorYellow",  "FIA I COV -"],

	["GrpIFIA_ASL",    _hq,  "ASL",    "ColorRed",     "FIA I ASL -"],
	["GrpIFIA_A1",     _ft,  "A1",     "ColorRed",     "FIA I A1 -"],
	["GrpIFIA_A2",     _ft,  "A2",     "ColorRed",     "FIA I A2 -"],
	["GrpIFIA_AV",     _ifv, "AV",     "ColorRed",     "FIA I AV -"],

	["GrpIFIA_BSL",    _hq,  "BSL",    "ColorBlue",    "FIA I BSL -"],
	["GrpIFIA_B1",     _ft,  "B1",     "ColorBlue",    "FIA I B1 -"],
	["GrpIFIA_B2",     _ft,  "B2",     "ColorBlue",    "FIA I B2 -"],
	["GrpIFIA_BV",     _ifv, "BV",     "ColorBlue",    "FIA I BV -"],

	["GrpIFIA_CSL",    _hq,  "CSL",    "ColorGreen",   "FIA I CSL -"],
	["GrpIFIA_C1",     _ft,  "C1",     "ColorGreen",   "FIA I C1 -"],
	["GrpIFIA_C2",     _ft,  "C2",     "ColorGreen",   "FIA I C2 -"],
	["GrpIFIA_CV",     _ifv, "CV",     "ColorGreen",   "FIA I CV -"],

	["GrpIFIA_JSL",    _hq,  "JSL",    "ColorPink",    "FIA I JSL -"],
	["GrpIFIA_J1",     _ft,  "J1",     "ColorPink",    "FIA I J1 -"],
	["GrpIFIA_J2",     _ft,  "J2",     "ColorPink",    "FIA I J2 -"],
	["GrpIFIA_JV",     _ifv, "JV",     "ColorPink",    "FIA I JV -"],

	["GrpIFIA_MMG1",   _sup, "MMG1",   "ColorOrange",  "FIA I MMG1 -"],
	["GrpIFIA_MMG2",   _sup, "MMG2",   "ColorOrange",  "FIA I MMG2 -"],
	["GrpIFIA_HMG1",   _sup, "HMG1",   "ColorOrange",  "FIA I HMG1 -"],
	["GrpIFIA_MAT1",   _lau, "MAT1",   "ColorOrange",  "FIA I MAT1 -"],
	["GrpIFIA_MAT2",   _lau, "MAT2",   "ColorOrange",  "FIA I MAT2 -"],
	["GrpIFIA_HAT1",   _lau, "HAT1",   "ColorOrange",  "FIA I HAT1 -"],
	["GrpIFIA_MTR1",   _mor, "MTR1",   "ColorOrange",  "FIA I MTR1 -"],
	["GrpIFIA_MSAM1",  _lau, "MSAM1",  "ColorOrange",  "FIA I MSAM1 -"],
	["GrpIFIA_HSAM1",  _lau, "HSAM1",  "ColorOrange",  "FIA I HSAM1 -"],
	["GrpIFIA_ST1",    _rec, "ST1",    "ColorOrange",  "FIA I ST1 -"],
	["GrpIFIA_DT1",    _rec, "DT1",    "ColorOrange",  "FIA I DT1 -"],
	["GrpIFIA_ENG1",   _eng, "ENG1",   "ColorOrange",  "FIA I ENG1 -"],

	["GrpIFIA_IFV1",   _ifv, "TECH1",  "ColorRed",     "FIA I TECH1 -"],
	["GrpIFIA_IFV2",   _ifv, "TECH2",  "ColorRed",     "FIA I TECH2 -"],
	["GrpIFIA_TNK1",   _tnk, "TNK1",   "ColorRed",     "FIA I TNK1 -"],

	["GrpIFIA_CAS1",   _pla, "CAS1",   "ColorOrange",  "FIA I CAS1 -"],

	["GrpIFIA_TH1",    _hel, "TH1",    "ColorRed",     "FIA I TH1 -"],
	["GrpIFIA_TH2",    _hel, "TH2",    "ColorRed",     "FIA I TH2 -"],
	["GrpIFIA_TH3",    _hel, "TH3",    "ColorBlue",    "FIA I TH3 -"],
	["GrpIFIA_TH4",    _hel, "TH4",    "ColorBlue",    "FIA I TH4 -"],
	["GrpIFIA_TH5",    _hel, "TH5",    "ColorGreen",   "FIA I TH5 -"],
	["GrpIFIA_TH6",    _hel, "TH6",    "ColorGreen",   "FIA I TH6 -"],
	["GrpIFIA_TH7",    _hel, "TH7",    "ColorOrange",  "FIA I TH7 -"],
	["GrpIFIA_TH8",    _hel, "TH8",    "ColorOrange",  "FIA I TH8 -"],

	["GrpIFIA_AH1",    _hel, "AH1",    "ColorRed",     "FIA I AH1 -"],

	["UnitIFIA_CO_M",  _med, "COM",    "ColorBlack",   ""],
	["UnitIFIA_DC_M",  _med, "DCM",    "ColorBlack",   ""],
	["UnitIFIA_ASL_M", _med, "AM",     "ColorBlack",   ""],
	["UnitIFIA_BSL_M", _med, "BM",     "ColorBlack",   ""],
	["UnitIFIA_CSL_M", _med, "CM",     "ColorBlack",   ""]
];

f_var_groupData_indfor_syn = [
	["GrpSyn_CO",      _hq,  "CO",     "ColorYellow",  "Syndikat CO -"],
	["GrpSyn_DC",      _hq,  "DC",     "ColorYellow",  "Syndikat DC -"],
	["GrpSyn_COV",     _ifv, "COV",    "ColorYellow",  "Syndikat COV -"],

	["GrpSyn_ASL",     _hq,  "ASL",    "ColorRed",     "Syndikat ASL -"],
	["GrpSyn_A1",      _ft,  "A1",     "ColorRed",     "Syndikat A1 -"],
	["GrpSyn_A2",      _ft,  "A2",     "ColorRed",     "Syndikat A2 -"],
	["GrpSyn_AV",      _ifv, "AV",     "ColorRed",     "Syndikat AV -"],

	["GrpSyn_BSL",     _hq,  "BSL",    "ColorBlue",    "Syndikat BSL -"],
	["GrpSyn_B1",      _ft,  "B1",     "ColorBlue",    "Syndikat B1 -"],
	["GrpSyn_B2",      _ft,  "B2",     "ColorBlue",    "Syndikat B2 -"],
	["GrpSyn_BV",      _ifv, "BV",     "ColorBlue",    "Syndikat BV -"],

	["GrpSyn_CSL",     _hq,  "CSL",    "ColorGreen",   "Syndikat CSL -"],
	["GrpSyn_C1",      _ft,  "C1",     "ColorGreen",   "Syndikat C1 -"],
	["GrpSyn_C2",      _ft,  "C2",     "ColorGreen",   "Syndikat C2 -"],
	["GrpSyn_CV",      _ifv, "CV",     "ColorGreen",   "Syndikat CV -"],

	["GrpSyn_JSL",     _hq,  "JSL",    "ColorPink",    "Syndikat JSL -"],
	["GrpSyn_J1",      _ft,  "J1",     "ColorPink",    "Syndikat J1 -"],
	["GrpSyn_J2",      _ft,  "J2",     "ColorPink",    "Syndikat J2 -"],
	["GrpSyn_JV",      _ifv, "JV",     "ColorPink",    "Syndikat JV -"],

	["GrpSyn_MMG1",    _sup, "MMG1",   "ColorOrange",  "Syndikat MMG1 -"],
	["GrpSyn_MMG2",    _sup, "MMG2",   "ColorOrange",  "Syndikat MMG2 -"],
	["GrpSyn_HMG1",    _sup, "HMG1",   "ColorOrange",  "Syndikat HMG1 -"],
	["GrpSyn_MAT1",    _lau, "MAT1",   "ColorOrange",  "Syndikat MAT1 -"],
	["GrpSyn_MAT2",    _lau, "MAT2",   "ColorOrange",  "Syndikat MAT2 -"],
	["GrpSyn_HAT1",    _lau, "HAT1",   "ColorOrange",  "Syndikat HAT1 -"],
	["GrpSyn_MTR1",    _mor, "MTR1",   "ColorOrange",  "Syndikat MTR1 -"],
	["GrpSyn_MSAM1",   _lau, "MSAM1",  "ColorOrange",  "Syndikat MSAM1 -"],
	["GrpSyn_HSAM1",   _lau, "HSAM1",  "ColorOrange",  "Syndikat HSAM1 -"],
	["GrpSyn_ST1",     _rec, "ST1",    "ColorOrange",  "Syndikat ST1 -"],
	["GrpSyn_DT1",     _rec, "DT1",    "ColorOrange",  "Syndikat DT1 -"],
	["GrpSyn_ENG1",    _eng, "ENG1",   "ColorOrange",  "Syndikat ENG1 -"],

	["GrpSyn_IFV1",    _ifv, "TECH1",  "ColorRed",     "Syndikat IFV1 -"],
	["GrpSyn_IFV2",    _ifv, "TECH2",  "ColorRed",     "Syndikat IFV2 -"],
	["GrpSyn_TNK1",    _tnk, "TNK1",   "ColorRed",     "Syndikat TNK1 -"],

	["GrpSyn_CAS1",    _pla, "CAS1",   "ColorOrange",  "Syndikat CAS1 -"],

	["GrpSyn_TH1",     _hel, "TH1",    "ColorRed",     "Syndikat TH1 -"],
	["GrpSyn_TH2",     _hel, "TH2",    "ColorRed",     "Syndikat TH2 -"],
	["GrpSyn_TH3",     _hel, "TH3",    "ColorBlue",    "Syndikat TH3 -"],
	["GrpSyn_TH4",     _hel, "TH4",    "ColorBlue",    "Syndikat TH4 -"],
	["GrpSyn_TH5",     _hel, "TH5",    "ColorGreen",   "Syndikat TH5 -"],
	["GrpSyn_TH6",     _hel, "TH6",    "ColorGreen",   "Syndikat TH6 -"],
	["GrpSyn_TH7",     _hel, "TH7",    "ColorOrange",  "Syndikat TH7 -"],
	["GrpSyn_TH8",     _hel, "TH8",    "ColorOrange",  "Syndikat TH8 -"],

	["GrpSyn_AH1",     _hel, "AH1",    "ColorRed",     "Syndikat AH1 -"],

	["UnitSyn_CO_M",   _med, "COM",    "ColorBlack",   ""],
	["UnitSyn_DC_M",   _med, "DCM",    "ColorBlack",   ""],
	["UnitSyn_ASL_M",  _med, "AM",     "ColorBlack",   ""],
	["UnitSyn_BSL_M",  _med, "BM",     "ColorBlack",   ""],
	["UnitSyn_CSL_M",  _med, "CM",     "ColorBlack",   ""]
];

f_var_groupData_indfor_3ifb = [
	["Grp3IFB_CO",     _hq,  "CO",     "ColorYellow",  "3IFB CO -"],
	["Grp3IFB_DC",     _hq,  "DC",     "ColorYellow",  "3IFB DC -"],
	["Grp3IFB_COV",    _ifv, "COV",    "ColorYellow",  "3IFB COV -"],

	["Grp3IFB_ASL",    _hq,  "ASL",    "ColorRed",     "3IFB ASL -"],
	["Grp3IFB_A1",     _ft,  "A1",     "ColorRed",     "3IFB A1 -"],
	["Grp3IFB_A2",     _ft,  "A2",     "ColorRed",     "3IFB A2 -"],
	["Grp3IFB_AV",     _ifv, "AV",     "ColorRed",     "3IFB AV -"],

	["Grp3IFB_BSL",    _hq,  "BSL",    "ColorBlue",    "3IFB BSL -"],
	["Grp3IFB_B1",     _ft,  "B1",     "ColorBlue",    "3IFB B1 -"],
	["Grp3IFB_B2",     _ft,  "B2",     "ColorBlue",    "3IFB B2 -"],
	["Grp3IFB_BV",     _ifv, "BV",     "ColorBlue",    "3IFB BV -"],

	["Grp3IFB_CSL",    _hq,  "CSL",    "ColorGreen",   "3IFB CSL -"],
	["Grp3IFB_C1",     _ft,  "C1",     "ColorGreen",   "3IFB C1 -"],
	["Grp3IFB_C2",     _ft,  "C2",     "ColorGreen",   "3IFB C2 -"],
	["Grp3IFB_CV",     _ifv, "CV",     "ColorGreen",   "3IFB CV -"],

	["Grp3IFB_JSL",    _hq,  "JSL",    "ColorPink",    "3IFB JSL -"],
	["Grp3IFB_J1",     _ft,  "J1",     "ColorPink",    "3IFB J1 -"],
	["Grp3IFB_J2",     _ft,  "J2",     "ColorPink",    "3IFB J2 -"],
	["Grp3IFB_JV",     _ifv, "JV",     "ColorPink",    "3IFB JV -"],

	["Grp3IFB_MMG1",   _sup, "MMG1",   "ColorOrange",  "3IFB MMG1 -"],
	["Grp3IFB_MMG2",   _sup, "MMG2",   "ColorOrange",  "3IFB MMG2 -"],
	["Grp3IFB_HMG1",   _sup, "HMG1",   "ColorOrange",  "3IFB HMG1 -"],
	["Grp3IFB_MAT1",   _lau, "MAT1",   "ColorOrange",  "3IFB MAT1 -"],
	["Grp3IFB_MAT2",   _lau, "MAT2",   "ColorOrange",  "3IFB MAT2 -"],
	["Grp3IFB_HAT1",   _lau, "HAT1",   "ColorOrange",  "3IFB HAT1 -"],
	["Grp3IFB_MTR1",   _mor, "MTR1",   "ColorOrange",  "3IFB MTR1 -"],
	["Grp3IFB_MSAM1",  _lau, "MSAM1",  "ColorOrange",  "3IFB MSAM1 -"],
	["Grp3IFB_HSAM1",  _lau, "HSAM1",  "ColorOrange",  "3IFB HSAM1 -"],
	["Grp3IFB_ST1",    _rec, "ST1",    "ColorOrange",  "3IFB ST1 -"],
	["Grp3IFB_DT1",    _rec, "DT1",    "ColorOrange",  "3IFB DT1 -"],
	["Grp3IFB_ENG1",   _eng, "ENG1",   "ColorOrange",  "3IFB ENG1 -"],

	["Grp3IFB_IFV1",   _ifv, "TECH1",  "ColorRed",     "3IFB TECH1 -"],
	["Grp3IFB_IFV2",   _ifv, "TECH2",  "ColorRed",     "3IFB TECH2 -"],
	["Grp3IFB_TNK1",   _tnk, "TNK1",   "ColorRed",     "3IFB TNK1 -"],

	["Grp3IFB_CAS1",   _pla, "CAS1",   "ColorOrange",  "3IFB CAS1 -"],

	["Grp3IFB_TH1",    _hel, "TH1",    "ColorRed",     "3IFB TH1 -"],
	["Grp3IFB_TH2",    _hel, "TH2",    "ColorRed",     "3IFB TH2 -"],
	["Grp3IFB_TH3",    _hel, "TH3",    "ColorBlue",    "3IFB TH3 -"],
	["Grp3IFB_TH4",    _hel, "TH4",    "ColorBlue",    "3IFB TH4 -"],
	["Grp3IFB_TH5",    _hel, "TH5",    "ColorGreen",   "3IFB TH5 -"],
	["Grp3IFB_TH6",    _hel, "TH6",    "ColorGreen",   "3IFB TH6 -"],
	["Grp3IFB_TH7",    _hel, "TH7",    "ColorOrange",  "3IFB TH7 -"],
	["Grp3IFB_TH8",    _hel, "TH8",    "ColorOrange",  "3IFB TH8 -"],

	["Grp3IFB_AH1",    _hel, "AH1",    "ColorRed",     "3IFB AH1 -"],

	["Unit3IFB_CO_M",  _med, "COM",    "ColorBlack",   ""],
	["Unit3IFB_DC_M",  _med, "DCM",    "ColorBlack",   ""],
	["Unit3IFB_ASL_M", _med, "AM",     "ColorBlack",   ""],
	["Unit3IFB_BSL_M", _med, "BM",     "ColorBlack",   ""],
	["Unit3IFB_CSL_M", _med, "CM",     "ColorBlack",   ""]
];
// ====================================================================================

// Adding all of the group data to a single array
f_var_groupData_all = [];
f_var_groupData_all append f_var_groupData_blufor_nato;
f_var_groupData_all append f_var_groupData_blufor_fia;
f_var_groupData_all append f_var_groupData_blufor_gen;
f_var_groupData_all append f_var_groupData_opfor_csat;
f_var_groupData_all append f_var_groupData_opfor_fia;
f_var_groupData_all append f_var_groupData_indfor_aaf;
f_var_groupData_all append f_var_groupData_indfor_fia;
f_var_groupData_all append f_var_groupData_indfor_syn;
f_var_groupData_all append f_var_groupData_indfor_3ifb;

// ====================================================================================
