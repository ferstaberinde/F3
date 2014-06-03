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
	_displayDialog displaySetEventHandler["KeyDown", "[""KeyDown"",_this] call F_fnc_EventHandler"];
	_displayDialog displaySetEventHandler["KeyUp", "[""KeyUp"",_this] call F_fnc_EventHandler"];
	["f_spect_tags", "onEachFrame", {_this call F_fnc_DrawTags}] call BIS_fnc_addStackedEventHandler;
	_mouseDialog = _displayDialog displayCtrl 123;
	f_cam_onMouseMoving = _mouseDialog ctrlAddEventHandler ["MouseMoving", "['MouseMoving',_this] call F_fnc_EventHandler"];
	call f_fnc_ReloadModes;
	ctrlShow [2100,false];
	_helpWindow = _displayDialog displayCtrl 1310;
	_mapWindow = _displayDialog displayCtrl 1350;
	_fullmapWindow = _displayDialog displayCtrl 1360;
	_mapWindow ctrlShow false;
	_fullmapWindow ctrlShow false;
	_fullmapWindow mapCenterOnCamera false;
	_mapWindow mapCenterOnCamera false;
	_helpWindow ctrlSetStructuredText parseText ("<br />Hold right-click to pan the camera<br /><br />Use the scroll wheel or numpad+/- to zoom in and out.<br />Use ctrl + rightclick to fov zoom<br /><br />Press H to show and close the help window.<br /><br />Press M to toggle between no map,minimap and full size map.<br /> ");
	// hide it to stop from being spammed open.
	ctrlShow [1315, !ctrlVisible 1315];
	ctrlShow [1310, !ctrlVisible 1310];
	ctrlShow [1300, !ctrlVisible 1300];
	ctrlShow [1305, !ctrlVisible 1305];
};
