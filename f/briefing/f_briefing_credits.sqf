// F3 - Briefing
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// NOTES: CREDITS
// The code below creates the Credits sub-section of notes.

// Note: 
// If you (missionmaker) do not want to use the editor author name, you can
// simply replace %1 here with your name or change "_str_made_by" entirely.
private _str_made_by = "Created by %1.";

private _text = format["<font size='18'>%1</font><br/><br/>", briefingName];
_text = _text + format[_str_made_by, getMissionConfigValue ["Author", ""]];
_text = _text + format["<br/><br/>Made with FA3 version %1", getMissionConfigValue ["fa3_version", [0,0,0]] joinString "."];

player createDiaryRecord ["diary", ["Credits", _text]];
