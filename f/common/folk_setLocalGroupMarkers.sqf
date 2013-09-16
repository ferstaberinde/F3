// F3 - Folk Group Markers
// CCSATits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
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

// MARKERS: NATOFOR > NATO
// Markers seen by players in NATO slots.

	case "NATO_f":
	{
		["GrpNATO_CO", 0, "CO", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_DC", 0, "DC", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_ASL", 0, "ASL", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_A1", 1, "A1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_A2", 1, "A2", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_A3", 1, "A3", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_BSL", 0, "BSL", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_B1", 1, "B1", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_B2", 1, "B2", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_B3", 1, "B3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_CSL", 0, "CSL", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_C1", 1, "C1", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_C2", 1, "C2", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_C3", 1, "C3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_MMG1", 2, "MMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_MAT1", 3, "MAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

// 		["GrpNATO_ST1",  4, "ST1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpNATO_HMG1",  2, "HMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpNATO_MTR1",  5, "MTR1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpNATO_HAT1",  3, "HAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpNATO_SAM1",  3, "SAM1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["GrpNATO_ENG1",  6, "ENG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

 		["GrpNATO_IFV1",  7, "IFV1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_IFV2",  7, "IFV2", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_IFV3",  7, "IFV3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_IFV4",  7, "IFV4", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_IFV5",  7, "IFV5", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_IFV6",  7, "IFV6", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_IFV7",  7, "IFV7", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_IFV8",  7, "IFV8", "ColorOrange"] spawn fnc_folk_localGroupMarker;

 		["GrpNATO_TNK1",  7, "TNK1", "ColorRed"] spawn fnc_folk_localGroupMarker;

		["GrpNATO_TH1",  8, "TH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
 		["GrpNATO_TH2",  8, "TH2", "ColorRed"] spawn fnc_folk_localGroupMarker;
 		["GrpNATO_TH3",  8, "TH3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
 		["GrpNATO_TH4",  8, "TH4", "ColorBlue"] spawn fnc_folk_localGroupMarker;
 		["GrpNATO_TH5",  8, "TH5", "ColorGreen"] spawn fnc_folk_localGroupMarker;
  		["GrpNATO_TH6",  8, "TH6", "ColorGreen"] spawn fnc_folk_localGroupMarker;
   		["GrpNATO_TH7",  8, "TH7", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_TH8",  8, "TH8", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["GrpNATO_AH1",  8, "AH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNATO_DT1",  4, "DT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["UnitNATO_CO_M", 0, "COM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitNATO_DC_M", 0, "DCM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitNATO_ASL_M", 0, "AM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitNATO_BSL_M", 0, "BM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitNATO_CSL_M", 0, "CM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;

	};

// ====================================================================================

// MARKERS: OPFOR > CSAT
// Markers seen by players in CSAT slots.

	case "opf_f":
	{
		["GrpCSAT_CO", 0, "CO", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_DC", 0, "DC", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_ASL", 0, "ASL", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_A1", 1, "A1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_A2", 1, "A2", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_A3", 1, "A3", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_BSL", 0, "BSL", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_B1", 1, "B1", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_B2", 1, "B2", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_B3", 1, "B3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_CSL", 0, "CSL", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_C1", 1, "C1", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_C2", 1, "C2", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_C3", 1, "C3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_MMG1", 2, "MMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_MAT1", 3, "MAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

// 		["GrpCSAT_ST1",  4, "ST1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpCSAT_HMG1",  2, "HMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpCSAT_MTR1",  5, "MTR1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpCSAT_HAT1",  3, "HAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpCSAT_SAM1",  3, "SAM1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["GrpCSAT_ENG1",  6, "ENG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

 		["GrpCSAT_IFV1",  7, "IFV1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_IFV2",  7, "IFV2", "ColorRed"] spawn fnc_folk_localGroupMarker;
 		["GrpCSAT_IFV3",  7, "IFV3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_IFV4",  7, "IFV4", "ColorBlue"] spawn fnc_folk_localGroupMarker;
 		["GrpCSAT_IFV5",  7, "IFV5", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_IFV6",  7, "IFV6", "ColorGreen"] spawn fnc_folk_localGroupMarker;
 		["GrpCSAT_IFV7",  7, "IFV7", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_IFV8",  7, "IFV8", "ColorOrange"] spawn fnc_folk_localGroupMarker;


 		["GrpCSAT_TNK1",  7, "TNK1", "ColorRed"] spawn fnc_folk_localGroupMarker;

		["GrpCSAT_TH1",  8, "TH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_TH2",  8, "TH2", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_TH3",  8, "TH3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_TH4",  8, "TH4", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_TH5",  8, "TH5", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_TH6",  8, "TH6", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_TH7",  8, "TH7", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_TH8",  8, "TH8", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["GrpCSAT_AH1",  8, "AH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpCSAT_DT1",  4, "DT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["UnitCSAT_CO_M", 0, "COM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitCSAT_DC_M", 0, "DCM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitCSAT_ASL_M", 0, "AM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitCSAT_BSL_M", 0, "BM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitCSAT_CSL_M", 0, "CM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
	};


// ====================================================================================

// MARKERS: INDEPEDENT > AAF
// Markers seen by players in AAF slots.

	case "ind_f":
	{
		["GrpAAF_CO", 0, "CO", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_DC", 0, "DC", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_ASL", 0, "ASL", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_A1", 1, "A1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_A2", 1, "A2", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_A3", 1, "A3", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_BSL", 0, "BSL", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_B1", 1, "B1", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_B2", 1, "B2", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_B3", 1, "B3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_CSL", 0, "CSL", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_C1", 1, "C1", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_C2", 1, "C2", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_C3", 1, "C3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_MMG1", 2, "MMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_MAT1", 3, "MAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

// 		["GrpAAF_ST1",  4, "ST1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpAAF_HMG1",  2, "HMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpAAF_MTR1",  5, "MTR1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpAAF_HAT1",  3, "HAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpAAF_SAM1",  3, "SAM1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["GrpAAF_ENG1",  6, "ENG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

 		["GrpAAF_IFV1",  7, "IFV1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_IFV2",  7, "IFV2", "ColorRed"] spawn fnc_folk_localGroupMarker;
 		["GrpAAF_IFV3",  7, "IFV3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_IFV4",  7, "IFV4", "ColorBlue"] spawn fnc_folk_localGroupMarker;
 		["GrpAAF_IFV5",  7, "IFV5", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_IFV6",  7, "IFV6", "ColorGreen"] spawn fnc_folk_localGroupMarker;
 		["GrpAAF_IFV7",  7, "IFV7", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_IFV8",  7, "IFV8", "ColorOrange"] spawn fnc_folk_localGroupMarker;

 		["GrpAAF_TNK1",  7, "TNK1", "ColorRed"] spawn fnc_folk_localGroupMarker;

		["GrpAAF_TH1",  8, "TH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_TH2",  8, "TH2", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_TH3",  8, "TH3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpAAF_TH4",  8, "TH4", "ColorOrange"] spawn fnc_folk_localGroupMarker;

// 		["GrpAAF_TH2",  8, "TH2", "ColorOrange"] spawn fnc_folk_localGroupMarker;
// 		["GrpAAF_AH1",  8, "AH1", "ColorRed"] spawn fnc_folk_localGroupMarker;

		["GrpAAF_DT1",  4, "DT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["UnitAAF_CO_M", 0, "COM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitAAF_DC_M", 0, "DCM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitAAF_ASL_M", 0, "AM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitAAF_BSL_M", 0, "BM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitAAF_CSL_M", 0, "CM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
	};
};

// ====================================================================================

if (true) exitWith {};