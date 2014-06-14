// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

_unit = cameraOn;
_oldUnit = playableUnits select 0;
_forced = true;

if (!isNull player) then {
_unit = _this select 0;
_oldUnit = _this select 1;
_forced = false;

	if(count _this >= 5) then
	{
		_forced = _this select 4;
	};

};

// escape the script if you are not a seagull
if (typeof _unit != "seagull" && !_forced) ExitWith {};

// disable this to instantly switch to the spectator script.
if (!_forced) then {
	waituntil {missionnamespace getvariable ["BIS_fnc_feedback_allowDeathScreen",true]};
};

if(!isnil "BIS_fnc_feedback_allowPP") then
{
	// disable effects death effects
	BIS_fnc_feedback_allowPP = false;
};

// Set spectator mode for whichever radio system is in use
switch (f_var_radios) do {

  // No radio system, do nothing
  case 0: {

  };

  // ACRE
  case 1: {
    [true] call acre_api_fnc_setSpectator;
  };

  // TFR
  case 2: {
    [_unit, true] call TFAR_fnc_forceSpectator;
  };

};

// ====================================================================================

// Create a Virtual Agent to act as our player to make sure we get to keep Draw3D and numbers stuff

_newUnit =  createAgent  ["VirtualMan_F", [0,0,0], [], 0, "FORM"];
_newUnit hideObjectGlobal true;
_newUnit enableSimulationGlobal false;

selectPlayer _newUnit;
deleteVehicle _unit;

// create the camera and set it up.
f_cam_camera = "camera" camCreate [position _oldUnit select 0,position _oldUnit select 1,3];
f_cam_camera cameraEffect ["internal", "BACK"];
f_cam_fakecamera = "camera" camCreate [position _oldUnit select 0,position _oldUnit select 1,3];
f_cam_camera camSetTarget f_cam_fakecamera;
f_cam_curTarget = _oldUnit;

cameraEffectEnableHUD true;
f_cam_camera camCommit 0;
showCinemaBorder false;
f_cam_MouseMoving = false;
// ====================================================================================
_listBox = 2100;
lbClear _listBox;

// compile functions
/*
F_fnc_EventHandler = compile preprocessFileLineNumbers "f\spect\fn_eventHandler.sqf";
F_fnc_GetPlayers = compile preprocessFileLineNumbers "f\spect\fn_getPlayers.sqf";
f_cam_freeCam = compile preprocessFileLineNumbers "f\spect\fn_freeCam.sqf";
f_cam_dialogLoop = compile preprocessFileLineNumbers "f\spect\fn_dialogLoop.sqf";
f_cam_updateValues = compile preprocessFileLineNumbers "f\spect\fn_updateValues.sqf";
f_cam_drawTags = compile preprocessFileLineNumbers "f\spect\fn_drawTags.sqf";
F_fnc_GetIcon = compile preprocessFileLineNumbers "f\spect\fn_getIcon.sqf";*/

// function to refresh the modes box.
//F_fnc_ReloadModes = compile preprocessFileLineNumbers "f\spect\fn_ReloadModes.sqf";

// ====================================================================================
// set inital values.

f_cam_units = allunits;
f_cam_players = call F_fnc_GetPlayers;
f_cam_startX = 0;
f_cam_startY = 0;
f_cam_detlaX = 0;
f_cam_detlaY = 0;
f_cam_zoom = 0;
f_cam_hideUI = 0;
f_cam_map_zoom = 0.5;
f_cam_mode = 0;
f_cam_toggleCamera = false;
f_cam_playersOnly = false;
f_cam_toggleTags = false;
f_cam_ads = false;
f_cam_nvOn = false;
f_cam_tiBHOn = false;
f_cam_tiWHOn = false;
f_cam_tagsEvent = -1;
f_cam_mShift = false;
f_cam_toggleTagsName = false;
f_cam_mapMode = 0;
f_cam_MouseButton = [false,false];
f_cam_mouseCord = [0.5,0.5];
f_cam_mouseDeltaX = 0.5;
f_cam_mouseDeltaY = 0.5;
f_cam_mouseLastX = 0.5;
f_cam_mouseLastY = 0.5;
f_cam_angleX = 0;
f_cam_angleY = 60;
f_cam_ctrl_down = false;
f_cam_shift_down = false;

// ====================================================================================

f_cam_listUnits = [];
// marker for current target
f_spect_locMarker = createMarkerLocal ["f_spect_locMarker",getpos f_cam_curTarget];
f_spect_locMarker setMarkerShapeLocal "ICON";
f_spect_locMarker setMarkerTypeLocal "MIL_TRIANGLE";
f_spect_locMarker setMarkerColorLocal "ColorYellow";
f_spect_locMarker setMarkerSizeLocal [0.45, 0.45];
f_spect_locMarker setMarkerDirLocal (direction f_cam_curTarget);

// set camera mode (default)
f_cam_cameraMode = 0;

// ====================================================================================

disableSerialization;
// create the UI
createDialog "f_spec_dialog";
// add keyboard events
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
// ====================================================================================
// spawn sub scripts
[] spawn F_fnc_FreeCam;
[] spawn F_fnc_DialogLoop;
[] spawn F_fnc_UpdateValues;
