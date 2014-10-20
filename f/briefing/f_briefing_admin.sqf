// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// ADD CUSTOM SECTIONS
// Add all messages you want only the admin to be able to see here:

_customText = "";

// ====================================================================================

// ADMIN BRIEFING
// This is a generic section displayed only to the ADMIN

_briefing ="
<br/>
ADMIN SECTION<br/>
This briefing section can only be seen by the current admin.
<br/><br/>
";

// ====================================================================================

// MISSION-MAKER NOTES
// This section displays notes made by the mission-maker for the ADMIN

_briefing ="
<br/>
MISSION-MAKER NOTES<br/>
Notes and messages made by the mission-maker.
";

_briefing = _briefing + _customText;
_briefing = _briefing + "<br/><br/>";

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
	_endings set [count _endings,_ending];
	_i = _i + 1;
};

// Create the briefing section to display the endings

_briefing = _briefing + "
ENDINGS<br/>
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

// ADD ZEUS SUPPORT SECTION

_briefing = _briefing + format["
ZEUS SUPPORT<br/>
<execute expression=""
if !(isNil 'f_curator_%1') then {hintsilent 'ZEUS already assigned!'} else {[[player],'f_fnc_zeusInit',false] spawn BIS_fnc_MP;hintsilent 'Curator module created as f_curator_%1'};"">Assign ZEUS to host</execute>.<br/>
|- <execute expression=""
if (isNil 'f_curator_%1') then {hintsilent 'Assign ZEUS first!'} else {[[f_curator_%1,true],'f_fnc_zeusAddAddons',false] spawn BIS_fnc_MP; hintsilent 'Given all powers to f_curator_%1'};"">Give ZEUS access to all powers</execute>.<br/>
|- <execute expression=""
if (isNil 'f_curator_%1') then {hintsilent 'Assign ZEUS first!'} else {[[f_curator_%1,playableUnits],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; hintsilent 'Added playable units to f_curator_%1'};"">Add players and playable units to ZEUS object list</execute>.<br/>
|- <execute expression=""
if (isNil 'f_curator_%1') then {hintsilent 'Assign ZEUS first!'} else {[[f_curator_%1,true],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; hintsilent 'Given control over all units to f_curator_%1'};"">Give ZEUS control over all objects</execute>.<br/>
(CAUTION: CAN CAUSE SIGNIFICANT DESYNC/LAG)<br/>
|- <execute expression=""
if (isNil 'f_curator_%1') then {hintsilent 'Assign ZEUS first!'} else {[[f_curator_%1,false],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; [[f_curator_%1,false],'f_fnc_zeusAddAddons',false] spawn BIS_fnc_MP; hintsilent 'Removed powers and units from f_curator_%1'};"">Remove all powers and objects from ZEUS</execute>.<br/>
<br/>
",name player];

// ====================================================================================

// CREATE DIARY ENTRY

player createDiaryRecord ["diary", ["Admin",_briefing]];

// ====================================================================================