// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
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

// ====================================================================================

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

player createDiaryRecord ["diary", ["Admin",_briefing]];

// ====================================================================================