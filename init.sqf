// ====================================================================================

// F3 - Disable Saving and Auto Saving
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSaving [false, false];

// ====================================================================================

// F3 - Mission Maker Teleport
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_missionMakerTeleport = 0;
// [] execVM "f\common\f_missionMakerTeleport.sqf";

// ====================================================================================

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_briefing = [] execVM "briefing.sqf";

// ====================================================================================

// F3 - F3 Folk ARPS Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setGroupIDs = [] execVM "f\setGroupID\f_setGroupIDs.sqf";

// ====================================================================================

// F3 - Buddy Team Colours
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setTeamColours = [] execVM "f\common\f_setTeamColours.sqf";

// ====================================================================================

// F3 - Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] spawn f_fnc_SetLocalFTMemberMarkers;

// ====================================================================================

// F3 - F3 Folk ARPS Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\common\folk_setLocalGroupMarkers.sqf";

// ====================================================================================

// F3 - F3 Common Local Variables
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT

f_script_setLocalVars = [] execVM "f\common\f_setLocalVars.sqf";

// ====================================================================================

// F3 - Automatic Body Removal
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_removeBodyDelay = 180;
// f_removeBodyDistance = 500;
// f_doNotRemoveBodies = [];
// [] execVM "f\server\f_addRemoveBodyEH.sqf";

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

// BLUFOR > NATO
// [BLUFOR,100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// OPFOR > CSAT
// [OPFOR,100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// INDEPENDENT > AAF
// [INDEPENDENT,100,1] execVM "f\server\f_endOnCasualtiesCap.sqf";

// ====================================================================================

// F3 - Casualties Cap (Advanced)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// BLUFOR
// [BLUFOR,100] execVM "f\server\f_casualtiesCapAdv.sqf";

// OPFOR
// [OPFOR,100] execVM "f\server\f_casualtiesCapAdv.sqf";

// INDEPENDENT
// [INDEPENDENT,100] execVM "f\server\f_casualtiesCapAdv.sqf";

// ====================================================================================

// F3 - AI Skill Selector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// [] execVM "f\setAISKill\f_setAISkill.sqf";
// f_var_civAI = independent; // Optional: The civilian AI will use this side's settings

// ====================================================================================

// F3 - Name Tags
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// f_showGroup_Nametags = true;			// Display unit's group (uses GroupID)
// f_showDistance_Nametags = true;	// Show distance to player
// f_showVehicle_Nametags = true;		// Show vehicle player is in
// [20] execVM "f\common\f_nametags.sqf";

// ====================================================================================

// F3 - Simple Wounding System
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// [player] execVM "f\simplewoundingsystem\init.sqf";

// ====================================================================================

// F3 - Group E&E Check
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// [GroupName,ObjectName,100,1] execVM "f\server\f_groupEandECheck.sqf";

// ====================================================================================

// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\common\f_orbatNotes.sqf";

// ====================================================================================

// F3 - Join Group Action
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[false] execVM "f\common\f_groupJoinAddOption.sqf";

// ====================================================================================

// F3 - Mission Timer/Safe Start
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\safeStart\f_safeStart.sqf";

// ====================================================================================

// F3 - JIP setup
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_var_JIP_FirstMenu = false;   // Do players connecting for the first time get the JIP menu? - This only works in missions with respawn.
f_var_JIP_RemoveCorpse = true; // Remove the old corpse of respawning players?
f_var_JIP_GearMenu = true;     // Can JIP/respawned players select their own gear? False will use gear assigned by F3 Gear Component if possible

// ====================================================================================

// F3 - AI Unit Caching
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[30] spawn f_fnc_cInit;
