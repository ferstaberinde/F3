// ====================================================================================

// F3 - Process ParamsArray
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

f_processParamsArray = [] execVM "f\common\f_processParamsArray.sqf";

// ====================================================================================

// F3 - Disable Saving and Auto Saving
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSaving [false, false];

// ====================================================================================

// F3 - Respawn INIT
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_respawnINIT = player addEventHandler ["killed", {_this execVM "init_onPlayerRespawn.sqf"}];

// ====================================================================================

// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_missionMakerTeleport = 0;
// [] execVM "f\common\f_missionMakerTeleport.sqf";

// ====================================================================================

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "briefing.sqf";

// ====================================================================================

// F3 - Mission Conditions Selector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\common\f_setMissionConditions.sqf";

// ====================================================================================

// F3 - OA Folk Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setGroupIDs = [] execVM "f\common\folk_setGroupIDs.sqf";

// ====================================================================================

// F3 - ShackTactical Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\common\ShackTac_setlocalFTMemberMarkers.sqf";

// ====================================================================================

// F3 - OA Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\common\folk_setLocalGroupMarkers.sqf";

// ====================================================================================

// F3 - F3 Common Local Variables
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

f_script_setLocalVars = [] execVM "f\common\f_setLocalVars.sqf";

// ====================================================================================

// F3 - Multiplayer Ending Controller 
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_endSelected = -1;
[] execVM "f\common\f_mpEndSetUp.sqf";

// ====================================================================================

// F3 - Kegetys Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\common\f_spect\specta_init.sqf";

// ====================================================================================

// F3 - Automatic Body Removal
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_removeBodyDelay = 180;
// f_doNotRemoveBodies = [];
// [] execVM "f\common\f_addRemoveBodyEH.sqf";

// ====================================================================================

// F3 - Automatic Body Removal (FIFO)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_abrFIFOlength = 30;
// f_abrDistance = 150;
// f_abrFIFOmaxLength = 50;
// f_doNotRemoveBodies = [];
// ["fifo"] execVM "f\common\f_addRemoveBodyEH.sqf";
// [] execVM "f\server\f_abrFIFO.sqf";

// ====================================================================================

// F3 - Dynamic View Distance 
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_viewDistance_default = 1250;
// f_viewDistance_tank = 2000;
// f_viewDistance_rotaryWing = 2500;
// f_viewDistance_fixedWing = 5000;
// [] execVM "f\common\f_addSetViewDistanceEHs.sqf";

// ====================================================================================

// F3 - Authorised Crew Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// VehicleName addEventhandler ["GetIn", {[_this,[UnitName1,UnitName2]] execVM "f\common\f_isAuthorisedCrew.sqf"}];

// ====================================================================================

// F3 - Authorised Crew Type Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// VehicleName addEventhandler ["GetIn", {[_this,["UnitType1","UnitType2"]] execVM "f\common\f_isAuthorisedCrewType.sqf"}];

// ====================================================================================

// F3 - Casualties Cap
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

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

// TK Insurgents
//[[GrpINS_CO,GrpINS_DC,GrpINS_ASL,GrpINS_BSL,GrpINS_CSL,GrpINS_A1,GrpINS_A2,GrpINS_A3,GrpINS_B1,GrpINS_B2,GrpINS_B3,GrpINS_C1,GrpINS_C2,GrpINS_C3,GrpINS_MMG1,GrpINS_MAT1,GrpINS_ST1,GrpINS_ENG1,GrpINS_MTR1,GrpINS_HAT1,GrpINS_HMG1,GrpINS_SAM1,GrpINS_IFV1,GrpINS_IFV2,GrpINS_IFV3,GrpINS_TNK1,GrpINS_TH1,GrpINS_TH2,GrpINS_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// CHDKZ
//[[GrpA2INS_CO,GrpA2INS_DC,GrpA2INS_ASL,GrpA2INS_BSL,GrpA2INS_CSL,GrpA2INS_A1,GrpA2INS_A2,GrpA2INS_A3,GrpA2INS_B1,GrpA2INS_B2,GrpA2INS_B3,GrpA2INS_C1,GrpA2INS_C2,GrpA2INS_C3,GrpA2INS_MMG1,GrpA2INS_MAT1,GrpA2INS_ST1,GrpA2INS_ENG1,GrpA2INS_MTR1,GrpA2INS_HAT1,GrpA2INS_HMG1,GrpA2INS_SAM1,GrpA2INS_IFV1,GrpA2INS_IFV2,GrpA2INS_IFV3,GrpA2INS_TNK1,GrpA2INS_TH1,GrpA2INS_TH2,GrpA2INS_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// TK Local
//[[GrpGUE_CO,GrpGUE_DC,GrpGUE_ASL,GrpGUE_BSL,GrpGUE_CSL,GrpGUE_A1,GrpGUE_A2,GrpGUE_A3,GrpGUE_B1,GrpGUE_B2,GrpGUE_B3,GrpGUE_C1,GrpGUE_C2,GrpGUE_C3,GrpGUE_MMG1,GrpGUE_MAT1,GrpGUE_ST1,GrpGUE_ENG1,GrpGUE_MTR1,GrpGUE_HAT1,GrpGUE_HMG1,GrpGUE_SAM1,GrpGUE_IFV1,GrpGUE_IFV2,GrpGUE_IFV3,GrpGUE_TNK1,GrpGUE_TH1,GrpGUE_TH2,GrpGUE_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// NAPA
//[[GrpA2GUE_CO,GrpA2GUE_DC,GrpA2GUE_ASL,GrpA2GUE_BSL,GrpA2GUE_CSL,GrpA2GUE_A1,GrpA2GUE_A2,GrpA2GUE_A3,GrpA2GUE_B1,GrpA2GUE_B2,GrpA2GUE_B3,GrpA2GUE_C1,GrpA2GUE_C2,GrpA2GUE_C3,GrpA2GUE_MMG1,GrpA2GUE_MAT1,GrpA2GUE_ST1,GrpA2GUE_ENG1,GrpA2GUE_MTR1,GrpA2GUE_HAT1,GrpA2GUE_HMG1,GrpA2GUE_SAM1,GrpA2GUE_IFV1,GrpA2GUE_IFV2,GrpA2GUE_IFV3,GrpA2GUE_TNK1,GrpA2GUE_TH1,GrpA2GUE_TH2,GrpA2GUE_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// UN
//[[GrpUN_CO,GrpUN_DC,GrpUN_ASL,GrpUN_BSL,GrpUN_CSL,GrpUN_A1,GrpUN_A2,GrpUN_A3,GrpUN_B1,GrpUN_B2,GrpUN_B3,GrpUN_C1,GrpUN_C2,GrpUN_C3,GrpUN_MMG1,GrpUN_MAT1,GrpUN_ST1,GrpUN_ENG1,GrpUN_MTR1,GrpUN_HAT1,GrpUN_HMG1,GrpUN_SAM1,GrpUN_IFV1,GrpUN_IFV2,GrpUN_IFV3,GrpUN_TNK1,GrpUN_TH1,GrpUN_TH2,GrpUN_AH1],100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// ====================================================================================

// F3 - Casualties Cap (Advanced)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// [[GroupName],100] execVM "f\server\f_casualtiesCapAdv.sqf";

// ====================================================================================

// F3 - AI Skill Selector (coop)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_isFriendlyBLU = 1;
// f_isFriendlyRES = 1;
// f_isFriendlyOPF = 0;
// f_isFriendlyCIV = 1;
// [] execVM "f\common\f_setAISkill.sqf";

// ====================================================================================

// F3 - AI Skill Selector (A&D)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_isFriendlyToBLU_RES = 1;
// f_isFriendlyToBLU_CIV = 1;
// [] execVM "f\common\f_setAISkillAD.sqf";

// ====================================================================================

// F3 - Construction Interface (COIN) Presets
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_COINstopped = false;
// [COINName,"UnitName",0,2500] execVM "f\common\f_COINpresets.sqf";

// ====================================================================================

// F3 - Name Tags
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// [] execVM "f\common\f_recog\recog_init.sqf";

// ====================================================================================

// F3 - Group E&E Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// [GroupName,ObjectName,100,1] execVM "f\server\f_groupEandECheck.sqf";

// ====================================================================================

// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\common\f_orbatNotes.sqf";

// ====================================================================================

// F3 - Tripwire action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// [[UnitName1,UnitName2],25,2,east] execVM "f\common\fa_tripwire_init.sqf";

// ====================================================================================

// F3 - Join Group Action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[false] execVM "f\common\f_groupJoinAddOption.sqf";

