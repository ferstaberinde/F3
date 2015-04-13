// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
// params
_this spawn {
_unit = [_this, 0, player,[objNull]] call BIS_fnc_param;
_oldUnit = [_this, 1, objNull,[objNull]] call BIS_fnc_param;
_forced = [_this, 4, false,[false]] call BIS_fnc_param;
if(isNil "f_cam_isJIP") then { f_cam_isJIP = false; };
// if they are jip, these are null
if(isNull _unit ) then {_unit = cameraOn;f_cam_isJIP=true;};
// escape the script if you are not a seagull unless forced
if (typeof _unit != "seagull" && !_forced || !hasInterface) ExitWith {};
// disable this to instantly switch to the spectator script.
waituntil {missionnamespace getvariable ["BIS_fnc_feedback_allowDeathScreen",true] || isNull (_oldUnit) || f_cam_isJIP || _forced };


// ====================================================================================

if(!isnil "BIS_fnc_feedback_allowPP") then
{
  // disable effects death effects
  BIS_fnc_feedback_allowPP = false;
};

if(f_cam_isJIP) then
{
  ["F_ScreenSetup",false] call BIS_fnc_blackOut;
  systemChat "Initilizing Spectator Script";
  uiSleep 3;
  ["F_ScreenSetup"] call BIS_fnc_blackIn;
};

// Create a Virtual Agent to act as our player to make sure we get to keep Draw3D
if(isNil "f_cam_VirtualCreated") then
{
  createCenter sideLogic;
  _newGrp = createGroup sideLogic;
  _newUnit = _newGrp createUnit ["VirtualCurator_F", [0,0,5], [], 0, "FORM"];
  _newUnit allowDamage false;
  _newUnit hideObjectGlobal true;
  _newUnit enableSimulationGlobal false;
  _newUnit setpos [0,0,5];
  selectPlayer _newUnit;
  waituntil{player == _newUnit};
  deleteVehicle _unit;
  f_cam_VirtualCreated = true;
};

if(isNull _oldUnit ) then {if(count playableUnits > 0) then {_oldUnit = (playableUnits select 0)} else {_oldUnit = (allUnits select 0)};};

// ====================================================================================

// Set spectator mode for whichever radio system is in use
switch (f_var_radios) do {
  // ACRE
  case 1: {
    [true] call acre_api_fnc_setSpectator;
  };
  // TFR
  case 2: {
    [player, true] call TFAR_fnc_forceSpectator;
  };
  case 3: {
    [true] call acre_api_fnc_setSpectator;
  };

};
// ====================================================================================

_listBox = 2100;
lbClear _listBox;
// set inital values.
#include "macros.hpp"
f_cam_controls = [F_CAM_HELPFRAME,F_CAM_HELPBACK,F_CAM_MOUSEHANDLER,F_CAM_UNITLIST,F_CAM_MODESCOMBO,F_CAM_SPECTEXT,F_CAM_SPECHELP,F_CAM_HELPCANCEL,F_CAM_HELPCANCEL,F_CAM_MINIMAP,F_CAM_FULLMAP,F_CAM_BUTTIONFILTER,F_CAM_BUTTIONTAGS,F_CAM_BUTTIONTAGSNAME,F_CAM_BUTTIONFIRSTPERSON,F_CAM_DIVIDER];
f_cam_units = [];
f_cam_players = [];
f_cam_startX = 0;
f_cam_startY = 0;
f_cam_detlaX = 0;
f_cam_detlaY = 0;
f_cam_zoom = 0;
f_cam_hideUI = false;
f_cam_map_zoom = 0.5;
f_cam_mode = 0;
f_cam_toggleCamera = false;
f_cam_playersOnly = false;
f_cam_toggleTags = true;
f_cam_ads = false;
f_cam_nvOn = false;
f_cam_tiBHOn = false;
f_cam_tiWHOn = false;
f_cam_tagsEvent = -1;
f_cam_mShift = false;
f_cam_freecamOn = false;
f_cam_toggleTagsName = true;
f_cam_mapMode = 0;
f_cam_MouseButton = [false,false];
f_cam_mouseCord = [0.5,0.5];
f_cam_mouseDeltaX = 0.5;
f_cam_mouseDeltaY = 0.5;
f_cam_mouseLastX = 0.5;
f_cam_mouseLastY = 0.5;
f_cam_angleYcached  = 0;
f_cam_angleX = 0;
f_cam_tracerOn = false;
f_cam_angleY = 60;
f_cam_ctrl_down = false;
f_cam_shift_down = false;
f_cam_freecam_buttons = [false,false,false,false,false,false];
f_cam_forcedExit = false;
f_freecam_x_speed = 0;
f_freecam_y_speed = 0;
f_freecam_z_speed = 0;


f_cam_timestamp = time;
f_cam_muteSpectators = true;

// ====================================================================================
// Menu (Top left)
f_cam_menuControls = [2111,2112,2113,2114,2101,4302];
f_cam_menuShownTime = 0;
f_cam_menuShown = true;
f_cam_menuWorking = false;
f_cam_sideButton = 0; // 0 = ALL, 1 = BLUFOR , 2 = OPFOR, 3 = INDFOR , 4 = Civ
f_cam_sideNames = ["All Sides","Blufor","Opfor","Indfor","Civ"];
// ====================================================================================
// Colors

f_cam_blufor_color = [BLUFOR] call bis_fnc_sideColor;
f_cam_opfor_color = [OPFOR] call bis_fnc_sideColor;
f_cam_indep_color = [independent] call bis_fnc_sideColor;
f_cam_civ_color = [civilian] call bis_fnc_sideColor;
f_cam_empty_color = [sideUnknown] call bis_fnc_sideColor;

// ================================
// Camera
f_cam_angle = 360;
f_cam_zoom = 3;
f_cam_height = 3;
f_cam_fovZoom = 1.2;
f_cam_scrollHeight = 0;
f_cam_cameraMode = 0; // set camera mode (default)
// ====================================================================================

f_cam_listUnits = [];

f_cam_ToggleFPCamera = {
    f_cam_toggleCamera = !f_cam_toggleCamera;
    if(f_cam_toggleCamera) then
    {
        f_cam_mode = 1; //(view)
        f_cam_camera cameraEffect ["terminate", "BACK"];
        f_cam_curTarget switchCamera "internal";
    }
    else
    {
        f_cam_mode = 0;
        f_cam_camera cameraEffect ["internal", "BACK"];
    };
    call F_fnc_ReloadModes;
};
f_cam_GetCurrentCam = {
  _camera = f_cam_camera;
  switch(f_cam_mode) do
  {
    case 0:
    {
        _camera = f_cam_camera; // Standard
    };
    case 1:
    {
      _camera = cameraOn; // FP
    };
    case 3:
    {
      _camera = f_cam_freecamera; // freecam
    };
  };
  _camera
};


// =============================================================================

// create the UI
createDialog "f_spec_dialog";
// add keyboard events
// hide minimap
((findDisplay 9228) displayCtrl 1350) ctrlShow false;
((findDisplay 9228) displayCtrl 1350) mapCenterOnCamera false;

// hide big map
((findDisplay 9228) displayCtrl 1360) ctrlShow false;
((findDisplay 9228) displayCtrl 1360) mapCenterOnCamera false;

f_cam_helptext = "<t color='#EAA724'><br />Hold right-click to pan the camera<br />Use the scroll wheel or numpad+/- to zoom in and out.<br />Use ctrl + rightclick to fov zoom<br /><br />Press H to show and close the help window.<br />Press M to toggle between no map,minimap and full size map.<br />T for switching on tracers on the map<br/>Space to switch to freecam <br/>Press H to close this window</t>";
((findDisplay 9228) displayCtrl 1310) ctrlSetStructuredText parseText (f_cam_helptext);
// create the camera and set it up.
f_cam_camera = "camera" camCreate [position _oldUnit select 0,position _oldUnit select 1,3];

f_cam_fakecamera = "camera" camCreate [position _oldUnit select 0,position _oldUnit select 1,3];

f_cam_curTarget = _oldUnit;
f_cam_freecamera = "camera" camCreate [position _oldUnit select 0,position _oldUnit select 1,3];
f_cam_camera camCommit 0;
f_cam_fakecamera camCommit 0;
f_cam_camera cameraEffect ["internal","back"];
f_cam_camera camSetTarget f_cam_fakecamera;
f_cam_camera camSetFov 1.2;
f_cam_freecamera camSetFov 1.2;
f_cam_zeusKey = 21;
if( count (actionKeys "curatorInterface") > 0 ) then
{
    f_cam_zeusKey = (actionKeys "curatorInterface") select 0;
};
f_cam_MouseMoving = false;
cameraEffectEnableHUD true;
showCinemaBorder false;
f_cam_fired = [];
{
  _event = _x addEventHandler ["fired",{f_cam_fired = f_cam_fired - [objNull];f_cam_fired pushBack (_this select 6)}];
  _x setVariable ["f_cam_fired_eventid",_event];

} foreach (allunits + vehicles);
// ====================================================================================
// spawn sub scripts
call f_fnc_ReloadModes;
lbSetCurSel [2101,0];
//f_cam_freeCam_script = [] spawn F_fnc_FreeCam;
f_cam_updatevalues_script = [] spawn F_fnc_UpdateValues;
 ["f_spect_tags", "onEachFrame", {_this call F_fnc_DrawTags}] call BIS_fnc_addStackedEventHandler;
 ["f_spect_cams", "onEachFrame", {_this call F_fnc_FreeCam}] call BIS_fnc_addStackedEventHandler;
};