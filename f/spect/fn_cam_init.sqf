// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================


_unit = _this select 0;
_killer = _this select 1;
if(isnil "_killer") then
{
	_killer = _this select 0;
};

// enable this to show the death animation.
//waituntil {missionnamespace getvariable ["BIS_fnc_feedback_allowDeathScreen",true]};
if(!isnil "BIS_fnc_feedback_allowPP") then
{
	// disable effects
	BIS_fnc_feedback_allowPP = false;
};
// if acre is enabled set player to acre channel
if(f_var_acre == 1) then
{
	[true] call acre_api_fnc_setSpectator;
};
// ====================================================================================

// teleport seagull away because its ugly
_unit setPos [0,0,0];
// create the camera and set it up.
f_cam_camera = "camera" camCreate [position _killer select 0,position _killer select 1,3];
f_cam_camera cameraEffect ["INTERNAL", "BACK"];
f_cam_camera camSetTarget _killer;
f_cam_curTarget = _killer;
cameraEffectEnableHUD true;
f_cam_camera camCommit 0;
showCinemaBorder false;
f_cam_MouseMoving = false;
// ====================================================================================

// compile functions

f_cam_eventHandler = compile preprocessFileLineNumbers "f\spect\f_cam_eventHandler.sqf";
f_cam_getPlayers = compile preprocessFileLineNumbers "f\spect\f_cam_getPlayers.sqf";
f_cam_freeCam = compile preprocessFileLineNumbers "f\spect\f_cam_freeCam.sqf";
f_cam_dialogLoop = compile preprocessFileLineNumbers "f\spect\f_cam_dialogLoop.sqf";
f_cam_updateValues = compile preprocessFileLineNumbers "f\spect\f_cam_updateValues.sqf";
f_cam_drawTags = compile preprocessFileLineNumbers "f\spect\f_cam_drawTags.sqf";
f_cam_getIcon = compile preprocessFileLineNumbers "f\spect\f_cam_getIcon.sqf";
// function to refresh the modes box.
f_cam_reloadModesBox = {
	_listBox = 2101;
	_curIndex = lbCurSel _listBox;
	lbClear _listBox;
	if(f_cam_playersOnly) then
	{
		f_cam_lb_toggleplayersIndex = lbAdd [_listBox,"[Filter AI]"];
	}
	else
	{
		f_cam_lb_toggleplayersIndex = lbAdd [_listBox,"Filter AI"];
	};
	if(f_cam_toggleCamera) then
	{
		f_cam_lb_togglecameraIndex = lbAdd[_listBox,"Third Person"];
	}
	else
	{
		f_cam_lb_togglecameraIndex = lbAdd[_listBox,"First Person"];
	};
	if(f_cam_toggleTags) then
	{
		f_cam_lb_toggleTagsIndex = lbAdd[_listBox,"Disable Tags"];
	}
	else
	{
		f_cam_lb_toggleTagsIndex = lbAdd[_listBox,"Enable Tags"];
	};
	// NV
	if(f_cam_nvOn) then
	{
		f_cam_lb_toggletiNVIndex = lbAdd[_listBox,"[Toggle NV]"];

	}
	else
	{
		f_cam_lb_toggletiNVIndex = lbAdd[_listBox,"Toggle NV"];
	};
	// blackhot
	if(f_cam_tiBHOn) then
	{
		f_cam_lb_toggletiBHIndex = lbAdd[_listBox,"[Toggle Blackhot]"];

	}
	else
	{
		f_cam_lb_toggletiBHIndex = lbAdd[_listBox,"Toggle Blackhot"];
	};

	// whtiehot
	if(f_cam_tiWHOn) then
	{
		f_cam_lb_toggletiWHIndex = lbAdd[_listBox,"[Toggle Whitehot]"];

	}
	else
	{
		f_cam_lb_toggletiWHIndex = lbAdd[_listBox,"Toggle Whitehot"];
	};

};

// ====================================================================================
// set inital values.

f_cam_units = allunits;
f_cam_players = call f_cam_getPlayers;
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

// ====================================================================================

// set camera mode (default)
f_cam_cameraMode = 0;

// ====================================================================================

disableSerialization;
// create the UI
createDialog "f_spec_dialog";
// add keyboard events
_displayDialog = (findDisplay 9228);
_displayDialog displaySetEventHandler["KeyDown", "[""KeyDown"",_this] call f_cam_eventHandler"];
_displayDialog displaySetEventHandler["KeyUp", "[""KeyUp"",_this] call f_cam_eventHandler"];
call f_cam_reloadModesBox;
ctrlShow [2100,false];
_helpWindow = _displayDialog displayCtrl 1310;
_mapWindow = _displayDialog displayCtrl 1350;
_mapWindow mapCenterOnCamera false;
_helpWindow ctrlSetStructuredText parseText ("<br />Hold right-click (or shift-right-click) and drag to the edges of the screen to pan the camera, or use the arrow keys to control the camera.<br /><br />Use the scroll wheel or numpad+/- to zoom in and out.<br /><br />Press H to show and close the help window.<br /><br />Press M for the map.<br /> ");
// ====================================================================================
// spawn sub scripts
[] spawn f_cam_freeCam;
[] spawn f_cam_dialogLoop;
[] spawn f_cam_updateValues;
