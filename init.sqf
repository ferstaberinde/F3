// ====================================================================================

// F3 - Common Local Variables
// Credits and documentation: https://github.com/folkarps/F3/wiki
// WARNING: DO NOT DISABLE THIS COMPONENT
if(isServer) then {
	f_script_setLocalVars = [] execVM "f\common\f_setLocalVars.sqf";
};

// ====================================================================================

// F3 - Disable Saving and Auto Saving
// Credits and documentation: https://github.com/folkarps/F3/wiki

enableSaving [false, false];

// ====================================================================================

// F3 - Mute Orders and Reports
// Credits and documentation: https://github.com/folkarps/F3/wiki

{_x setSpeaker "NoVoice"} forEach playableUnits;

// ====================================================================================

// F3 - Mission Timer/Safe Start
// Credits and documentation: https://github.com/folkarps/F3/wiki

[] execVM "f\safeStart\f_safeStart.sqf";

// ====================================================================================

// F3 - F3 Mission Conditions Selector
// Credits and documentation: https://github.com/folkarps/F3/wiki

f_script_setMissionConditions = [] execVM "f\missionConditions\f_setMissionConditions.sqf";

// ====================================================================================

// F3 - Folk ARPS Group IDs
// Credits and documentation: https://github.com/folkarps/F3/wiki

f_script_setGroupIDs = [] execVM "f\setGroupID\f_setGroupIDs.sqf";

// ====================================================================================

// F3 - F3 Folk ARPS Group Markers
// Credits and documentation: https://github.com/folkarps/F3/wiki

f_script_setGroupMarkers = [] execVM "f\groupMarkers\f_setLocalGroupMarkers.sqf";

// ====================================================================================

// F3 - Buddy Team Colours
// Credits and documentation: https://github.com/folkarps/F3/wiki

f_script_setTeamColours = [] execVM "f\setTeamColours\f_setTeamColours.sqf";

// ====================================================================================

// F3 - Fireteam Member Markers
// Credits and documentation: https://github.com/folkarps/F3/wiki

[] spawn f_fnc_SetLocalFTMemberMarkers;

// ====================================================================================

// F3 - Join Group Action
// Credits and documentation: https://github.com/folkarps/F3/wiki

[false] execVM "f\groupJoin\f_groupJoinAction.sqf";

// ====================================================================================

// F3 - Briefing
// Credits and documentation: https://github.com/folkarps/F3/wiki

f_script_briefing = [] spawn f_fnc_createBriefing;

// ====================================================================================

// F3 - ORBAT Notes
// Credits and documentation: https://github.com/folkarps/F3/wiki

[] execVM "f\briefing\f_orbatNotes.sqf";

// ====================================================================================

// F3 - Loadout Notes
// Credits and documentation: https://github.com/folkarps/F3/wiki

[] execVM "f\briefing\f_loadoutNotes.sqf";

// ====================================================================================

// F3 - Revive
// Credits and documentation: https://github.com/folkarps/F3/wiki
[] execVM "f\medical\init.sqf";

// ====================================================================================

// F3 - Combat Life Saver EH
// Credits and documentation: https://github.com/folkarps/F3/wiki
// Uncomment the line below to enable the Combat Life Saver heal handler. Does nothing unless you have player units using the "cls" assignGear role.

// [] execVM "f\medical\f_clsEH.sqf";

// ====================================================================================

// F3 - AI Unit Caching
// Credits and documentation: https://github.com/folkarps/F3/wiki

//[30] spawn f_fnc_cInit;

// Note: Caching aggressiveness is set using the f_var_cachingAggressiveness variable; possible values:
// 1 - cache only non-leaders and non-drivers
// 2 - cache all non-moving units, always exclude vehicle drivers
// 3 - cache all units, incl. group leaders and vehicle drivers
//f_var_cachingAggressiveness = 2;

// ====================================================================================

// F3 - Automatic Body Removal
// Credits and documentation: https://github.com/folkarps/F3/wiki

//Exclude units from automatic body/wreck removal:
removeFromRemainsCollector playableUnits;
//removeFromRemainsCollector [unit1, unit2, vehicle1];

// ====================================================================================

// F3 - AI Skill Selector
// Credits and documentation: https://github.com/folkarps/F3/wiki

f_var_civAI = independent; 		// Optional: The civilian AI will use this side's settings
[] execVM "f\setAISKill\f_setAISkill.sqf";

// ====================================================================================

// F3 - Assign Gear AI
// Credits and documentation: https://github.com/folkarps/F3/wiki

// [] execVM "f\assignGear\f_assignGear_AI.sqf";

// ====================================================================================

// F3 - Dynamic View Distance
// Credits and documentation: https://github.com/folkarps/F3/wiki

f_var_viewDistance_default = 1600;
f_var_viewDistance_tank = 2500;
f_var_viewDistance_car = 2000;
f_var_viewDistance_rotaryWing = 3000;
f_var_viewDistance_fixedWing = 5000;
f_var_viewDistance_crewOnly = true;
[] execVM "f\dynamicViewDistance\f_setViewDistanceInit.sqf";

// ====================================================================================

// F3 - Authorised Crew Check
// Credits and documentation: https://github.com/folkarps/F3/wiki

// VehicleName addEventhandler ["GetIn", {[_this,[UnitName1,UnitName2],false] call f_fnc_authorisedCrewCheck}];
// VehicleName addEventhandler ["GetIn", {[_this,["UnitClass1","UnitClass2"],false] call f_fnc_authorisedCrewCheck}];

// ====================================================================================

// F3 - MapClick Teleport
// Credits and documentation: https://github.com/folkarps/F3/wiki

// f_var_mapClickTeleport_Uses = 1;                 // How often the teleport action can be used. 0 = infinite usage.
// f_var_mapClickTeleport_TimeLimit = 0;            // If higher than 0 the action will be removed after the given time.
// f_var_mapClickTeleport_GroupTeleport = true;     // False: everyone can teleport. True: Only group leaders can teleport and will move their entire group.
// f_var_mapClickTeleport_Units = [];               // Restrict map click teleport to these units.
// f_var_mapClickTeleport_Height = 0;               // If > 0 map click teleport will act as a HALO drop and automatically assign parachutes to units.
// f_var_mapClickTeleport_SaferVehicleHALO = false; // If HALO-ing (f_var_mapClickTeleport_Height > 0), False: crew remain in vehicle during drop. True: crew drop separately with their own parachutes.
// [] execVM "f\mapClickTeleport\f_mapClickTeleport.sqf";

// ====================================================================================

// F3 - Name Tags
// Credits and documentation: https://github.com/folkarps/F3/wiki

[] execVM "f\nametag\f_nametagInit.sqf";

// ====================================================================================

// F3 - Group E&E Check
// Credits and documentation: https://github.com/folkarps/F3/wiki

// [side,ObjectName or "MarkerName",100,1] execVM "f\EandEcheck\f_EandECheckLoop.sqf";
// [["Grp1","Grp2"],ObjectName or "MarkerName",100,1] execVM "f\EandEcheck\f_EandECheckLoop.sqf";
// Note: If the 3rd parameter is <= 0 then the 2nd parameter will be used for inArea:
// [side,inArea argument,0,1] execVM "f\EandEcheck\f_EandECheckLoop.sqf";

// ====================================================================================

// F3 - Casualties Cap
// Credits and documentation: https://github.com/folkarps/F3/wiki

// [[GroupName or SIDE],100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";
// [[GroupName or SIDE],100,{code}] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// BLUFOR > NATO
// [BLUFOR,100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// OPFOR > CSAT
// [OPFOR,100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// INDEPENDENT > AAF
// [INDEPENDENT,100,1] execVM "f\casualtiesCap\f_CasualtiesCapCheck.sqf";

// ====================================================================================

// F3 - Disable Thermals
// Credits and documentation: https://github.com/folkarps/F3/wiki
[] spawn f_fnc_disableThermals;
// [[UnitName1, "UnitClass1"]] spawn f_fnc_disableThermals;

// ====================================================================================
