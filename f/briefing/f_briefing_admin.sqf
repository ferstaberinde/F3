// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// ADD MISSION MAKER NOTES SECTIONS
// All text added below will only be visible to the current admin

_customText = "";

// ====================================================================================

// ADMIN BRIEFING
// This is a generic section displayed only to the ADMIN

_briefing ="
<br/>
<font size='18'>ADMIN SECTION</font><br/>
This briefing section can only be seen by the current admin.
<br/><br/>
";

// ====================================================================================

// MISSION-MAKER NOTES
// This section displays notes made by the mission-maker for the ADMIN

if (_customText != "") then {
	_briefing = _briefing + "<br/><font size='18'>MISSION-MAKER NOTES</font><br/>";
	_briefing = _briefing + _customText + "<br/><br/>";
};

// ====================================================================================

// ENDINGS
// This block of code collects all valid endings and formats them properly

_title = [];
_ending = [];
_endings = [];

_i = 1;
while {true} do {
	_title = getText (missionconfigfile >> "CfgDebriefing" >> format ["end%1",_i] >> "title");
	_description = getText (missionconfigfile >> "CfgDebriefing" >> format ["end%1",_i] >> "description");
	if (_title == "") exitWith {};
	_ending = [_i,_title,_description];
	_endings append ([_ending]);
	_i = _i + 1;
};

// Create the briefing section to display the endings

_briefing = _briefing + "
<font size='18'>ENDINGS</font><br/>
These endings are available. To trigger an ending click on its link.<br/><br/>
";

{
	_end = _this select 0;
	_briefing = _briefing + format [
	"<execute expression=""[[%1],'f_fnc_mpEnd',false] spawn BIS_fnc_MP;"">'end%1'</execute> - %2:<br/>
	%3<br/><br/>"
	,_x select 0,_x select 1,_x select 2];
} forEach _endings;

// ====================================================================================

// SAFE START SECTION

_briefing = _briefing + "
<font size='18'>SAFE START CONTROL</font><br/>
|- <execute expression=""f_param_mission_timer = f_param_mission_timer + 1; publicVariable 'f_param_mission_timer'; hintsilent format ['Mission Timer: %1',f_param_mission_timer];"">
Increase Safe Start timer by 1 minute</execute><br/>

|- <execute expression=""f_param_mission_timer = f_param_mission_timer - 1; publicVariable 'f_param_mission_timer'; hintsilent format ['Mission Timer: %1',f_param_mission_timer];"">
Decrease Safe Start timer by 1 minute</execute><br/>

|- <execute expression=""[[[],'f\safeStart\f_safeStart.sqf'],'BIS_fnc_execVM',true]  call BIS_fnc_MP;
hintsilent 'Safe Start started!';"">
Begin Safe Start timer</execute><br/>

|- <execute expression=""f_param_mission_timer = -1; publicVariable 'f_param_mission_timer';
[['SafeStartMissionStarting',['Mission starting now!']],'bis_fnc_showNotification',true] call BIS_fnc_MP;
[[false],'f_fnc_safety',playableUnits + switchableUnits] call BIS_fnc_MP;
hintsilent 'Safe Start ended!';"">
End Safe Start timer</execute><br/>

|- <execute expression=""[[true],'f_fnc_safety',playableUnits + switchableUnits] call BIS_fnc_MP;
hintsilent 'Safety on!' "">
Force safety on for all players</execute><br/>

|- <execute expression=""[[false],'f_fnc_safety',playableUnits + switchableUnits] call BIS_fnc_MP;
hintsilent 'Safety off!' "">
Force safety off for all players</execute><br/><br/>
";

// ====================================================================================

// ADD ZEUS SUPPORT SECTION

_briefing = _briefing + "
<font size='18'>ZEUS SUPPORT</font><br/>
<execute expression=""
if !(isNull (getAssignedCuratorLogic player)) then {hintsilent 'ZEUS already assigned!'} else {
	[[player,true],'f_fnc_zeusInit',false] spawn BIS_fnc_MP; hintsilent 'Curator assigned.';
};"">Assign ZEUS to host</execute>.<br/>

|- <execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintsilent 'Assign ZEUS first!'} else {[[player,playableUnits],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; hintsilent 'Added playable units.'};"">Add players and playable units to ZEUS object list</execute>.<br/>

|- <execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintsilent 'Assign ZEUS first!'} else {
	[[player,true,true],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; hintsilent 'Assigned control over all group leaders and empty vehicles.'};"">
Add all group leaders and empty vehicles</execute>.<br/>

|- <execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintsilent 'Assign ZEUS first!'} else {[[player,true],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; hintsilent 'Add all units.'};"">Add all mission objects</execute> <font color='#FF0000'>(POSSIBLE DESYNC)</font>.<br/>

|- <execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintsilent 'Assign ZEUS first!'} else {(getAssignedCuratorLogic player) removeCuratorEditableObjects [allDead,true]; hintsilent 'Removed dead units.'};"">Remove all dead units from ZEUS</execute>.<br/>

|- <execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintsilent 'Assign ZEUS first!'} else {[[player,false],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; [[player,false],'f_fnc_zeusAddAddons',false] spawn BIS_fnc_MP; hintsilent 'Removed powers and units.'};"">Remove all powers and objects from ZEUS</execute>.<br/>
<br/>
";

// ====================================================================================

// CREATE DIARY ENTRY

player createDiaryRecord ["diary", ["F3 Admin Menu",_briefing]];

// ====================================================================================