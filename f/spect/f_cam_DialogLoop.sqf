// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
disableSerialization;
// this just makes the dialog
while {true} do
{
    waitUntil {
    sleep 0.3;
	_displayDialog = (findDisplay 9228);
	_mapWindow = _displayDialog displayCtrl 1350;
	ctrlMapAnimClear _mapWindow;
	_mapWindow ctrlMapAnimAdd [0.3, f_cam_map_zoom,visiblePosition (camTarget f_cam_camera)];
	ctrlMapAnimCommit _mapWindow;
    !dialog && f_cam_cameraMode != 1
	};
    sleep 0.5;
    waitUntil {sleep 0.3;!dialog};
    // restart the dialog and reset the eventhandlers
    createDialog "f_spec_dialog";
    _displayDialog = (findDisplay 9228);
    _displayDialog displaySetEventHandler["KeyDown", "[""KeyDown"",_this] call f_cam_eventHandler"];
	_displayDialog displaySetEventHandler["KeyUp", "[""KeyUp"",_this] call f_cam_eventHandler"];
	call f_cam_reloadModesBox;
	ctrlShow [2100,false];
	_helpWindow = _displayDialog displayCtrl 1310;
	_helpWindow ctrlSetStructuredText parseText ("<br />Hold right-click (or shift-right-click) and drag to the edges of the screen to pan the camera, or use the arrow keys to control the camera.<br /><br />Use the scroll wheel or numpad+/- to zoom in and out.<br /><br />Press H to show and close the help window.<br /><br />Press M for the map.<br /> ");
	// hide it to stop from being spammed open.
	ctrlShow [1315, !ctrlVisible 1315];
	ctrlShow [1310, !ctrlVisible 1310];
	ctrlShow [1300, !ctrlVisible 1300];
	ctrlShow [1305, !ctrlVisible 1305];
};
