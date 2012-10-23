// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

sleep 0.1;

recognizeDistance = _this select 0;
recognizeTolerance = _this select 1;
recognizeScale = _this select 2;
recogIsDisplayed = false;
recogKey = actionKeys "TeamSwitch";

// register for every key the function to be called
{
	keysToHandle set [count keysToHandle, [_x]];
	keyFunctions set [count keyFunctions, "recognizeHandler"];
} foreach recogKey;

recognize = compile preprocessFileLineNumbers "f\common\f_recog\recognize.sqf";
recognizeHandler = compile preprocessFileLineNumbers "f\common\f_recog\recognizeHandler.sqf";
recognizeOverlayCtrl = compile preprocessFileLineNumbers "f\common\f_recog\recognizeOverlayCtrl.sqf";
generateLabelText = compile preprocessFileLineNumbers "f\common\f_recog\generateLabelText.sqf";

0 cutRsc ["recogOverlayRsc", "PLAIN"];

// allows to see where the 0..1 screen positions are (because stupidly,
// they change when changing the menu size, wtf?)
// cutRsc ["ScreenMeter", "PLAIN"];
