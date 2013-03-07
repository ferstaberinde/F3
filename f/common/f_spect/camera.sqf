//--- Classic camera script, enhanced by Karel Moricky, 2010/03/19

if (!isNil "BIS_DEBUG_CAM") exitwith {};

//--- Is FLIR available
if (isnil "BIS_DEBUG_CAM_ISFLIR") then {
	BIS_DEBUG_CAM_ISFLIR = isclass (configfile >> "cfgpatches" >> "ca_E");
};

if (not BIS_DEBUG_CAM_ISFLIR) then {
	BIS_DEBUG_CAM_ISFLIR = isclass (configfile >> "cfgpatches" >> "ca_F");
};

BIS_DEBUG_CAM_MAP = false;
BIS_DEBUG_CAM_VISION = 0;
BIS_DEBUG_CAM_FOCUS = 0;
BIS_DEBUG_CAM_COLOR = ppEffectCreate ["colorCorrections", 1600];
if (isnil "BIS_DEBUG_CAM_PPEFFECTS") then {
	BIS_DEBUG_CAM_PPEFFECTS = [
		[1, 1, -0.01, [1.0, 0.6, 0.0, 0.005], [1.0, 0.96, 0.66, 0.55], [0.95, 0.95, 0.95, 0.0]],
		[1, 1.02, -0.005, [0.0, 0.0, 0.0, 0.0], [1, 0.8, 0.6, 0.65],  [0.199, 0.587, 0.114, 0.0]],
		[1, 1.15, 0, [0.0, 0.0, 0.0, 0.0], [0.5, 0.8, 1, 0.5],  [0.199, 0.587, 0.114, 0.0]],
		[1, 1.06, -0.01, [0.0, 0.0, 0.0, 0.0], [0.44, 0.26, 0.078, 0],  [0.199, 0.587, 0.114, 0.0]]
	];
};

//--- Undefined
if (typename _this != typename objnull) then {_this = cameraon};

private ["_ppos", "_pX", "_pY"];
_ppos = getPosATL _this;
_pX = _ppos select 0;
_pY = _ppos select 1;
_pZ = _ppos select 2;

private ["_local"];
_local = "camera" camCreate [_pX, _pY, _pZ + 2];
BIS_DEBUG_CAM = _local;
_local camCommand "MANUAL ON";
_local camCommand "INERTIA OFF";
_local cameraEffect ["INTERNAL", "BACK"];
showCinemaBorder false;
BIS_DEBUG_CAM setDir direction (vehicle player);


//--- Marker
BIS_DEBUG_CAM_MARKER = createmarkerlocal ["BIS_DEBUG_CAM_MARKER",_ppos];
BIS_DEBUG_CAM_MARKER setmarkertypelocal "mil_start";
BIS_DEBUG_CAM_MARKER setmarkercolorlocal "colorpink";
BIS_DEBUG_CAM_MARKER setmarkersizelocal [.75,.75];
BIS_DEBUG_CAM_MARKER setmarkertextlocal "You";


//--- Key Down
_keyDown = (finddisplay 46) displayaddeventhandler ["keydown","
	_key = _this select 1;
	_ctrl = _this select 3;
_helptext = '
Controls\n
N  Cycle between normal view / NVG / TI BW / TI WB\n
M  Open/Close map\n
  LMB in map - teleport camera to given location\n
Space Bar also targets nearest object OR position on ground\n
Del  Turn on/off floating mode\n
L turn off crosshair \n
F tracks targeted object OR position on ground nearest to crosshair\n
Mouse wheel UP / DOWN  modify focus lenght\n
V or right mouse click to exit.\n';
	if (_key in (actionkeys 'nightvision')) then {
		BIS_DEBUG_CAM_VISION = BIS_DEBUG_CAM_VISION + 1;
		if (BIS_DEBUG_CAM_ISFLIR) then {
					_vision = BIS_DEBUG_CAM_VISION % 4;
			switch (_vision) do {
				case 0: {
					camusenvg false;
					call compile 'false SetCamUseTi 0';
				};
				case 1: {
					camusenvg true;
					call compile 'false SetCamUseTi 0';
				};
				case 2: {
					camusenvg false;
					call compile 'true SetCamUseTi 0';
				};
				case 3: {
					camusenvg false;
					call compile 'true SetCamUseTi 1';
				};
			};
		} else {
			_vision = BIS_DEBUG_CAM_VISION % 2;
			switch (_vision) do {
				case 0: {
					camusenvg false;
				};
				case 1: {
					camusenvg true;
				};
			};
		};
	};
	if (_key == 35) then {
		cutText [_helptext,'PLAIN',3]
	};
	if (_key in (actionkeys 'showmap')) then {
		if (BIS_DEBUG_CAM_MAP) then {
			openmap [false,false];
			BIS_DEBUG_CAM_MAP = false;
		} else {
			openmap [true,true];
			BIS_DEBUG_CAM_MAP = true;
			BIS_DEBUG_CAM_MARKER setmarkerposlocal position BIS_DEBUG_CAM;
			BIS_DEBUG_CAM_MARKER setmarkerdirlocal direction BIS_DEBUG_CAM;
			mapanimadd [0,0.1,position BIS_DEBUG_CAM];
			mapanimcommit;
		};
	};

	if (_key == 41) then {
		BIS_DEBUG_CAM_COLOR ppeffectenable false;
	};
	if (_key >= 2 && _key <= 11) then {
		_id = _key - 2;
		if (_id < count BIS_DEBUG_CAM_PPEFFECTS) then {
			BIS_DEBUG_CAM_COLOR ppEffectAdjust (BIS_DEBUG_CAM_PPEFFECTS select _id);
			BIS_DEBUG_CAM_COLOR ppEffectCommit 0;
			BIS_DEBUG_CAM_COLOR ppeffectenable true;
		};
	};
"];

//--- Mouse wheel moving
_mousezchanged = (finddisplay 46) displayaddeventhandler ["mousezchanged","
	_n = _this select 1;
	BIS_DEBUG_CAM_FOCUS = BIS_DEBUG_CAM_FOCUS + _n/10;
	if (_n > 0 && BIS_DEBUG_CAM_FOCUS < 0) then {BIS_DEBUG_CAM_FOCUS = 0};
	if (BIS_DEBUG_CAM_FOCUS < 0) then {BIS_DEBUG_CAM_FOCUS = -1};
	BIS_DEBUG_CAM camcommand 'manual off';
	BIS_DEBUG_CAM campreparefocus [BIS_DEBUG_CAM_FOCUS,1];
	BIS_DEBUG_CAM camcommitprepared 0;
	BIS_DEBUG_CAM camcommand 'manual on';
"];

_map_mousebuttonclick = ((finddisplay 12) displayctrl 51) ctrladdeventhandler ["mousebuttonclick","
	_button = _this select 1;
	_ctrl = _this select 5;
	if (_button == 0) then {
		_x = _this select 2;
		_y = _this select 3;
		_worldpos = (_this select 0) posscreentoworld [_x,_y];
		BIS_DEBUG_CAM setpos [_worldpos select 0,_worldpos select 1,position BIS_DEBUG_CAM select 2];
		BIS_DEBUG_CAM_MARKER setmarkerposlocal _worldpos;
	};
"];


cutText ["Press H for help","PLAIN",3];

//Wait until destroy is forced or camera auto-destroyed.
private ["_lastpos"];
waituntil {
	if (!isnull BIS_DEBUG_CAM) then {_lastpos = position BIS_DEBUG_CAM};
	isNull BIS_DEBUG_CAM
};

player cameraEffect ["TERMINATE", "BACK"];
deletemarkerlocal BIS_DEBUG_CAM_MARKER;
BIS_DEBUG_CAM = nil;
BIS_DEBUG_CAM_MAP = nil;
BIS_DEBUG_CAM_MARKER = nil;
BIS_DEBUG_CAM_VISION = nil;
camDestroy _local;
BIS_DEBUG_CAM_LASTPOS = _lastpos;

ppeffectdestroy BIS_DEBUG_CAM_COLOR;
(finddisplay 46) displayremoveeventhandler ["keydown",_keyDown];
(finddisplay 46) displayremoveeventhandler ["mousezchanged",_mousezchanged];
((finddisplay 12) displayctrl 51) ctrlremoveeventhandler ["mousebuttonclick",_map_mousebuttonclick];

exit