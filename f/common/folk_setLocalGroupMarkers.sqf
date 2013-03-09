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

fnc_folk_localGroupMarker = compile preprocessFile "f\common\folk_localGroupMarker.sqf";
fnc_folk_localSpecialistMarker = compile preprocessFile "f\common\folk_localSpecialistMarker.sqf";

// ====================================================================================
switch (_unitfaction) do
{

// ====================================================================================

// MARKERS: NATO
// Markers seen by players in NATO slots.

	case "blu_f":
	{
		["GrpNO_CO", 0, "CO", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpNO_DC", 0, "DC", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpNO_ASL", 0, "ASL", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNO_A1", 1, "A1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNO_A2", 1, "A2", "ColorRed"] spawn fnc_folk_localGroupMarker;		
		["GrpNO_A3", 1, "A3", "ColorRed"] spawn fnc_folk_localGroupMarker;		
		["GrpNO_BSL", 0, "BSL", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpNO_B1", 1, "B1", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpNO_B2", 1, "B2", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpNO_B3", 1, "B3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpNO_CSL", 0, "CSL", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNO_C1", 1, "C1", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNO_C2", 1, "C2", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNO_C3", 1, "C3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNO_MMG1", 2, "MMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNO_MAT1", 3, "MAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNO_ST1",  4, "ST1", "ColorOrange"] spawn fnc_folk_localGroupMarker;	
		["GrpNO_HMG1",  2, "HMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNO_MTR1",  5, "MTR1", "ColorOrange"] spawn fnc_folk_localGroupMarker;	
		["GrpNO_HAT1",  3, "HAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNO_SAM1",  3, "SAM1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNO_ENG1",  6, "ENG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNO_IFV1",  7, "IFV1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNO_IFV2",  7, "IFV2", "ColorBlue"] spawn fnc_folk_localGroupMarker;	
		["GrpNO_IFV3",  7, "IFV3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpNO_TNK1",  7, "TNK1", "ColorRed"] spawn fnc_folk_localGroupMarker;	
		["GrpNO_TH1",  8, "TH1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNO_TH2",  8, "TH2", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpNO_AH1",  8, "AH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpNO_DT1",  4, "DT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;

		["UnitNO_CO_M", 0, "COM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitNO_DC_M", 0, "DCM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitNO_ASL_M", 0, "AM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;		
		["UnitNO_BSL_M", 0, "BM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitNO_CSL_M", 0, "CM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;

	};

// ====================================================================================
	
// MARKERS: Iran
// Markers seen by players in Iran slots.
	
	case "opf_f":
	{
		["GrpIR_CO", 0, "CO", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpIR_DC", 0, "DC", "ColorYellow"] spawn fnc_folk_localGroupMarker;
		["GrpIR_ASL", 0, "ASL", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpIR_A1", 1, "A1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpIR_A2", 1, "A2", "ColorRed"] spawn fnc_folk_localGroupMarker;		
		["GrpIR_A3", 1, "A3", "ColorRed"] spawn fnc_folk_localGroupMarker;		
		["GrpIR_BSL", 0, "BSL", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpIR_B1", 1, "B1", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpIR_B2", 1, "B2", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpIR_B3", 1, "B3", "ColorBlue"] spawn fnc_folk_localGroupMarker;
		["GrpIR_CSL", 0, "CSL", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpIR_C1", 1, "C1", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpIR_C2", 1, "C2", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpIR_C3", 1, "C3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpIR_MMG1", 2, "MMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpIR_MAT1", 3, "MAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpIR_ST1",  4, "ST1", "ColorOrange"] spawn fnc_folk_localGroupMarker;	
		["GrpIR_HMG1",  2, "HMG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpIR_MTR1",  5, "MTR1", "ColorOrange"] spawn fnc_folk_localGroupMarker;	
		["GrpIR_HAT1",  3, "HAT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpIR_SAM1",  3, "SAM1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpIR_ENG1",  6, "ENG1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpIR_IFV1",  7, "IFV1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpIR_IFV2",  7, "IFV2", "ColorBlue"] spawn fnc_folk_localGroupMarker;	
		["GrpIR_IFV3",  7, "IFV3", "ColorGreen"] spawn fnc_folk_localGroupMarker;
		["GrpIR_TNK1",  7, "TNK1", "ColorRed"] spawn fnc_folk_localGroupMarker;	
		["GrpIR_TH1",  8, "TH1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpIR_TH2",  8, "TH2", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		["GrpIR_AH1",  8, "AH1", "ColorRed"] spawn fnc_folk_localGroupMarker;
		["GrpIR_DT1",  4, "DT1", "ColorOrange"] spawn fnc_folk_localGroupMarker;
		
		["UnitIR_CO_M", 0, "COM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitIR_DC_M", 0, "DCM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitIR_ASL_M", 0, "AM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;		
		["UnitIR_BSL_M", 0, "BM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
		["UnitIR_CSL_M", 0, "CM", "ColorBlack"] spawn fnc_folk_localSpecialistMarker;
	};
};

// ====================================================================================

if (true) exitWith {};