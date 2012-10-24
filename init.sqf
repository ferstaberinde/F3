// ====================================================================================

// F2 - Process ParamsArray
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

f_processParamsArray = [] execVM "f\common\f_processParamsArray.sqf";

// ====================================================================================

// F2 - Disable Saving and Auto Saving
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

enableSaving [false, false];

// ====================================================================================

// F2 - Respawn INIT
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

f_respawnINIT = player addEventHandler ["killed", {_this execVM "init_onPlayerRespawn.sqf"}];

// ====================================================================================

// F2 - Mission Maker Teleport
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_missionMakerTeleport = 0;
// [] execVM "f\common\f_missionMakerTeleport.sqf";

// ====================================================================================

// F2 - OA Briefing
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "briefing.sqf";

// ====================================================================================

// F2 - Mission Conditions Selector
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\f_setMissionConditions.sqf";

// ====================================================================================

// F2 - OA Folk Group IDs
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

f_script_setGroupIDs = [] execVM "f\common\folk_setGroupIDs.sqf";

// ====================================================================================

// F2 - ShackTactical Fireteam Member Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\ShackTac_setlocalFTMemberMarkers.sqf";

// ====================================================================================

// F2 - OA Folk Group Markers
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\folk_setLocalGroupMarkers.sqf";

// ====================================================================================

// F2 - F2 Common Local Variables
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

f_script_setLocalVars = [] execVM "f\common\f_setLocalVars.sqf";

// ====================================================================================

// F2 - Multiplayer Ending Controller 
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

f_endSelected = -1;
[] execVM "f\common\f_mpEndSetUp.sqf";

// ====================================================================================

// F2 - Kegetys Spectator Script
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\f_spect\specta_init.sqf";

// ====================================================================================

// F2 - Disable BIS Conversations
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

player setVariable ["BIS_noCoreConversations", true];

// ====================================================================================

// F2 - Automatic Body Removal
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_removeBodyDelay = 180;
// f_doNotRemoveBodies = [];
// [] execVM "f\common\f_addRemoveBodyEH.sqf";

// ====================================================================================

// F2 - Automatic Body Removal (FIFO)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_abrFIFOlength = 30;
// f_abrDistance = 150;
// f_abrFIFOmaxLength = 50;
// f_doNotRemoveBodies = [];
// ["fifo"] execVM "f\common\f_addRemoveBodyEH.sqf";
// [] execVM "f\server\f_abrFIFO.sqf";

// ====================================================================================

// F2 - Dynamic View Distance 
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_viewDistance_default = 1250;
// f_viewDistance_tank = 2000;
// f_viewDistance_rotaryWing = 2500;
// f_viewDistance_fixedWing = 5000;
// [] execVM "f\common\f_addSetViewDistanceEHs.sqf";

// ====================================================================================

// F2 - Authorised Crew Check
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// VehicleName addEventhandler ["GetIn", {[_this,[UnitName1,UnitName2]] execVM "f\common\f_isAuthorisedCrew.sqf"}];

// ====================================================================================

// F2 - Authorised Crew Type Check
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// VehicleName addEventhandler ["GetIn", {[_this,["UnitType1","UnitType2"]] execVM "f\common\f_isAuthorisedCrewType.sqf"}];

// ====================================================================================

// F2 - Casualties Cap
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [[GroupName],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// US
//[[GrpUS_CO,GrpUS_DC,GrpUS_ASL,GrpUS_BSL,GrpUS_CSL,GrpUS_A1,GrpUS_A2,GrpUS_A3,GrpUS_B1,GrpUS_B2,GrpUS_B3,GrpUS_C1,GrpUS_C2,GrpUS_C3,GrpUS_MMG1,GrpUS_MAT1,GrpUS_ST1,GrpUS_ENG1,GrpUS_MTR1,GrpUS_HAT1,GrpUS_HMG1,GrpUS_SAM1,GrpUS_IFV1,GrpUS_IFV2,GrpUS_IFV3,GrpUS_TNK1,GrpUS_TH1,GrpUS_TH2,GrpUS_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// USMC
//[[GrpUSMC_CO,GrpUSMC_DC,GrpUSMC_ASL,GrpUSMC_BSL,GrpUSMC_CSL,GrpUSMC_A1,GrpUSMC_A2,GrpUSMC_A3,GrpUSMC_B1,GrpUSMC_B2,GrpUSMC_B3,GrpUSMC_C1,GrpUSMC_C2,GrpUSMC_C3,GrpUSMC_MMG1,GrpUSMC_MAT1,GrpUSMC_ST1,GrpUSMC_ENG1,GrpUSMC_MTR1,GrpUSMC_HAT1,GrpUSMC_HMG1,GrpUSMC_SAM1,GrpUSMC_IFV1,GrpUSMC_IFV2,GrpUSMC_IFV3,GrpUSMC_TNK1,GrpUSMC_TH1,GrpUSMC_TH2,GrpUSMC_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// CDF
//[[GrpCDF_CO,GrpCDF_DC,GrpCDF_ASL,GrpCDF_BSL,GrpCDF_CSL,GrpCDF_A1,GrpCDF_A2,GrpCDF_A3,GrpCDF_B1,GrpCDF_B2,GrpCDF_B3,GrpCDF_C1,GrpCDF_C2,GrpCDF_C3,GrpCDF_MMG1,GrpCDF_MAT1,GrpCDF_ST1,GrpCDF_ENG1,GrpCDF_MTR1,GrpCDF_HAT1,GrpCDF_HMG1,GrpCDF_SAM1,GrpCDF_IFV1,GrpCDF_IFV2,GrpCDF_IFV3,GrpCDF_TNK1,GrpCDF_TH1,GrpCDF_TH2,GrpCDF_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// BAF
//[[GrpBAF_CO,GrpBAF_DC,GrpBAF_ASL,GrpBAF_BSL,GrpBAF_CSL,GrpBAF_A1,GrpBAF_A2,GrpBAF_A3,GrpBAF_B1,GrpBAF_B2,GrpBAF_B3,GrpBAF_C1,GrpBAF_C2,GrpBAF_C3,GrpBAF_MMG1,GrpBAF_MAT1,GrpBAF_ST1,GrpBAF_ENG1,GrpBAF_MTR1,GrpBAF_HAT1,GrpBAF_HMG1,GrpBAF_SAM1,GrpBAF_IFV1,GrpBAF_IFV2,GrpBAF_IFV3,GrpBAF_TNK1,GrpBAF_TH1,GrpBAF_TH2,GrpBAF_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// TK ARMY
//[[GrpTK_CO,GrpTK_DC,GrpTK_ASL,GrpTK_BSL,GrpTK_CSL,GrpTK_A1,GrpTK_A2,GrpTK_A3,GrpTK_B1,GrpTK_B2,GrpTK_B3,GrpTK_C1,GrpTK_C2,GrpTK_C3,GrpTK_MMG1,GrpTK_MAT1,GrpTK_ST1,GrpTK_ENG1,GrpTK_MTR1,GrpTK_HAT1,GrpTK_HMG1,GrpTK_SAM1,GrpTK_IFV1,GrpTK_IFV2,GrpTK_IFV3,GrpTK_TNK1,GrpTK_TH1,GrpTK_TH2,GrpTK_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// RUSSIAN ARMY
//[[GrpRU_CO,GrpRU_DC,GrpRU_ASL,GrpRU_BSL,GrpRU_CSL,GrpRU_A1,GrpRU_A2,GrpRU_A3,GrpRU_B1,GrpRU_B2,GrpRU_B3,GrpRU_C1,GrpRU_C2,GrpRU_C3,GrpRU_MMG1,GrpRU_MAT1,GrpRU_ST1,GrpRU_ENG1,GrpRU_MTR1,GrpRU_HAT1,GrpRU_HMG1,GrpRU_SAM1,GrpRU_IFV1,GrpRU_IFV2,GrpRU_IFV3,GrpRU_TNK1,GrpRU_TH1,GrpRU_TH2,GrpRU_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// TK INS
//[[GrpTKINS_CO,GrpTKINS_DC,GrpTKINS_ASL,GrpTKINS_BSL,GrpTKINS_CSL,GrpTKINS_A1,GrpTKINS_A2,GrpTKINS_A3,GrpTKINS_B1,GrpTKINS_B2,GrpTKINS_B3,GrpTKINS_C1,GrpTKINS_C2,GrpTKINS_C3,GrpTKINS_MMG1,GrpTKINS_MAT1,GrpTKINS_ST1,GrpTKINS_ENG1,GrpTKINS_MTR1,GrpTKINS_HAT1,GrpTKINS_HMG1,GrpTKINS_SAM1,GrpTKINS_IFV1,GrpTKINS_IFV2,GrpTKINS_IFV3,GrpTKINS_TNK1,GrpTKINS_TH1,GrpTKINS_TH2,GrpTKINS_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// CHDZK
//[[GrpINS_CO,GrpINS_DC,GrpINS_ASL,GrpINS_BSL,GrpINS_CSL,GrpINS_A1,GrpINS_A2,GrpINS_A3,GrpINS_B1,GrpINS_B2,GrpINS_B3,GrpINS_C1,GrpINS_C2,GrpINS_C3,GrpINS_MMG1,GrpINS_MAT1,GrpINS_ST1,GrpINS_ENG1,GrpINS_MTR1,GrpINS_HAT1,GrpINS_HMG1,GrpINS_SAM1,GrpINS_IFV1,GrpINS_IFV2,GrpINS_IFV3,GrpINS_TNK1,GrpINS_TH1,GrpINS_TH2,GrpINS_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// TK GUE
//[[GrpTKGUE_CO,GrpTKGUE_DC,GrpTKGUE_ASL,GrpTKGUE_BSL,GrpTKGUE_CSL,GrpTKGUE_A1,GrpTKGUE_A2,GrpTKGUE_A3,GrpTKGUE_B1,GrpTKGUE_B2,GrpTKGUE_B3,GrpTKGUE_C1,GrpTKGUE_C2,GrpTKGUE_C3,GrpTKGUE_MMG1,GrpTKGUE_MAT1,GrpTKGUE_ST1,GrpTKGUE_ENG1,GrpTKGUE_MTR1,GrpTKGUE_HAT1,GrpTKGUE_HMG1,GrpTKGUE_SAM1,GrpTKGUE_IFV1,GrpTKGUE_IFV2,GrpTKGUE_IFV3,GrpTKGUE_TNK1,GrpTKGUE_TH1,GrpTKGUE_TH2,GrpTKGUE_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// NAPA
//[[GrpGUE_CO,GrpGUE_DC,GrpGUE_ASL,GrpGUE_BSL,GrpGUE_CSL,GrpGUE_A1,GrpGUE_A2,GrpGUE_A3,GrpGUE_B1,GrpGUE_B2,GrpGUE_B3,GrpGUE_C1,GrpGUE_C2,GrpGUE_C3,GrpGUE_MMG1,GrpGUE_MAT1,GrpGUE_ST1,GrpGUE_ENG1,GrpGUE_MTR1,GrpGUE_HAT1,GrpGUE_HMG1,GrpGUE_SAM1,GrpGUE_IFV1,GrpGUE_IFV2,GrpGUE_IFV3,GrpGUE_TNK1,GrpGUE_TH1,GrpGUE_TH2,GrpGUE_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// UN
//[[GrpUN_CO,GrpUN_DC,GrpUN_ASL,GrpUN_BSL,GrpUN_CSL,GrpUN_A1,GrpUN_A2,GrpUN_A3,GrpUN_B1,GrpUN_B2,GrpUN_B3,GrpUN_C1,GrpUN_C2,GrpUN_C3,GrpUN_MMG1,GrpUN_MAT1,GrpUN_ST1,GrpUN_ENG1,GrpUN_MTR1,GrpUN_HAT1,GrpUN_HMG1,GrpUN_SAM1,GrpUN_IFV1,GrpUN_IFV2,GrpUN_IFV3,GrpUN_TNK1,GrpUN_TH1,GrpUN_TH2,GrpUN_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// ====================================================================================

// F2 - Casualties Cap (Advanced)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [[GroupName],100] execVM "f\server\f_casualtiesCapAdv.sqf";

// ====================================================================================

// F2 - AI Skill Selector (coop)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_isFriendlyBLU = 1;
// f_isFriendlyRES = 1;
// f_isFriendlyOPF = 0;
// f_isFriendlyCIV = 1;
// [] execVM "f\common\f_setAISkill.sqf";

// ====================================================================================

// F2 - AI Skill Selector (A&D)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_isFriendlyToBLU_RES = 1;
// f_isFriendlyToBLU_CIV = 1;
// [] execVM "f\common\f_setAISkillAD.sqf";

// ====================================================================================

// F2 - Construction Interface (COIN) Presets
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// f_COINstopped = false;
// [COINName,"UnitName",0,2500] execVM "f\common\f_COINpresets.sqf";

// ====================================================================================

// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [] execVM "f\common\f_recog\recog_init.sqf";

// ====================================================================================

// F2 - Group E&E Check
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

// [GroupName,ObjectName,100,1] execVM "f\server\f_groupEandECheck.sqf";

// ====================================================================================

// F2 - ORBAT notes
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)

[] execVM "f\common\f_orbatNotes.sqf"

// ====================================================================================