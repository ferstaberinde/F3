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
	
// USMC
// Markers seen by players in USMC slots.
	
	case "USMC":
	{
		["GrpUSMC_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpUSMC_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpUSMC_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpUSMC_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpUSMC_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpUSMC_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpUSMC_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpUSMC_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["UnitUSMC_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitUSMC_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitUSMC_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitUSMC_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitUSMC_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
	};

// ====================================================================================
	
// CDF
// Markers seen by players in CDF slots.
	
	case "CDF":
	{
		["GrpCDF_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpCDF_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpCDF_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpCDF_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpCDF_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpCDF_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpCDF_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpCDF_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["UnitCDF_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitCDF_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitCDF_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitCDF_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitCDF_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
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
	
// MARKERS: RUSSIA
// Markers seen by players in RUSSIA slots.
	
	case "RU":
	{
		["GrpRU_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpRU_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpRU_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpRU_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpRU_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpRU_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpRU_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpRU_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpRU_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpRU_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpRU_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpRU_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpRU_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpRU_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpRU_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpRU_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";			
		["UnitRU_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitRU_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitRU_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitRU_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitRU_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
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

// MARKERS: INSURGENT
// Markers seen by players in INSURGENT (CHDKZ) slots.

	case "INS":
	{
		["GrpA2INS_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpA2INS_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpA2INS_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpA2INS_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpA2INS_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2INS_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["UnitA2INS_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitA2INS_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";				
		["UnitA2INS_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitA2INS_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitA2INS_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
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
	
// MARKERS: GUERILLA (NAPA)
// Markers seen by players in GUERILLA (NAPA) slots.

	case "GUE":
	{
		["GrpA2GUE_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpA2GUE_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpA2GUE_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpA2GUE_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpA2GUE_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpA2GUE_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["UnitA2GUE_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitA2GUE_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitA2GUE_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitA2GUE_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitA2GUE_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
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

// MARKERS: PMC (Engineers for UN & TK GUE)
// Markers seen by players in PMC slots.

	case "PMC_BAF":
	{
		["GrpTKGUE_CO", 0, "CO", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_DC", 0, "DC", "ColorYellow"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_ASL", 0, "ASL", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_A1", 1, "A1", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_A2", 1, "A2", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpTKGUE_A3", 1, "A3", "ColorRed"] execVM "f\common\folk_localGroupMarker.sqf";		
		["GrpTKGUE_BSL", 0, "BSL", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_B1", 1, "B1", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_B2", 1, "B2", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_B3", 1, "B3", "ColorBlue"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_CSL", 0, "CSL", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_C1", 1, "C1", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_C2", 1, "C2", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_C3", 1, "C3", "ColorGreen"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_MMG1", 2, "MMG1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_MAT1", 3, "MAT1", "ColorOrange"] execVM "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_ST1",  4, "ST1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_HMG1",  2, "HMG1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_MTR1",  5, "MTR1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_HAT1",  3, "HAT1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_SAM1",  3, "SAM1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_ENG1",  6, "ENG1", "ColorYellow"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_IFV1",  7, "IFV1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_IFV2",  7, "IFV2", "ColorBlue"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpTKGUE_IFV3",  7, "IFV3", "ColorGreen"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_TNK1",  7, "TNK1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";	
		["GrpTKGUE_TH1",  8, "TH1", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_TH2",  8, "TH2", "ColorOrange"] execVM  "f\common\folk_localGroupMarker.sqf";
		["GrpTKGUE_AH1",  8, "AH1", "ColorRed"] execVM  "f\common\folk_localGroupMarker.sqf";
		["UnitTKGUE_CO_M", 0, "COM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitTKGUE_DC_M", 0, "DCM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitTKGUE_ASL_M", 0, "AM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";		
		["UnitTKGUE_BSL_M", 0, "BM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		["UnitTKGUE_CSL_M", 0, "CM", "ColorBlack"] execVM "f\common\folk_localSpecialistMarker.sqf";
		
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