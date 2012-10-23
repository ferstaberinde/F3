// F2 - Folk Group Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

switch (faction player) do
{

// ====================================================================================

// MARKERS: US
// Markers seen by players in US slots.

	case "BIS_US":
	{
		["GrpUS_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpUS_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpUS_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUS_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpUS_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUS_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpUS_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUS_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUS_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUS_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUS_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpUS_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUS_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpUS_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUS_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUS_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["UnitUS_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitUS_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitUS_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitUS_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitUS_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
	};

// ====================================================================================

// MARKERS: TAKISTANI ARMY
// Markers seen by players in TAKISTANI ARMY slots.

	case "BIS_TK":
	{
		["GrpTK_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpTK_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpTK_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTK_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTK_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTK_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTK_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTK_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTK_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTK_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTK_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpTK_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTK_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpTK_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTK_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTK_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";			
		["UnitTK_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitTK_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitTK_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitTK_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitTK_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
	};

// ====================================================================================

// MARKERS: TAKISTANI MILITIA
// Markers seen by players in TAKISTANI MILITIA slots.

	case "BIS_TK_INS":
	{
		["GrpINS_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpINS_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpINS_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpINS_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpINS_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpINS_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpINS_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpINS_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpINS_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpINS_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpINS_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpINS_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpINS_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpINS_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpINS_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpINS_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["UnitINS_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitINS_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";				
		["UnitINS_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitINS_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitINS_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
	};
       
// ====================================================================================

// MARKERS: TAKISTANI LOCALS (INDEPENDENT)
// Markers seen by players in TAKISTANI LOCALS (INDEPENDENT) slots.

	case "BIS_TK_GUE":
	{
		["GrpGUE_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpGUE_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpGUE_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpGUE_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpGUE_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpGUE_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["UnitGUE_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitGUE_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitGUE_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitGUE_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitGUE_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
	};

// ====================================================================================

// MARKERS: UN
// Markers seen by players in UN slots.

	case "BIS_UN":
	{
		["GrpUN_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpUN_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpUN_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUN_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUN_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUN_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUN_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUN_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUN_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUN_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUN_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpUN_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUN_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpUN_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUN_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUN_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["UnitUN_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitUN_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitUN_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitUN_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitUN_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
	};

// ====================================================================================

// MARKERS: BRITISH ARMED FORCES
// Markers seen by players in BRITISH ARMED FORCES slots.

	case "BIS_BAF":
	{
		["GrpBAF_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpBAF_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpBAF_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";		
		["GrpBAF_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpBAF_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpBAF_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpBAF_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["UnitBAF_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitBAF_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitBAF_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitBAF_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitBAF_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
	};
	
// ====================================================================================

// MARKERS: CZECH REPUBPLIC
// Markers seen by players in CZECH REPUBPLIC slots.

	case "BIS_CZ":
	{

	};

// ====================================================================================

// MARKERS: GERMAN
// Markers seen by players in GERMAN slots.

	case "BIS_GER":
	{

	};

// ====================================================================================

// MARKERS: CIVILIAN (TAKISTANI)
// Markers seen by players in CIVILIAN (TAKISTANI) slots.

	case "BIS_TK_CIV":
	{

	};

// ====================================================================================

// MARKERS: CIVILIAN (SPECIAL)
// Markers seen by players in CIVILIAN (SPECIAL) slots.

	case "BIS_CIV_special":
	{

	};
       
// ====================================================================================

};

// ====================================================================================

if (true) exitWith {};