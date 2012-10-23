// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

_msg = "";

/*
// if crosshair is loaded, then switch thtough the options: "only tags,
// only crosshair, both, none"
if !( isNil "crosshairEnabled" ) then {
	_done = false;
	if (!_done && !recogIsDisplayed && !crosshairEnabled) then {
		recogIsDisplayed = true;
		crosshairEnabled = false;
		_msg = "Tags enabled.";
		_done = true;
	};
	if (!_done && recogIsDisplayed && !crosshairEnabled) then {
		recogIsDisplayed = false;
		crosshairEnabled = true;
		_msg = "Crosshair enabled.";
		_done = true;
	};
	if (!_done && !recogIsDisplayed && crosshairEnabled) then {
		crosshairEnabled = true;
		recogIsDisplayed = true;
		_msg = "Crosshair and tags enabled.";
		_done = true;
	};
	if (!_done && recogIsDisplayed && crosshairEnabled) then {
		crosshairEnabled = false;
		recogIsDisplayed = false;
		_msg = "Crosshair and tags disabled.";
		_done = true;
	};
}
else {
	recogIsDisplayed = !recogIsDisplayed;
	if (recogIsDisplayed) then {
		_msg = "Tags enabled.";
	}
	else {
		_msg = "Tags disabled.";
	};
};
*/

recogIsDisplayed = !recogIsDisplayed;
if (recogIsDisplayed) then {
	_msg = "Tags enabled.";
}
else {
	_msg = "Tags disabled.";
};

hintsilent _msg;
