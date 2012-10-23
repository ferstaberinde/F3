// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

if (!(isNull player) || (!isServer && isNull player)) then
{
	while {isNull player} do {sleep 1;};

	keyPressCounter = 0;
	keysToHandle = [];
	keyFunctions = [];

	[20, 0.75, 0.5] execVM "f\common\f_recog\setupRecognize.sqf";
	
	sleep 0.1;
	
	b_removeKeys = compile preprocessFileLineNumbers "f\common\f_recog\bRemoveKey.sqf";
	b_keyHandler = compile preprocessFileLineNumbers "f\common\f_recog\bKeyHandler.sqf";
	(findDisplay 46) displaySetEventHandler ["KeyUp", "_this call b_removeKeys"];
	(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call b_keyHandler"];
};