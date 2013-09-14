// F3 - Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unitfaction"];

// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what faction the player's slot belongs to, and stores
// it in the private variable _unitfaction

_unitfaction = toLower (faction player);

// If the unitfaction is different from the group leader's faction, the latters faction is NOed
if (_unitfaction != toLower (faction (leader group player))) then {_unitfaction = toLower (faction (leader group player))};

// ====================================================================================

// PRECOMPILE
// Prevents the next script to be read by the engine everytime it's ised:

fnc_folk_localGroupMarker = compile preprocessFileLineNumbers "f\common\folk_localGroupMarker.sqf";
fnc_folk_localSpecialistMarker = compile preprocessFileLineNumbers "f\common\folk_localSpecialistMarker.sqf";

// ====================================================================================
switch (_unitfaction) do
{

// ====================================================================================

// MARKERS: BLUFOR > BLUE
// Markers seen by players in BLUE slots.

	case "blu_f":
	{
		["GrpBLU_CO", 0, "CO", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_DC", 0, "DC", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_ASL", 0, "ASL", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_A1", 1, "A1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_A2", 1, "A2", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_A3", 1, "A3", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_BSL", 0, "BSL", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_B1", 1, "B1", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_B2", 1, "B2", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_B3", 1, "B3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_CSL", 0, "CSL", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_C1", 1, "C1", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_C2", 1, "C2", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_C3", 1, "C3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_MMG1", 2, "MMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_MAT1", 3, "MAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

// 		["GrpBLU_ST1",  4, "ST1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpBLU_HMG1",  2, "HMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpBLU_MTR1",  5, "MTR1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpBLU_HAT1",  3, "HAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpBLU_SAM1",  3, "SAM1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["GrpBLU_ENG1",  6, "ENG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

 		["GrpBLU_IFV1",  7, "IFV1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_IFV2",  7, "IFV2", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_IFV3",  7, "IFV3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_IFV4",  7, "IFV4", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_IFV5",  7, "IFV5", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_IFV6",  7, "IFV6", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_IFV7",  7, "IFV7", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_IFV8",  7, "IFV8", "ColorOrange"] spawn fnc_folk_localGroupMarker;

 		["GrpBLU_TNK1",  7, "TNK1", "ColorRed"] spawn fnc_folk_localGroupMarker;

		["GrpBLU_TH1",  8, "TH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
 		["GrpBLU_TH2",  8, "TH2", "ColorRed"] spawn fnc_folk_localGroupMarker;
 		["GrpBLU_TH3",  8, "TH3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
 		["GrpBLU_TH4",  8, "TH4", "ColorBlue"] spawn fnc_folk_localGroupMarker;
 		["GrpBLU_TH5",  8, "TH5", "ColorGreen"] spawn fnc_folk_localGroupMarker;
  		["GrpBLU_TH6",  8, "TH6", "ColorGreen"] spawn fnc_folk_localGroupMarker;
   		["GrpBLU_TH7",  8, "TH7", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_TH8",  8, "TH8", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["GrpBLU_AH1",  8, "AH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpBLU_DT1",  4, "DT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["UnitBLU_CO_M", 0, "COM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitBLU_DC_M", 0, "DCM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitBLU_ASL_M", 0, "AM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitBLU_BSL_M", 0, "BM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitBLU_CSL_M", 0, "CM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;

	};

// ====================================================================================

// MARKERS: OPFOR > RED
// Markers seen by players in RED slots.

	case "opf_f":
	{
		["GrpRED_CO", 0, "CO", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpRED_DC", 0, "DC", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpRED_ASL", 0, "ASL", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpRED_A1", 1, "A1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpRED_A2", 1, "A2", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpRED_A3", 1, "A3", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpRED_BSL", 0, "BSL", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpRED_B1", 1, "B1", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpRED_B2", 1, "B2", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpRED_B3", 1, "B3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpRED_CSL", 0, "CSL", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpRED_C1", 1, "C1", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpRED_C2", 1, "C2", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpRED_C3", 1, "C3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpRED_MMG1", 2, "MMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpRED_MAT1", 3, "MAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

// 		["GrpRED_ST1",  4, "ST1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpRED_HMG1",  2, "HMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpRED_MTR1",  5, "MTR1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpRED_HAT1",  3, "HAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpRED_SAM1",  3, "SAM1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["GrpRED_ENG1",  6, "ENG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

 		["GrpRED_IFV1",  7, "IFV1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpRED_IFV2",  7, "IFV2", "ColorRed"] spawn fnc_folk_localGroupMarker;
 		["GrpRED_IFV3",  7, "IFV3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpRED_IFV4",  7, "IFV4", "ColorBlue"] spawn fnc_folk_localGroupMarker;
 		["GrpRED_IFV5",  7, "IFV5", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpRED_IFV6",  7, "IFV6", "ColorGreen"] spawn fnc_folk_localGroupMarker;
 		["GrpRED_IFV7",  7, "IFV7", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpRED_IFV8",  7, "IFV8", "ColorOrange"] spawn fnc_folk_localGroupMarker;


 		["GrpRED_TNK1",  7, "TNK1", "ColorRed"] spawn fnc_folk_localGroupMarker;

		["GrpRED_TH1",  8, "TH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpRED_TH2",  8, "TH2", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpRED_TH3",  8, "TH3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpRED_TH4",  8, "TH4", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpRED_TH5",  8, "TH5", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpRED_TH6",  8, "TH6", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpRED_TH7",  8, "TH7", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpRED_TH8",  8, "TH8", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["GrpRED_AH1",  8, "AH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpRED_DT1",  4, "DT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["UnitRED_CO_M", 0, "COM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitRED_DC_M", 0, "DCM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitRED_ASL_M", 0, "AM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitRED_BSL_M", 0, "BM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitRED_CSL_M", 0, "CM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
	};


// ====================================================================================

// MARKERS: INDEPEDENT > GREEN
// Markers seen by players in GREEN slots.

	case "ind_f":
	{
		["GrpGRN_CO", 0, "CO", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_DC", 0, "DC", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_ASL", 0, "ASL", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_A1", 1, "A1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_A2", 1, "A2", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_A3", 1, "A3", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_BSL", 0, "BSL", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_B1", 1, "B1", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_B2", 1, "B2", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_B3", 1, "B3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_CSL", 0, "CSL", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_C1", 1, "C1", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_C2", 1, "C2", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_C3", 1, "C3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_MMG1", 2, "MMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_MAT1", 3, "MAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

// 		["GrpGRN_ST1",  4, "ST1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpGRN_HMG1",  2, "HMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpGRN_MTR1",  5, "MTR1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpGRN_HAT1",  3, "HAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpGRN_SAM1",  3, "SAM1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["GrpGRN_ENG1",  6, "ENG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

 		["GrpGRN_IFV1",  7, "IFV1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_IFV2",  7, "IFV2", "ColorRed"] spawn fnc_folk_localGroupMarker;
 		["GrpGRN_IFV3",  7, "IFV3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_IFV4",  7, "IFV4", "ColorBlue"] spawn fnc_folk_localGroupMarker;
 		["GrpGRN_IFV5",  7, "IFV5", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_IFV6",  7, "IFV6", "ColorGreen"] spawn fnc_folk_localGroupMarker;
 		["GrpGRN_IFV7",  7, "IFV7", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpRED_IFV8",  7, "IFV8", "ColorOrange"] spawn fnc_folk_localGroupMarker;

 		["GrpGRN_TNK1",  7, "TNK1", "ColorRed"] spawn fnc_folk_localGroupMarker;

		["GrpGRN_TH1",  8, "TH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_TH2",  8, "TH2", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_TH3",  8, "TH3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpGRN_TH4",  8, "TH4", "ColorOrange"] spawn fnc_folk_localGroupMarker;

// 		["GrpGRN_TH2",  8, "TH2", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpGRN_AH1",  8, "AH1", "ColorRed"] spawn fnc_folk_localGroupMarker;

		["GrpGRN_DT1",  4, "DT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["UnitGRN_CO_M", 0, "COM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitGRN_DC_M", 0, "DCM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitGRN_ASL_M", 0, "AM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitGRN_BSL_M", 0, "BM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitGRN_CSL_M", 0, "CM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
	};
};

// ====================================================================================

if (true) exitWith {};