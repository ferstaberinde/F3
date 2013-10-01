// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
disableSerialization;
// this just makes the dialog
while {true} do
{
    waitUntil {sleep 0.3;!dialog && f_cam_cameraMode != 1};
    sleep 0.5;
    waitUntil {sleep 0.3;!dialog};
    // restart the dialog and reset the eventhandlers
    createDialog "f_spec_dialog";
    _displayDialog = (findDisplay 9228);
    _displayDialog displaySetEventHandler["KeyDown", "[""KeyDown"",_this] call f_cam_eventHandler"];
	_displayDialog displaySetEventHandler["KeyUp", "[""KeyUp"",_this] call f_cam_eventHandler"];
	call f_cam_reloadModesBox;
};