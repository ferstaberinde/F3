// F3 - Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unitfaction"];

// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what faction the player's slot belongs to, and stores
// it in the private variable _unitfaction

_unitfaction = toLower (faction player);

// If the unitfaction is different from the group leader's faction, the latters faction is used
if (_unitfaction != toLower (faction (leader group player))) then {_unitfaction = toLower (faction (leader group player))};

// ====================================================================================
switch (_unitfaction) do
{
// ====================================================================================

// MARKERS: BLUFOR > NATO
// Markers seen by players in NATO slots.

	case "blu_f":
	{
		// Infantry Platoon
		["GrpNATO_CO", 0, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpNATO_DC", 0, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;

		["GrpNATO_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpNATO_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpNATO_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpNATO_A3", 1, "A3", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpNATO_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpNATO_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpNATO_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpNATO_B3", 1, "B3", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpNATO_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpNATO_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpNATO_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpNATO_C3", 1, "C3", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpNATO_DSL", 0, "DSL", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpNATO_D1", 1, "D1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpNATO_D2", 1, "D2", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpNATO_D3", 1, "D3", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Weapon Teams
		["GrpNATO_MMG1", 2, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MMG2", 2, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MMG3", 2, "MMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MMG4", 2, "MMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MAT1", 3, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MAT2", 3, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_ST1",  4, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpNATO_ST2",  4, "ST2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpNATO_ST3",  4, "ST3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpNATO_ST4",  4, "ST4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpNATO_HMG1",  2, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_HMG2",  2, "HMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_HMG3",  2, "HMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_HMG4",  2, "HMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MTR1",  5, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpNATO_MTR2",  5, "MTR2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpNATO_MTR3",  5, "MTR3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpNATO_MTR4",  5, "MTR4", "ColorOrange"] spawn f_fnc_localGroupMarker;	//Mortar Team
		["GrpNATO_SAM1",  3, "SAM1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpNATO_SAM2",  3, "SAM2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpNATO_SAM3",  3, "SAM3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpNATO_SAM4",  3, "SAM4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team

		// AUX
		["GrpNATO_AUX",  6, "AUX", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_LOG",  6, "LOG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_FAC",  6, "FAC", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Do these mark squads or vehicles? Worth it for motorized missions.
		["GrpNATO_IFV1",  7, "IFV1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV2",  7, "IFV2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV3",  7, "IFV3", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV4",  7, "IFV4", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV5",  7, "IFV5", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV6",  7, "IFV6", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV7",  7, "IFV7", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_IFV8",  7, "IFV8", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Armor Division
 		["GrpNATO_T1",  8, "TITAN1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_T2",  8, "TITAN2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_T3",  8, "TITAN3", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_K1",  8, "KNIGHT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_K2",  8, "KNIGHT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_K3",  8, "KNIGHT3", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_G1",  8, "GLADIATOR1", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_G2",  8, "GLADIATOR2", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_G3",  8, "GLADIATOR3", "ColorGreen"] spawn f_fnc_localGroupMarker;

 		// Air Division, Transport Helicopters, callsigns not assigned to marker.
		["GrpNATO_TH1",  9, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_TH2",  9, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_TH3",  9, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_TH4",  9, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpNATO_TH5",  9, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpNATO_TH6",  9, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpNATO_TH7",  9, "TH7", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		["GrpNATO_TH8",  9, "TH8", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		// MEDEVAC Chopper
   		["GrpNATO_MH1",  9, "BANDAID1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpNATO_MH2",  9, "BANDAID2", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Tilt Rotor crews
		["GrpNATO_TIL1",  9, "TIL1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpNATO_TIL2",  9, "TIL2", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Transport Plane crews
		["GrpNATO_TP",  10, "TP", "ColorPurple"] spawn f_fnc_localGroupMarker;

		// Air Division, RotCAS
		["GrpNATO_CYC1",  9, "CYCLONE1", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpNATO_CYC2",  9, "CYCLONE2", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpNATO_CYC3",  9, "CYCLONE3", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpNATO_HUR1",  9, "HURRICANE1", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpNATO_HUR2",  9, "HURRICANE2", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpNATO_HUR3",  9, "HURRICANE3", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpNATO_TWI1",  9, "TWISTER1", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpNATO_TWI2",  9, "TWISTER2", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpNATO_TWI3",  9, "TWISTER3", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER

		// Air Division, Heli Scout
		["GrpNATO_SCO1",  9, "SCOUT1", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpNATO_SCO2",  9, "SCOUT2", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpNATO_SCO3",  9, "SCOUT3", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT


		// Air Division, Fast Air A2A
		["GrpNATO_FOI",  10, "FOIL", "ColorBlue"] spawn f_fnc_localGroupMarker;			//FOIL A2A
		["GrpNATO_RAP",  10, "RAPIER", "ColorBlue"] spawn f_fnc_localGroupMarker;		//BARON A2A
		["GrpNATO_SCI",  10, "SCIMITAR", "ColorBlue"] spawn f_fnc_localGroupMarker;		//SCIMITAR A2A
		["GrpNATO_LAN",  10, "LANCE", "ColorBlue"] spawn f_fnc_localGroupMarker;		//LANCE A2A

		// Air Division, Fast Air CAS
		["GrpNATO_FAL",  10, "FALCHION", "ColorBlue"] spawn f_fnc_localGroupMarker;	//FALCHION CAS
		["GrpNATO_CUT",  10, "CUTLASS", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CUTLASS CAS
		["GrpNATO_SAB",  10, "SABER", "ColorBlue"] spawn f_fnc_localGroupMarker;	//SABER CAS
		["GrpNATO_CLA",  10, "CLAYMORE", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CLAYMORE CAS

		// Divers
		["GrpNATO_DT1",  4, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Specialists (add FAC?)
		["UnitNATO_CO_M", 0, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_DC_M", 0, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_ASL_M", 0, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_BSL_M", 0, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_CSL_M", 0, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_DSL_M", 0, "DM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_FAC_1", 2, "FAC1", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_FAC_2", 2, "FAC2", "ColorBlue"]  spawn f_fnc_localSpecialistMarker;
		["UnitNATO_FAC_3", 2, "FAC3", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_FAC_4", 2, "FAC4", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_LOG_E1", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_LOG_E2", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_LOG_E3", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_LOG_E4", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitNATO_LOG_E5", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;

	};

// ====================================================================================

// MARKERS: OPFOR > CSAT
// Markers seen by players in CSAT slots.

	case "opf_f":
	{
		// Infantry Platoon
		["GrpCSAT_CO", 0, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_DC", 0, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;

		["GrpCSAT_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_A3", 1, "A3", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpCSAT_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_B3", 1, "B3", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpCSAT_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_C3", 1, "C3", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpCSAT_DSL", 0, "DSL", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_D1", 1, "D1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_D2", 1, "D2", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_D3", 1, "D3", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Weapon Teams
		["GrpCSAT_MMG1", 2, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MMG2", 2, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MMG3", 2, "MMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MMG4", 2, "MMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MAT1", 3, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MAT2", 3, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_ST1",  4, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpCSAT_ST2",  4, "ST2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpCSAT_ST3",  4, "ST3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpCSAT_ST4",  4, "ST4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpCSAT_HMG1",  2, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_HMG2",  2, "HMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_HMG3",  2, "HMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_HMG4",  2, "HMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MTR1",  5, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpCSAT_MTR2",  5, "MTR2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpCSAT_MTR3",  5, "MTR3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpCSAT_MTR4",  5, "MTR4", "ColorOrange"] spawn f_fnc_localGroupMarker;	//Mortar Team
		["GrpCSAT_SAM1",  3, "SAM1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpCSAT_SAM2",  3, "SAM2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpCSAT_SAM3",  3, "SAM3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpCSAT_SAM4",  3, "SAM4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team

		// AUX
		["GrpCSAT_AUX",  6, "AUX", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_LOG",  6, "LOG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_FAC",  6, "FAC", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Do these mark squads or vehicles? Worth it for motorized missions.
		["GrpCSAT_IFV1",  7, "IFV1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_IFV2",  7, "IFV2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_IFV3",  7, "IFV3", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_IFV4",  7, "IFV4", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_IFV5",  7, "IFV5", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_IFV6",  7, "IFV6", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_IFV7",  7, "IFV7", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_IFV8",  7, "IFV8", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Armor Division
 		["GrpCSAT_T1",  8, "TITAN1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_T2",  8, "TITAN2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_T3",  8, "TITAN3", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_K1",  8, "KNIGHT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_K2",  8, "KNIGHT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_K3",  8, "KNIGHT3", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_G1",  8, "GLADIATOR1", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_G2",  8, "GLADIATOR2", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_G3",  8, "GLADIATOR3", "ColorGreen"] spawn f_fnc_localGroupMarker;

 		// Air Division, Transport Helicopters, callsigns not assigned to marker.
		["GrpCSAT_TH1",  9, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_TH2",  9, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_TH3",  9, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_TH4",  9, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpCSAT_TH5",  9, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpCSAT_TH6",  9, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpCSAT_TH7",  9, "TH7", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		["GrpCSAT_TH8",  9, "TH8", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		// MEDEVAC Chopper
   		["GrpCSAT_MH1",  9, "BANDAID1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_MH2",  9, "BANDAID2", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Tilt Rotor crews
		["GrpCSAT_TIL1",  9, "TIL1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpCSAT_TIL2",  9, "TIL2", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Transport Plane crews
		["GrpCSAT_TP",  10, "TP", "ColorPurple"] spawn f_fnc_localGroupMarker;

		// Air Division, RotCAS
		["GrpCSAT_CYC1",  9, "CYCLONE1", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpCSAT_CYC2",  9, "CYCLONE2", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpCSAT_CYC3",  9, "CYCLONE3", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpCSAT_HUR1",  9, "HURRICANE1", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpCSAT_HUR2",  9, "HURRICANE2", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpCSAT_HUR3",  9, "HURRICANE3", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpCSAT_TWI1",  9, "TWISTER1", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpCSAT_TWI2",  9, "TWISTER2", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpCSAT_TWI3",  9, "TWISTER3", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER

		// Air Division, Heli Scout
		["GrpCSAT_SCO1",  9, "SCOUT1", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpCSAT_SCO2",  9, "SCOUT2", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpCSAT_SCO3",  9, "SCOUT3", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT


		// Air Division, Fast Air A2A
		["GrpCSAT_FOI",  10, "FOIL", "ColorBlue"] spawn f_fnc_localGroupMarker;			//FOIL A2A
		["GrpCSAT_RAP",  10, "RAPIER", "ColorBlue"] spawn f_fnc_localGroupMarker;		//BARON A2A
		["GrpCSAT_SCI",  10, "SCIMITAR", "ColorBlue"] spawn f_fnc_localGroupMarker;		//SCIMITAR A2A
		["GrpCSAT_LAN",  10, "LANCE", "ColorBlue"] spawn f_fnc_localGroupMarker;		//LANCE A2A

		// Air Division, Fast Air CAS
		["GrpCSAT_FAL",  10, "FALCHION", "ColorBlue"] spawn f_fnc_localGroupMarker;	//FALCHION CAS
		["GrpCSAT_CUT",  10, "CUTLASS", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CUTLASS CAS
		["GrpCSAT_SAB",  10, "SABER", "ColorBlue"] spawn f_fnc_localGroupMarker;	//SABER CAS
		["GrpCSAT_CLA",  10, "CLAYMORE", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CLAYMORE CAS

		// Divers
		["GrpCSAT_DT1",  4, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Specialists (add FAC?)
		["UnitCSAT_CO_M", 0, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_DC_M", 0, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_ASL_M", 0, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_BSL_M", 0, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_CSL_M", 0, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_DSL_M", 0, "DM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_FAC_1", 2, "FAC1", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_FAC_2", 2, "FAC2", "ColorBlue"]  spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_FAC_3", 2, "FAC3", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_FAC_4", 2, "FAC4", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_LOG_E1", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_LOG_E2", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_LOG_E3", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_LOG_E4", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitCSAT_LOG_E5", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;

	};

// ====================================================================================

// MARKERS: INDEPEDENT > AAF
// Markers seen by players in AAF slots.

	case "ind_f":
	{
		["GrpAAF_CO", 0, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpAAF_DC", 0, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;

		["GrpAAF_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpAAF_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpAAF_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpAAF_A3", 1, "A3", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpAAF_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpAAF_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpAAF_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpAAF_B3", 1, "B3", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpAAF_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpAAF_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpAAF_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpAAF_C3", 1, "C3", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpAAF_DSL", 0, "DSL", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpAAF_D1", 1, "D1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpAAF_D2", 1, "D2", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpAAF_D3", 1, "D3", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Weapon Teams
		["GrpAAF_MMG1", 2, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MMG2", 2, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MMG3", 2, "MMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MMG4", 2, "MMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MAT1", 3, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MAT2", 3, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_ST1",  4, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpAAF_ST2",  4, "ST2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpAAF_ST3",  4, "ST3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpAAF_ST4",  4, "ST4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpAAF_HMG1",  2, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_HMG2",  2, "HMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_HMG3",  2, "HMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_HMG4",  2, "HMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MTR1",  5, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpAAF_MTR2",  5, "MTR2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpAAF_MTR3",  5, "MTR3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpAAF_MTR4",  5, "MTR4", "ColorOrange"] spawn f_fnc_localGroupMarker;	//Mortar Team
		["GrpAAF_SAM1",  3, "SAM1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpAAF_SAM2",  3, "SAM2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpAAF_SAM3",  3, "SAM3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpAAF_SAM4",  3, "SAM4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team

		// AUX
		["GrpAAF_AUX",  6, "AUX", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_LOG",  6, "LOG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_FAC",  6, "FAC", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Do these mark squads or vehicles? Worth it for motorized missions.
		["GrpAAF_IFV1",  7, "IFV1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpAAF_IFV2",  7, "IFV2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpAAF_IFV3",  7, "IFV3", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpAAF_IFV4",  7, "IFV4", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpAAF_IFV5",  7, "IFV5", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpAAF_IFV6",  7, "IFV6", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpAAF_IFV7",  7, "IFV7", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_IFV8",  7, "IFV8", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Armor Division
 		["GrpAAF_T1",  8, "TITAN1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_T2",  8, "TITAN2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_T3",  8, "TITAN3", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_K1",  8, "KNIGHT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_K2",  8, "KNIGHT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_K3",  8, "KNIGHT3", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_G1",  8, "GLADIATOR1", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_G2",  8, "GLADIATOR2", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_G3",  8, "GLADIATOR3", "ColorGreen"] spawn f_fnc_localGroupMarker;

 		// Air Division, Transport Helicopters, callsigns not assigned to marker.
		["GrpAAF_TH1",  9, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_TH2",  9, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_TH3",  9, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_TH4",  9, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpAAF_TH5",  9, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpAAF_TH6",  9, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpAAF_TH7",  9, "TH7", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		["GrpAAF_TH8",  9, "TH8", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		// MEDEVAC Chopper
   		["GrpAAF_MH1",  9, "BANDAID1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpAAF_MH2",  9, "BANDAID2", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Tilt Rotor crews
		["GrpAAF_TIL1",  9, "TIL1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpAAF_TIL2",  9, "TIL2", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Transport Plane crews
		["GrpAAF_TP",  10, "TP", "ColorPurple"] spawn f_fnc_localGroupMarker;

		// Air Division, RotCAS
		["GrpAAF_CYC1",  9, "CYCLONE1", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpAAF_CYC2",  9, "CYCLONE2", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpAAF_CYC3",  9, "CYCLONE3", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpAAF_HUR1",  9, "HURRICANE1", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpAAF_HUR2",  9, "HURRICANE2", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpAAF_HUR3",  9, "HURRICANE3", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpAAF_TWI1",  9, "TWISTER1", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpAAF_TWI2",  9, "TWISTER2", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpAAF_TWI3",  9, "TWISTER3", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER

		// Air Division, Heli Scout
		["GrpAAF_SCO1",  9, "SCOUT1", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpAAF_SCO2",  9, "SCOUT2", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpAAF_SCO3",  9, "SCOUT3", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT


		// Air Division, Fast Air A2A
		["GrpAAF_FOI",  10, "FOIL", "ColorBlue"] spawn f_fnc_localGroupMarker;			//FOIL A2A
		["GrpAAF_RAP",  10, "RAPIER", "ColorBlue"] spawn f_fnc_localGroupMarker;		//BARON A2A
		["GrpAAF_SCI",  10, "SCIMITAR", "ColorBlue"] spawn f_fnc_localGroupMarker;		//SCIMITAR A2A
		["GrpAAF_LAN",  10, "LANCE", "ColorBlue"] spawn f_fnc_localGroupMarker;			//LANCE A2A

		// Air Division, Fast Air CAS
		["GrpAAF_FAL",  10, "FALCHION", "ColorBlue"] spawn f_fnc_localGroupMarker;	//FALCHION CAS
		["GrpAAF_CUT",  10, "CUTLASS", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CUTLASS CAS
		["GrpAAF_SAB",  10, "SABER", "ColorBlue"] spawn f_fnc_localGroupMarker;		//SABER CAS
		["GrpAAF_CLA",  10, "CLAYMORE", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CLAYMORE CAS

		// Divers
		["GrpAAF_DT1",  4, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Specialists (add FAC?)
		["UnitAAF_CO_M", 0, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_DC_M", 0, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_ASL_M", 0, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_BSL_M", 0, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_CSL_M", 0, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_DSL_M", 0, "DM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_FAC_1", 2, "FAC1", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_FAC_2", 2, "FAC2", "ColorBlue"]  spawn f_fnc_localSpecialistMarker;
		["UnitAAF_FAC_3", 2, "FAC3", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_FAC_4", 2, "FAC4", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_LOG_E1", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_LOG_E2", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_LOG_E3", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_LOG_E4", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitAAF_LOG_E5", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;

	};

// ====================================================================================

// MARKERS: BLUFOR > FIA
// Markers seen by players in BLUFOR-FIA slots.

	case "blu_g_f":
	{
		// Infantry Platoon
		["GrpFIA_CO", 0, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpFIA_DC", 0, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;

		["GrpFIA_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpFIA_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpFIA_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpFIA_A3", 1, "A3", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpFIA_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpFIA_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpFIA_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpFIA_B3", 1, "B3", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpFIA_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpFIA_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpFIA_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpFIA_C3", 1, "C3", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpFIA_DSL", 0, "DSL", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpFIA_D1", 1, "D1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpFIA_D2", 1, "D2", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpFIA_D3", 1, "D3", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Weapon Teams
		["GrpFIA_MMG1", 2, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MMG2", 2, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MMG3", 2, "MMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MMG4", 2, "MMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MAT1", 3, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MAT2", 3, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_ST1",  4, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpFIA_ST2",  4, "ST2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpFIA_ST3",  4, "ST3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpFIA_ST4",  4, "ST4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpFIA_HMG1",  2, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_HMG2",  2, "HMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_HMG3",  2, "HMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_HMG4",  2, "HMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MTR1",  5, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpFIA_MTR2",  5, "MTR2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpFIA_MTR3",  5, "MTR3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpFIA_MTR4",  5, "MTR4", "ColorOrange"] spawn f_fnc_localGroupMarker;	//Mortar Team
		["GrpFIA_SAM1",  3, "SAM1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpFIA_SAM2",  3, "SAM2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpFIA_SAM3",  3, "SAM3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpFIA_SAM4",  3, "SAM4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team

		// AUX
		["GrpFIA_AUX",  6, "AUX", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_LOG",  6, "LOG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_FAC",  6, "FAC", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Do these mark squads or vehicles? Worth it for motorized missions.
		["GrpFIA_IFV1",  7, "IFV1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV2",  7, "IFV2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV3",  7, "IFV3", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV4",  7, "IFV4", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV5",  7, "IFV5", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV6",  7, "IFV6", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV7",  7, "IFV7", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_IFV8",  7, "IFV8", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Armor Division
 		["GrpFIA_T1",  8, "TITAN1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_T2",  8, "TITAN2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_T3",  8, "TITAN3", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_K1",  8, "KNIGHT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_K2",  8, "KNIGHT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_K3",  8, "KNIGHT3", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_G1",  8, "GLADIATOR1", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_G2",  8, "GLADIATOR2", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_G3",  8, "GLADIATOR3", "ColorGreen"] spawn f_fnc_localGroupMarker;

 		// Air Division, Transport Helicopters, callsigns not assigned to marker.
		["GrpFIA_TH1",  9, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_TH2",  9, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_TH3",  9, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_TH4",  9, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpFIA_TH5",  9, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpFIA_TH6",  9, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpFIA_TH7",  9, "TH7", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		["GrpFIA_TH8",  9, "TH8", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		// MEDEVAC Chopper
   		["GrpFIA_MH1",  9, "BANDAID1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpFIA_MH2",  9, "BANDAID2", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Tilt Rotor crews
		["GrpFIA_TIL1",  9, "TIL1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpFIA_TIL2",  9, "TIL2", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Transport Plane crews
		["GrpFIA_TP",  10, "TP", "ColorPurple"] spawn f_fnc_localGroupMarker;

		// Air Division, RotCAS
		["GrpFIA_CYC1",  9, "CYCLONE1", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpFIA_CYC2",  9, "CYCLONE2", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpFIA_CYC3",  9, "CYCLONE3", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpFIA_HUR1",  9, "HURRICANE1", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpFIA_HUR2",  9, "HURRICANE2", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpFIA_HUR3",  9, "HURRICANE3", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpFIA_TWI1",  9, "TWISTER1", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpFIA_TWI2",  9, "TWISTER2", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpFIA_TWI3",  9, "TWISTER3", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER

		// Air Division, Heli Scout
		["GrpFIA_SCO1",  9, "SCOUT1", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpFIA_SCO2",  9, "SCOUT2", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpFIA_SCO3",  9, "SCOUT3", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT


		// Air Division, Fast Air A2A
		["GrpFIA_FOI",  10, "FOIL", "ColorBlue"] spawn f_fnc_localGroupMarker;			//FOIL A2A
		["GrpFIA_RAP",  10, "RAPIER", "ColorBlue"] spawn f_fnc_localGroupMarker;		//BARON A2A
		["GrpFIA_SCI",  10, "SCIMITAR", "ColorBlue"] spawn f_fnc_localGroupMarker;		//SCIMITAR A2A
		["GrpFIA_LAN",  10, "LANCE", "ColorBlue"] spawn f_fnc_localGroupMarker;			//LANCE A2A

		// Air Division, Fast Air CAS
		["GrpFIA_FAL",  10, "FALCHION", "ColorBlue"] spawn f_fnc_localGroupMarker;	//FALCHION CAS
		["GrpFIA_CUT",  10, "CUTLASS", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CUTLASS CAS
		["GrpFIA_SAB",  10, "SABER", "ColorBlue"] spawn f_fnc_localGroupMarker;		//SABER CAS
		["GrpFIA_CLA",  10, "CLAYMORE", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CLAYMORE CAS

		// Divers
		["GrpFIA_DT1",  4, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Specialists (add FAC?)
		["UnitFIA_CO_M", 0, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_DC_M", 0, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_ASL_M", 0, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_BSL_M", 0, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_CSL_M", 0, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_DSL_M", 0, "DM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_FAC_1", 2, "FAC1", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_FAC_2", 2, "FAC2", "ColorBlue"]  spawn f_fnc_localSpecialistMarker;
		["UnitFIA_FAC_3", 2, "FAC3", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_FAC_4", 2, "FAC4", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_LOG_E1", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_LOG_E2", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_LOG_E3", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_LOG_E4", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitFIA_LOG_E5", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;

	};

// ====================================================================================

// MARKERS: OPFOR > FIA
// Markers seen by players in OPFOR-FIA slots.

	case "opf_g_f":
	{
		["GrpOFIA_CO", 0, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_DC", 0, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;

		["GrpOFIA_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_A3", 1, "A3", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpOFIA_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_B3", 1, "B3", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpOFIA_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_C3", 1, "C3", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpOFIA_DSL", 0, "DSL", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_D1", 1, "D1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_D2", 1, "D2", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_D3", 1, "D3", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Weapon Teams
		["GrpOFIA_MMG1", 2, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MMG2", 2, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MMG3", 2, "MMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MMG4", 2, "MMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MAT1", 3, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MAT2", 3, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_ST1",  4, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpOFIA_ST2",  4, "ST2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpOFIA_ST3",  4, "ST3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpOFIA_ST4",  4, "ST4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpOFIA_HMG1",  2, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_HMG2",  2, "HMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_HMG3",  2, "HMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_HMG4",  2, "HMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MTR1",  5, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpOFIA_MTR2",  5, "MTR2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpOFIA_MTR3",  5, "MTR3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpOFIA_MTR4",  5, "MTR4", "ColorOrange"] spawn f_fnc_localGroupMarker;	//Mortar Team
		["GrpOFIA_SAM1",  3, "SAM1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpOFIA_SAM2",  3, "SAM2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpOFIA_SAM3",  3, "SAM3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpOFIA_SAM4",  3, "SAM4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team

		// AUX
		["GrpOFIA_AUX",  6, "AUX", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_LOG",  6, "LOG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_FAC",  6, "FAC", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Do these mark squads or vehicles? Worth it for motorized missions.
		["GrpOFIA_IFV1",  7, "IFV1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV2",  7, "IFV2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV3",  7, "IFV3", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV4",  7, "IFV4", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV5",  7, "IFV5", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV6",  7, "IFV6", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV7",  7, "IFV7", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_IFV8",  7, "IFV8", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Armor Division
 		["GrpOFIA_T1",  8, "TITAN1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_T2",  8, "TITAN2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_T3",  8, "TITAN3", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_K1",  8, "KNIGHT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_K2",  8, "KNIGHT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_K3",  8, "KNIGHT3", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_G1",  8, "GLADIATOR1", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_G2",  8, "GLADIATOR2", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_G3",  8, "GLADIATOR3", "ColorGreen"] spawn f_fnc_localGroupMarker;

 		// Air Division, Transport Helicopters, callsigns not assigned to marker.
		["GrpOFIA_TH1",  9, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_TH2",  9, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_TH3",  9, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_TH4",  9, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpOFIA_TH5",  9, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpOFIA_TH6",  9, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpOFIA_TH7",  9, "TH7", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		["GrpOFIA_TH8",  9, "TH8", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		// MEDEVAC Chopper
   		["GrpOFIA_MH1",  9, "BANDAID1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_MH2",  9, "BANDAID2", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Tilt Rotor crews
		["GrpOFIA_TIL1",  9, "TIL1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpOFIA_TIL2",  9, "TIL2", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Transport Plane crews
		["GrpOFIA_TP",  10, "TP", "ColorPurple"] spawn f_fnc_localGroupMarker;

		// Air Division, RotCAS
		["GrpOFIA_CYC1",  9, "CYCLONE1", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpOFIA_CYC2",  9, "CYCLONE2", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpOFIA_CYC3",  9, "CYCLONE3", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpOFIA_HUR1",  9, "HURRICANE1", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpOFIA_HUR2",  9, "HURRICANE2", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpOFIA_HUR3",  9, "HURRICANE3", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpOFIA_TWI1",  9, "TWISTER1", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpOFIA_TWI2",  9, "TWISTER2", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpOFIA_TWI3",  9, "TWISTER3", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER

		// Air Division, Heli Scout
		["GrpOFIA_SCO1",  9, "SCOUT1", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpOFIA_SCO2",  9, "SCOUT2", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpOFIA_SCO3",  9, "SCOUT3", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT


		// Air Division, Fast Air A2A
		["GrpOFIA_FOI",  10, "FOIL", "ColorBlue"] spawn f_fnc_localGroupMarker;			//FOIL A2A
		["GrpOFIA_RAP",  10, "RAPIER", "ColorBlue"] spawn f_fnc_localGroupMarker;		//BARON A2A
		["GrpOFIA_SCI",  10, "SCIMITAR", "ColorBlue"] spawn f_fnc_localGroupMarker;		//SCIMITAR A2A
		["GrpOFIA_LAN",  10, "LANCE", "ColorBlue"] spawn f_fnc_localGroupMarker;		//LANCE A2A

		// Air Division, Fast Air CAS
		["GrpOFIA_FAL",  10, "FALCHION", "ColorBlue"] spawn f_fnc_localGroupMarker;	//FALCHION CAS
		["GrpOFIA_CUT",  10, "CUTLASS", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CUTLASS CAS
		["GrpOFIA_SAB",  10, "SABER", "ColorBlue"] spawn f_fnc_localGroupMarker;	//SABER CAS
		["GrpOFIA_CLA",  10, "CLAYMORE", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CLAYMORE CAS

		// Divers
		["GrpOFIA_DT1",  4, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Specialists (add FAC?)
		["UnitOFIA_CO_M", 0, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_DC_M", 0, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_ASL_M", 0, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_BSL_M", 0, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_CSL_M", 0, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_DSL_M", 0, "DM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_FAC_1", 2, "FAC1", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_FAC_2", 2, "FAC2", "ColorBlue"]  spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_FAC_3", 2, "FAC3", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_FAC_4", 2, "FAC4", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_LOG_E1", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_LOG_E2", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_LOG_E3", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_LOG_E4", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitOFIA_LOG_E5", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;

	};

// ====================================================================================

// MARKERS: INDEPENDENT > FIA
// Markers seen by players in INDEPENDENT-FIA slots.

	case "ind_g_f":
	{
		["GrpIFIA_CO", 0, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_DC", 0, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;

		["GrpIFIA_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_A3", 1, "A3", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpIFIA_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_B3", 1, "B3", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpIFIA_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_C3", 1, "C3", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpIFIA_DSL", 0, "DSL", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_D1", 1, "D1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_D2", 1, "D2", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_D3", 1, "D3", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Weapon Teams
		["GrpIFIA_MMG1", 2, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MMG2", 2, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MMG3", 2, "MMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MMG4", 2, "MMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MAT1", 3, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MAT2", 3, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_ST1",  4, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpIFIA_ST2",  4, "ST2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpIFIA_ST3",  4, "ST3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpIFIA_ST4",  4, "ST4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpIFIA_HMG1",  2, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_HMG2",  2, "HMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_HMG3",  2, "HMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_HMG4",  2, "HMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MTR1",  5, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpIFIA_MTR2",  5, "MTR2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpIFIA_MTR3",  5, "MTR3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpIFIA_MTR4",  5, "MTR4", "ColorOrange"] spawn f_fnc_localGroupMarker;	//Mortar Team
		["GrpIFIA_SAM1",  3, "SAM1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpIFIA_SAM2",  3, "SAM2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpIFIA_SAM3",  3, "SAM3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpIFIA_SAM4",  3, "SAM4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team

		// AUX
		["GrpIFIA_AUX",  6, "AUX", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_LOG",  6, "LOG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_FAC",  6, "FAC", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Do these mark squads or vehicles? Worth it for motorized missions.
		["GrpIFIA_IFV1",  7, "IFV1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV2",  7, "IFV2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV3",  7, "IFV3", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV4",  7, "IFV4", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV5",  7, "IFV5", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV6",  7, "IFV6", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV7",  7, "IFV7", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_IFV8",  7, "IFV8", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Armor Division
 		["GrpIFIA_T1",  8, "TITAN1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_T2",  8, "TITAN2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_T3",  8, "TITAN3", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_K1",  8, "KNIGHT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_K2",  8, "KNIGHT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_K3",  8, "KNIGHT3", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_G1",  8, "GLADIATOR1", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_G2",  8, "GLADIATOR2", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_G3",  8, "GLADIATOR3", "ColorGreen"] spawn f_fnc_localGroupMarker;

 		// Air Division, Transport Helicopters, callsigns not assigned to marker.
		["GrpIFIA_TH1",  9, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_TH2",  9, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_TH3",  9, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_TH4",  9, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpIFIA_TH5",  9, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpIFIA_TH6",  9, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpIFIA_TH7",  9, "TH7", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		["GrpIFIA_TH8",  9, "TH8", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		// MEDEVAC Chopper
   		["GrpIFIA_MH1",  9, "BANDAID1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_MH2",  9, "BANDAID2", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Tilt Rotor crews
		["GrpIFIA_TIL1",  9, "TIL1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpIFIA_TIL2",  9, "TIL2", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Transport Plane crews
		["GrpIFIA_TP",  10, "TP", "ColorPurple"] spawn f_fnc_localGroupMarker;

		// Air Division, RotCAS
		["GrpIFIA_CYC1",  9, "CYCLONE1", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpIFIA_CYC2",  9, "CYCLONE2", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpIFIA_CYC3",  9, "CYCLONE3", "ColorRed"] spawn f_fnc_localGroupMarker;			//CYCLONE
		["GrpIFIA_HUR1",  9, "HURRICANE1", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpIFIA_HUR2",  9, "HURRICANE2", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpIFIA_HUR3",  9, "HURRICANE3", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpIFIA_TWI1",  9, "TWISTER1", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpIFIA_TWI2",  9, "TWISTER2", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpIFIA_TWI3",  9, "TWISTER3", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER

		// Air Division, Heli Scout
		["GrpIFIA_SCO1",  9, "SCOUT1", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpIFIA_SCO2",  9, "SCOUT2", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpIFIA_SCO3",  9, "SCOUT3", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT


		// Air Division, Fast Air A2A
		["GrpIFIA_FOI",  10, "FOIL", "ColorBlue"] spawn f_fnc_localGroupMarker;			//FOIL A2A
		["GrpIFIA_RAP",  10, "RAPIER", "ColorBlue"] spawn f_fnc_localGroupMarker;		//BARON A2A
		["GrpIFIA_SCI",  10, "SCIMITAR", "ColorBlue"] spawn f_fnc_localGroupMarker;		//SCIMITAR A2A
		["GrpIFIA_LAN",  10, "LANCE", "ColorBlue"] spawn f_fnc_localGroupMarker;		//LANCE A2A

		// Air Division, Fast Air CAS
		["GrpIFIA_FAL",  10, "FALCHION", "ColorBlue"] spawn f_fnc_localGroupMarker;	//FALCHION CAS
		["GrpIFIA_CUT",  10, "CUTLASS", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CUTLASS CAS
		["GrpIFIA_SAB",  10, "SABER", "ColorBlue"] spawn f_fnc_localGroupMarker;	//SABER CAS
		["GrpIFIA_CLA",  10, "CLAYMORE", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CLAYMORE CAS

		// Divers
		["GrpIFIA_DT1",  4, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Specialists (add FAC?)
		["UnitIFIA_CO_M", 0, "COM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_DC_M", 0, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_ASL_M", 0, "AM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_BSL_M", 0, "BM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_CSL_M", 0, "CM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_DSL_M", 0, "DM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_FAC_1", 2, "FAC1", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_FAC_2", 2, "FAC2", "ColorBlue"]  spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_FAC_3", 2, "FAC3", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_FAC_4", 2, "FAC4", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_LOG_E1", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_LOG_E2", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_LOG_E3", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_LOG_E4", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitIFIA_LOG_E5", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;

	};

// ====================================================================================

// MARKERS: BLUFOR > BW
// Markers seen by players in BW slots.

	case "bwa3_faction":
	{
		// Infantry Platoon
		["GrpBW_CO", 0, "CO", "ColorYellow"] spawn f_fnc_localGroupMarker;
		["GrpBW_DC", 0, "DC", "ColorYellow"] spawn f_fnc_localGroupMarker;

		["GrpBW_ASL", 0, "ASL", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpBW_A1", 1, "A1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpBW_A2", 1, "A2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpBW_A3", 1, "A3", "ColorRed"] spawn f_fnc_localGroupMarker;

		["GrpBW_BSL", 0, "BSL", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpBW_B1", 1, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpBW_B2", 1, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpBW_B3", 1, "B3", "ColorBlue"] spawn f_fnc_localGroupMarker;

		["GrpBW_CSL", 0, "CSL", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpBW_C1", 1, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpBW_C2", 1, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpBW_C3", 1, "C3", "ColorGreen"] spawn f_fnc_localGroupMarker;

		["GrpBW_DSL", 0, "DSL", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpBW_D1", 1, "D1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpBW_D2", 1, "D2", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpBW_D3", 1, "D3", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Weapon Teams
		["GrpBW_MMG1", 2, "MMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_MMG2", 2, "MMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_MMG3", 2, "MMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_MMG4", 2, "MMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_MAT1", 3, "MAT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_MAT2", 3, "MAT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_ST1",  4, "ST1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpBW_ST2",  4, "ST2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpBW_ST3",  4, "ST3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpBW_ST4",  4, "ST4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Sniper Team
		["GrpBW_HMG1",  2, "HMG1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_HMG2",  2, "HMG2", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_HMG3",  2, "HMG3", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_HMG4",  2, "HMG4", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_MTR1",  5, "MTR1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpBW_MTR2",  5, "MTR2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpBW_MTR3",  5, "MTR3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//Mortar Team
		["GrpBW_MTR4",  5, "MTR4", "ColorOrange"] spawn f_fnc_localGroupMarker;		//Mortar Team
		["GrpBW_SAM1",  3, "SAM1", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpBW_SAM2",  3, "SAM2", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpBW_SAM3",  3, "SAM3", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team
		["GrpBW_SAM4",  3, "SAM4", "ColorOrange"] spawn f_fnc_localGroupMarker; 	//AA Team

		// AUX
		["GrpBW_AUX",  6, "AUX", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_LOG",  6, "LOG", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_FAC",  6, "FAC", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Do these mark squads or vehicles? Worth it for motorized missions.
		["GrpBW_IFV1",  7, "IFV1", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpBW_IFV2",  7, "IFV2", "ColorRed"] spawn f_fnc_localGroupMarker;
		["GrpBW_IFV3",  7, "IFV3", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpBW_IFV4",  7, "IFV4", "ColorBlue"] spawn f_fnc_localGroupMarker;
		["GrpBW_IFV5",  7, "IFV5", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpBW_IFV6",  7, "IFV6", "ColorGreen"] spawn f_fnc_localGroupMarker;
		["GrpBW_IFV7",  7, "IFV7", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_IFV8",  7, "IFV8", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Armor Division
 		["GrpBW_T1",  8, "TITAN1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpBW_T2",  8, "TITAN2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpBW_T3",  8, "TITAN3", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpBW_K1",  8, "KNIGHT1", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpBW_K2",  8, "KNIGHT2", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpBW_K3",  8, "KNIGHT3", "ColorOrange"] spawn f_fnc_localGroupMarker;
 		["GrpBW_G1",  8, "GLADIATOR1", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpBW_G2",  8, "GLADIATOR2", "ColorGreen"] spawn f_fnc_localGroupMarker;
 		["GrpBW_G3",  8, "GLADIATOR3", "ColorGreen"] spawn f_fnc_localGroupMarker;

 		// Air Division, Transport Helicopters, callsigns not assigned to marker.
		["GrpBW_TH1",  9, "TH1", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpBW_TH2",  9, "TH2", "ColorRed"] spawn f_fnc_localGroupMarker;
 		["GrpBW_TH3",  9, "TH3", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpBW_TH4",  9, "TH4", "ColorBlue"] spawn f_fnc_localGroupMarker;
 		["GrpBW_TH5",  9, "TH5", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpBW_TH6",  9, "TH6", "ColorGreen"] spawn f_fnc_localGroupMarker;
  		["GrpBW_TH7",  9, "TH7", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		["GrpBW_TH8",  9, "TH8", "ColorBlack"] spawn f_fnc_localGroupMarker;
  		// MEDEVAC Chopper
   		["GrpBW_MH1",  9, "BANDAID1", "ColorBlack"] spawn f_fnc_localGroupMarker;
		["GrpBW_MH2",  9, "BANDAID2", "ColorBlack"] spawn f_fnc_localGroupMarker;

		// Tilt Rotor crews
		["GrpBW_TIL1",  9, "TIL1", "ColorOrange"] spawn f_fnc_localGroupMarker;
		["GrpBW_TIL2",  9, "TIL2", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Transport Plane crews
		["GrpBW_TP",  10, "TP", "ColorPurple"] spawn f_fnc_localGroupMarker;

		// Air Division, RotCAS
		["GrpBW_CYC1",  9, "CYCLONE1", "ColorRed"] spawn f_fnc_localGroupMarker;		//CYCLONE
		["GrpBW_CYC2",  9, "CYCLONE2", "ColorRed"] spawn f_fnc_localGroupMarker;		//CYCLONE
		["GrpBW_CYC3",  9, "CYCLONE3", "ColorRed"] spawn f_fnc_localGroupMarker;		//CYCLONE
		["GrpBW_HUR1",  9, "HURRICANE1", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpBW_HUR2",  9, "HURRICANE2", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpBW_HUR3",  9, "HURRICANE3", "ColorBlue"] spawn f_fnc_localGroupMarker;		//HURRICANE
		["GrpBW_TWI1",  9, "TWISTER1", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpBW_TWI2",  9, "TWISTER2", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER
		["GrpBW_TWI3",  9, "TWISTER3", "ColorGreen"] spawn f_fnc_localGroupMarker;		//TWISTER

		// Air Division, Heli Scout
		["GrpBW_SCO1",  9, "SCOUT1", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpBW_SCO2",  9, "SCOUT2", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT
		["GrpBW_SCO3",  9, "SCOUT3", "ColorBlack"] spawn f_fnc_localGroupMarker;		//SCOUT


		// Air Division, Fast Air A2A
		["GrpBW_FOI",  10, "FOIL", "ColorBlue"] spawn f_fnc_localGroupMarker;			//FOIL A2A
		["GrpBW_RAP",  10, "RAPIER", "ColorBlue"] spawn f_fnc_localGroupMarker;			//BARON A2A
		["GrpBW_SCI",  10, "SCIMITAR", "ColorBlue"] spawn f_fnc_localGroupMarker;		//SCIMITAR A2A
		["GrpBW_LAN",  10, "LANCE", "ColorBlue"] spawn f_fnc_localGroupMarker;			//LANCE A2A

		// Air Division, Fast Air CAS
		["GrpBW_FAL",  10, "FALCHION", "ColorBlue"] spawn f_fnc_localGroupMarker;	//FALCHION CAS
		["GrpBW_CUT",  10, "CUTLASS", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CUTLASS CAS
		["GrpBW_SAB",  10, "SABER", "ColorBlue"] spawn f_fnc_localGroupMarker;		//SABER CAS
		["GrpBW_CLA",  10, "CLAYMORE", "ColorBlue"] spawn f_fnc_localGroupMarker;	//CLAYMORE CAS

		// Divers
		["GrpBW_DT1",  4, "DT1", "ColorOrange"] spawn f_fnc_localGroupMarker;

		// Specialists (add FAC?)
		["UnitBW_CO_M", 0, "MED1", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_DC_M", 0, "DCM", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_ASL_M", 0, "MED2", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_BSL_M", 0, "MED3", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_CSL_M", 0, "MED4", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_DSL_M", 0, "MED5", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_FAC_1", 2, "FAC1", "ColorRed"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_FAC_2", 2, "FAC2", "ColorBlue"]  spawn f_fnc_localSpecialistMarker;
		["UnitBW_FAC_3", 2, "FAC3", "ColorGreen"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_FAC_4", 2, "FAC4", "ColorBlack"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_LOG_E1", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_LOG_E2", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_LOG_E3", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_LOG_E4", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;
		["UnitBW_LOG_E5", 3, "ENG1", "ColorOrange"] spawn f_fnc_localSpecialistMarker;

	};

// ====================================================================================

};

// ====================================================================================


