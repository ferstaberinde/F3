comment "for Spectating Script";
comment "Handles events such as keyboard keypresses";
comment "by Kegetys <kegetys [ät] dnainternet.net>";

_type = _this select 0;
_param = _this select 1;

_cCamera = 55002;
_cTarget = 55003;
_cName = 55004;
KEGs_cLBCameras = 55005;
KEGs_cLBTargets = 55006;
_cCamerasBG = 55007;
_cTargetsBG = 55008;
_cBG1 = 55009;
_cBG2 = 55010;
_cTitle = 55011;
_cHelp = 55012;
_cMap = 55013;
_cMapFull = 55014;
_cMapFullBG = 55015;
_cEventLog = 50016;
_cDebug = 55100;
_UI = [_cCamera, _cTarget, _cName, KEGs_cLBCameras, KEGs_cLBTargets, _cCamerasBG, _cTargetsBG, _cBG1, _cBG2, _cTitle, _cHelp];

switch (_type) do {
	comment "User clicked map, find nearest unit";
	case "MapClick": {	
		KEGs_dummy = "helihempty" createVehicleLocal _param;
		_closest = 250;
		_id = -1;
		for "_i" from 0 to ((count deathCam)-1) do {
			if((side (deathCam select _i)) in KEGsShownSides) then {
				_d = KEGs_dummy distance (deathCam select _i);
				if(_d < _closest) then {_id = _i;_closest = _d};
			};
		};
		if(_id != -1) then {
			KEGs_tgtIdx = _id;
			KEGsDroppedCamera = false; 
			if(ctrlVisible _cMapFull) then {
				comment "Full map -> Small map";
				[] spawn {sleep(0.25);["ToggleMap",0] call spectate_events;["ToggleMap",0] call spectate_events;};
			}
		};
		deletevehicle KEGs_dummy;
	};
	
	case "KeyDown": {		
		_key = _param select 1;
		comment "WSAD keys: camera movement in dropped mode";
		switch(_key) do {		
			case 32: {
				KEGsCamRight = true;
			};	
			case 30: {
				KEGsCamLeft = true;
			};
			case 17: {
				KEGsCamForward = true;
			};	
			case 31: {
				KEGsCamBack = true;
			};
			case 35: { 
				if (NORRN_noMarkersUpdates) then {
					NORRN_noMarkersUpdates = false;
					titleCut ["\n\n\n\n\n\n\n\n\nMap Marker Updates Enabled","PLAIN", 0.2];
					} else {
					NORRN_noMarkersUpdates = true;
					titleCut ["\n\n\n\n\n\n\n\n\nMap Marker Updates Disabled","PLAIN", 0.2];
				};
			};
		};
	}; 
	
	comment "Key up - process keypress";
	case "KeyUp": {
		_key = _param select 1;
		switch(_key) do {
			case 32: {
				comment "D = Next target";
				if(!KEGsDroppedCamera) then {KEGsSelect = 1; ["Specta_Events"] spawn PlayerMenuHandler;};
				KEGsCamRight = false;
				
			};	
			case 30: {
				comment "A = Previous target";
				if(!KEGsDroppedCamera) then {KEGsSelect = -1; ["Specta_Events"] spawn PlayerMenuHandler;};
				KEGsCamLeft = false;
			};
			case 17: {
				comment "W = Previous camera";
				if(!KEGsDroppedCamera) then {KEGs_cameraIdx = KEGs_cameraIdx - 1; ["Specta_Events"] spawn CameraMenuHandler;};
				KEGsCamForward = false;
			};	
			case 31: {
				comment "S = Next camera";
				_debugPlayer sidechat format ["Old KEGs_cameraIdx %1, New KEGs_cameraIdx %2", KEGs_cameraIdx, (KEGs_cameraIdx + 1)];	 
				if(!KEGsDroppedCamera) then {KEGs_cameraIdx = KEGs_cameraIdx + 1; ["Specta_Events"] call CameraMenuHandler;};
				KEGsCamBack = false;
			};
			case 20: {
				comment "T = Toggle tags";
				KEGsTags = !KEGsTags;
				if(!KEGsTags) then {
					["ToggleTags", [false, objNull]] call spectate_events;
				};
			};
			
			case 33: {
				comment "F = Toggle filter";
				KEGsAIfilter = !KEGsAIfilter;
				KEGsNeedUpdateLB = true;
			};			
			
			case 57: {
				comment "Space - drop camera or toggle 1stperson/gunner"; _debugPlayer groupchat "Processing SpaceBar Event";
				if(KEGs_cameras select KEGs_cameraIdx == KEGscam_1stperson) then {
					KEGs1stGunner = !KEGs1stGunner;
				} else {
					KEGsDroppedCamera = !KEGsDroppedCamera;
					if(KEGsDroppedCamera) then {
						KEGs_cameraIdx = 0;
						_debugPlayer groupchat "DropCamera Activated";
					};
				};
				["Specta_Events"] spawn CameraMenuHandler;
			};
	
			comment "Direct camera change with number keys";
			case 2: {KEGs_cameraIdx = 0; VM_CurrentCameraView = ""; _debugPlayer globalchat "key 1"; lbSetCurSel[KEGs_cLBCameras, KEGs_cameraIdx]; ctrlSetText[_cCamera, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]]; _debugPlayer sidechat format ["KEGs_cameraNames %1", KEGs_cameraNames];	 ["Specta_Events"] spawn CameraMenuHandler;};				
			case 3: {KEGs_cameraIdx = 1; VM_CurrentCameraView = ""; _debugPlayer globalchat "key 2"; lbSetCurSel[KEGs_cLBCameras, KEGs_cameraIdx]; ctrlSetText[_cCamera, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]];	["Specta_Events"] spawn CameraMenuHandler;};				
			case 4: {KEGs_cameraIdx = 2; VM_CurrentCameraView = ""; _debugPlayer globalchat "key 3"; lbSetCurSel[KEGs_cLBCameras, KEGs_cameraIdx]; ctrlSetText[_cCamera, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]];	["Specta_Events"] spawn CameraMenuHandler;};				
			case 5: {KEGs_cameraIdx = 3; VM_CurrentCameraView = ""; _debugPlayer globalchat "key 4"; lbSetCurSel[KEGs_cLBCameras, KEGs_cameraIdx]; ctrlSetText[_cCamera, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]];	["Specta_Events"] spawn CameraMenuHandler;};				
			case 6: {KEGs_cameraIdx = 4; VM_CurrentCameraView = ""; _debugPlayer globalchat "key 5";  lbSetCurSel[KEGs_cLBCameras, KEGs_cameraIdx];  ctrlSetText[_cCamera, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]]; ["Specta_Events"] spawn CameraMenuHandler;};
			comment "Toggle NVG or map text type";
			case 49: {
				if(ctrlVisible _cMapFull) then {
					KEGsMarkerType = KEGsMarkerType + 1;
					if(KEGsMarkerType > 2) then {KEGsMarkerType=0;};					
				} else {
					KEGsUseNVG = !KEGsUseNVG;
				};
			};
			
			case 50: {["ToggleMap",0] call spectate_events;};
			case 15: {["ToggleUI",0] call spectate_events;};
			case 59: {["ToggleHelp",0] call spectate_events;};			
			
			comment "Numpad + / -";
			case 78: {if(KEGsMarkerSize < 1.7) then {KEGsMarkerSize = KEGsMarkerSize * 1.15}};
			case 74: {if(KEGsMarkerSize > 0.7) then {KEGsMarkerSize = KEGsMarkerSize * (1/1.15)}};
		}
	}; 	
	
	comment "Mouse events";
	case "MouseMoving": {
		_x = _param select 1;
		_y = _param select 2;
		KEGsMouseCoord = [_x, _y];
		[] spawn FreeLookMovementHandler;
	};
		
	case "MouseButtonDown": {
		_x = _param select 2;
		_y = _param select 3;
		_button = _param select 1;
		KEGsMouseButtons set[_button, true];
		
	};	
	case "MouseButtonUp": {
		_x = _param select 2;
		_y = _param select 3;
		_button = _param select 1;
		KEGsMouseButtons set[_button, false];
		[] spawn FreeLookMovementHandler;
	};	
	
	case "MouseZChanged": {
		KEGsMouseScroll = KEGsMouseScroll + (_param select 1);
		[] spawn FreeLookMovementHandler; 
	};	

	case "MouseZChangedminimap": {
		KEGsMinimapZoom = KEGsMinimapZoom + ((_param select 1)*0.066);
		if(KEGsMinimapZoom > 0.5) then {KEGsMinimapZoom=0.5};
		if(KEGsMinimapZoom < 0.05) then {KEGsMinimapZoom=0.05};
	};			
		
	case "ToggleCameraMenu": {
		comment "hide/unhide camera menu";
		if(ctrlVisible KEGs_cLBCameras) then {
			ctrlShow[KEGs_cLBCameras, false];
			ctrlShow[_cCamerasBG, false];
		} else {
			ctrlShow[KEGs_cLBCameras, true];
			ctrlShow[_cCamerasBG, true];
		};
	};
	
	case "ToggleTargetMenu": {
		comment "hide/unhide targets menu";
		if(ctrlVisible KEGs_cLBTargets) then {
			ctrlShow[KEGs_cLBTargets, false];
			ctrlShow[_cTargetsBG, false];
		} else {
			ctrlShow[KEGs_cLBTargets, true];
			ctrlShow[_cTargetsBG, true];
		};
	};
	
	case "ToggleUI": {
		comment "hide/unhide UI";
		if(ctrlVisible _cName) then {
			{ctrlShow[_x, false]} foreach _UI;
		} else {
			{ctrlShow[_x, true]} foreach _UI;
			ctrlShow[_cHelp, false];
			ctrlShow[KEGs_cLBTargets, false];
			ctrlShow[_cTargetsBG, false];			
			ctrlShow[KEGs_cLBCameras, false];
			ctrlShow[_cCamerasBG, false];			
		};
	};
		
	case "ToggleHelp": {
		comment "hide/unhide Help text";
		if(ctrlVisible _cHelp) then {
			ctrlShow[_cHelp, false];
		} else {
			ctrlShow[_cHelp, true];
		};
	};

	case "ToggleMap": {
		comment "hide/unhide Map";
		if(ctrlVisible _cMap and ctrlVisible _cMapFull) then {
			comment "Beginning, hide both";
			ctrlShow[_cMap, false];
			ctrlShow[_cMapFull, false];			
			ctrlShow[_cMapFullBG, false];			
		};
		
		if(ctrlVisible _cMap) then {
			ctrlShow[_cMap, false];			
			ctrlShow[_cMapFull, true];
			ctrlShow[_cMapFullBG, true];			
			KEGsMarkerNames = true;
			KEGsSoundVolume = soundVolume;
			0.5 fadeSound 0.2;
		} else {
			KEGsMarkerNames = false;
			if(ctrlVisible _cMapFull) then {
				ctrlShow[_cMapFull, false];
				ctrlShow[_cMapFullBG, false];			
				0.5 fadeSound KEGsSoundVolume;
			} else {
				ctrlShow[_cMap, true];
			};
		};
	};
	
	comment "Toggle particlesource tags";	
	case "ToggleTags": {
		if(_param select 0) then {
			comment "turn on";
			_lifeTime = 0.5;
			_dropPeriod = 0.05;
			_size = 0.5;
			_cam = _param select 1;
			
			_part = "a3\data\cl_water.p3d";
			if(KEGsClientAddonPresent) then {_part = "\KEGspect\tag.p3d"};
			
			{
				_u = _x select 0;
				_s = _x select 1;
				
				_size = 1.33 min (((vehicle _u) distance _cam)/100);
				
				_color = [1,1,1,1];
				if(side _u == east) then {_color = [1,0,0,1]};
				if(side _u == west) then {_color = [0,0,1,1]};
				if(side _u == resistance) then {_color = [0,1,0,1]};
				if(alive _u) then {
					_colorB = [_color select 0, _color select 1, _color select 2, 0];
	
					_s setParticleParams[_part, "", "billboard", 1, _lifeTime, [0, 0, 2], [0,0,0], 1, 1, 0.784, 0.1, [_size, _size*0.66], [_color, _color, _color, _color, _colorB], [1], 10.0, 0.0, "", "", vehicle _u];
					_s setDropInterval _dropPeriod;				
				} else {
					_s setDropInterval 0;				
				};
			} foreach KEGsTagSources;
		} else {
			comment "turn off";
			{
				_s = _x select 1;	
				_s setDropInterval 0;				
			} foreach KEGsTagSources;
		};		
	};	
	
	comment "Add string to event log";
	case "EventLogAdd": {
		_txt = _param select 0;
		_color = _param select 1;
		_i = lbAdd[_cEventLog, _txt];
		lbSetColor[_cEventLog, _i, _color];	
		lbSetCurSel[_cEventLog, _i];
	};
	
	comment "Killed eventhandler, add to log";
	case "UnitKilled": {		
		_killed = _param select 0;
		_killer = _param select 1;
		_txt = format["%1 (%2) was killed by %3 (%4) (%5m)", _killed, side _killed, _killer, side _killer, _killed distance _killer];
		["EventLogAdd",[_txt,[1,1,1,1]]] call spectate_events;
	};
	
	comment "Fired eventhandler, display as marker in map";
	comment "Also missile camera is handled here";
	case "UnitFired": {				
		if(KEGsTags and KEGsClientAddonPresent) then {
			comment "Bullet path bar";
			_u = _param select 0;
			_w = _param select 1;
			_a = _param select 4;
			_o = (getpos _u) nearestObject _a;
			
			_type = getText(configFile >> "CfgAmmo" >> format["%1", typeOf _o] >> "simulation");
			
			if(_type == "shotBullet") then {
				_bar = "KEGspect_bar_yellow";				
				if(side _u == west) then {_bar = "KEGspect_bar_red"};
				if(side _u == east) then {_bar = "KEGspect_bar_green"};
				
				_bars = [];
				for "_i" from 0 to 300 step 5 do {
					_pos = _o modelToWorld[0,_i+2.5,0];
					_b = _bar createVehicleLocal _pos;
					_b setVectorDir(vectorDir _o);
					_b setVectorUp(vectorUp _o);
					_bars set [(count _bars) , _b]; // _bars = _bars + [_b];
				};		
				_bars spawn {sleep 1.5;{deletevehicle _x} foreach _this};
			};
		};
		if(ctrlVisible _cMapFull) then {
			_u = _param select 0;
			_w = _param select 1;
			_a = _param select 4;
			_o = (getpos _u) nearestObject _a;
			_len = (speed _o)/15;
			KEGs_dir = getdir _o;
			comment "Marker for shot effect (stationary circle)";
			_m2 = createMarkerLocal[format["KEGsMarkerFired%1", random 10000], getpos _o];
			_m2 setMarkerColorLocal "ColorYellow";
			_m2 setMarkerSizeLocal[0.45, 0.45];
			_m2 setMarkerTypeLocal "Select";
			
			_type = getText(configFile >> "CfgAmmo" >> format["%1", typeOf _o] >> "simulation");
			_name = getText(configFile >> "CfgWeapons" >> format["%1", _w] >> "displayName");
			
			comment "Marker for round itself, for bullet display line, everything else a named marker";
			if(_type == "shotMissile" OR _type == "shotRocket" OR _type == "shotShell" OR _type == "shotTimeBomb" OR _type == "shotPipeBomb" OR _type == "shotMine" OR _type == "shotSmoke") then {
				_m = createMarkerLocal[format["KEGsMarkerFired%1", random 10000], [(getpos _o select 0)+(sin KEGs_dir)*_len, (getpos _o select 1)+(cos KEGs_dir)*_len, 0]];
				_m setMarkerTypeLocal "mil_dot";
				_m setMarkerColorLocal "ColorWhite";
				_m setMarkerSizeLocal[0.25,0.5];
				_m setMarkerTextLocal _name;
				_m2 spawn {sleep(2);deleteMarkerLocal _this};		
				[_m, _o] spawn {
					_m = _this select 0;
					_o = _this select 1;
					while{!isNull _o} do {
						_m setMarkerPosLocal getpos _o;
						_m setMarkerDirLocal getdir _o;
						sleep(1/50);
					};
					_m setMarkerColorLocal "ColorBlack";
					sleep(3);
					deleteMarkerLocal _m;
				};
			} else {
				_m = createMarkerLocal[format["KEGsMarkerFired%1", random 10000], [(getpos _o select 0)+(sin KEGs_dir)*_len, (getpos _o select 1)+(cos KEGs_dir)*_len, 0]];
				_m setMarkerShapeLocal "RECTANGLE";
				_m setMarkerSizeLocal[0.25,_len];
				_m setMarkerDirLocal (getdir _o);
				if(KEGsClientAddonPresent) then {
					_m setMarkerColorLocal "KEGsDarkYellow";
					[_m2, _m] spawn {sleep(1.0);(_this select 1) setMarkerColorLocal "KEGsYellowAlpha";sleep(1);deletemarkerLocal (_this select 1);deletemarkerLocal (_this select 0);};		
				} else {
					_m setMarkerColorLocal "ColorYellow";
					[_m2, _m] spawn {sleep(1.0);(_this select 1) setmarkerbrushLocal "grid";sleep(1);deletemarkerLocal (_this select 1);deletemarkerLocal (_this select 0);};		
				};
			}
		};
		
		comment "Missile camera";			
		if(KEGsUseMissileCam and !KEGsDroppedCamera) then {
			_u = _param select 0;
			_w = _param select 1;
			_a = _param select 4;
			_o = (getpos _u) nearestObject _a;
			
			_type = getText(configFile >> "CfgAmmo" >> format["%1", typeOf _o] >> "simulation");
			_name = getText(configFile >> "CfgWeapons" >> format["%1", _w] >> "displayName");
			
			if(_u == vehicle KEGs_target and (_type == "shotMissile" or _type == "shotRocket") and !KEGsMissileCamActive) then {
				KEGsMissileCamActive = true;
				cutText[_name,"PLAIN DOWN", 0.10];
				KEGscam_missile switchCamera "INTERNAL";
				_debugPlayer globalchat "Line 398 KEGscam_missile switchCamera 'INTERNAL';";
				KEGscam_missile cameraEffect["internal", "BACK"];	
				KEGscam_missile camsettarget _o;
				KEGscam_missile camsetrelpos[0,0,0];
				KEGscam_missile camSetFov 0.5;
				KEGscam_missile camCommit 0;
				KEGscam_missile camSetFov 1.25;
				KEGscam_missile camCommit 2;
				_o spawn {
					while{!isNull _this and speed _this > 1} do {
						KEGscam_missile camsettarget _this;
						KEGscam_missile camsetrelpos[0,-0.1,0.20];
						KEGscam_missile camCommit 0;			
						sleep(0.01);			
					};
					sleep(3);
					KEGsMissileCamActive = false;
				};				
			}						
		};
	};
				
	default {
		hint "Unknown event";
	};
};
false
