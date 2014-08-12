// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================

// handles all the events. be afraid.
_type = _this select 0;
_args = _this select 1;
_handled = true;
switch (_type) do
{
// ==================================================================
// handles the mouse.
    case "MouseButtonDown":
    {

    	if(_args select 1 == 1 && f_cam_mode != 1) then
    	{
            _button = _args select 1;
            f_cam_MouseButton set [_button,true];

    	};
        if(_args select 1 == 1) then
        {
            if(f_cam_mode == 1) then
            {
                f_cam_ads = true;
                f_cam_curTarget switchCamera "gunner";
            }
        }
    };
    case "MouseButtonUp":
    {
    	if(_args select 1 == 1 && f_cam_mode != 1) then
    	{
            _button = _args select 1;
            f_cam_MouseButton set [_button,false];
             [] spawn f_fnc_HandleCamera;
    	};
        if(_args select 1 == 1) then
        {
            if(f_cam_mode == 1) then
            {
                f_cam_ads = false;
                f_cam_curTarget switchCamera "internal";
            }
        }
    };
    case "MapZoom":
    {
        f_cam_map_zoom = f_cam_map_zoom+((_args select 1)*0.05);
        if(f_cam_map_zoom > 0.5) then
        {
            f_cam_map_zoom = 0.5;
        };
        if(f_cam_map_zoom < 0.05) then
        {
            f_cam_map_zoom = 0.05;
        };
        _handled = true;
    };
    case "MouseMoving":
    {
        _x = _args select 1;
        _y = _args select 2;
        f_cam_mouseCord = [_x,_y];
        [] spawn f_fnc_HandleCamera;

	};
    case "MouseZChanged":
    {
        if(!f_cam_ctrl_down) then
        {
            f_cam_zoom = (f_cam_zoom - ((_args select 1)*f_cam_zoom/5)) max 0.1;
        }
        else
        {
            f_cam_fovZoom = ((f_cam_fovZoom - ((_args select 1)*f_cam_fovZoom/5)) max 0.1) min 1;
        };

    };

// ==================================================================
// handles dropboxes
    case "LBListSelChanged":
    {
        if(count f_cam_listUnits > (_args select 1)) then
        {
            _unit = f_cam_listUnits select (_args select 1);
            if(!isnil "_unit") then
            {
                if(typeName _unit == "GROUP") then {_unit = leader _unit};
                if(f_cam_mode == 0 || f_cam_mode == 1) then
                {
                    f_cam_curTarget = _unit;
                    if(f_cam_toggleCamera) then
                    {
                      f_cam_curTarget switchCamera "INTERNAL";
                    };
                    ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
                };
                if(f_cam_mode == 3) then
                {
                    _pos = getpos _unit;
                    _x = _pos select 0;
                    _y = _pos select 1;
                    f_cam_freecamera setPosASL [_x,_y,((getposASL f_cam_freecamera) select 2 ) max ((getTerrainHeightASL [_x,_y])+1)];
                };
            };
        };
    };
    case "LBListSelChanged_modes":
    {

        _index =  (_args select 1);
        switch (_index) do
        {
            case f_cam_lb_toggletiWHIndex:
            {
                f_cam_tiWHOn = !f_cam_tiWHOn;
                if(f_cam_tiWHOn) then
                {
                    f_cam_tiBHOn = false;
                    f_cam_nvOn = false;
                    true setCamUseTi 0;
                }
                else
                {
                    camUseNVG false;
                    false setCamUseTi 0;
                };
                call F_fnc_ReloadModes;

            };
            case f_cam_lb_toggletiBHIndex: // BlackHot
            {
                f_cam_tiBHOn = !f_cam_tiBHOn;
                if(f_cam_tiBHOn) then
                {
                    camUseNVG false;
                    f_cam_tiWHOn = false;
                    f_cam_nvOn = false;
                    true setCamUseTi 1;
                }
                else
                {
                    camUseNVG false;
                    false setCamUseTi 0;
                };
                call F_fnc_ReloadModes;

            };
            case f_cam_lb_toggleNormal:
            {
                    false setCamUseTi 0;
                    camUseNVG false;
                    f_cam_tiWHOn = false;
                    f_cam_tiBHOn = false;
                    f_cam_nvOn = false;
                call F_fnc_ReloadModes;
            };
            case f_cam_lb_toggletiNVIndex: // Nightvision
            {
                f_cam_nvOn = !f_cam_nvOn;
                if(f_cam_nvOn) then
                {
                    false setCamUseTi 0;
                    camUseNVG true;
                    f_cam_tiWHOn = false;
                    f_cam_tiBHOn = false;
                }
                else
                {
                    camUseNVG false;
                    false setCamUseTi 0;
                };
                call F_fnc_ReloadModes;

            };
        };
    };
// ==================================================================
// handles keys
    case "KeyDown":
    {
        _key = _args select 1;
        _handled = false;
       // if(!isNull (findDisplay 49)) exitWith {if(_key == 1) then {true}};
        switch (_key) do
        {
            case 78: // numpad +
            {
                f_cam_zoom = f_cam_zoom - 1;
                _handled = true;
            };
            case 74: // numpad -
            {
                f_cam_zoom = f_cam_zoom + 1;
                f_cam_zoom = 0.3 max f_cam_zoom;
                _handled = true;
            };
            case 22:
            {
                f_cam_hideUI = !f_cam_hideUI;
                [] spawn f_fnc_ToggleGUI;
                _handled = true;
            };
            // Freecam movement keys
            case 17:
            {
                f_cam_freecam_buttons set [0,true];
            };
            case 31:
            {
                f_cam_freecam_buttons set [1,true];
            };
            case 30:
            {
                f_cam_freecam_buttons set [2,true];
            };
            case 32:
            {
                f_cam_freecam_buttons set [3,true];
            };
            case 16:
            {
                f_cam_freecam_buttons set [4,true];
            };
            case 44:
            {
                f_cam_freecam_buttons set [5,true];
            };
            case 57:
            {
                f_cam_freecamOn = !f_cam_freecamOn;
                if(f_cam_freecamOn) then
                {
                    f_cam_angleY = 10;
                    [f_cam_freecamera,f_cam_angleY,0] call BIS_fnc_setPitchBank;
                    f_cam_freecamera cameraEffect ["internal", "BACK"];
                    f_cam_mode = 3;
                    f_cam_freecamera setPosASL getPosASL f_cam_camera;
                    cameraEffectEnableHUD true;
                    showCinemaBorder false;
                }
                else
                {
                    f_cam_angleY = 45;
                    f_cam_camera cameraEffect ["internal", "BACK"];
                    f_cam_mode = 0;
                    cameraEffectEnableHUD true;
                    showCinemaBorder false;
                };
            };

            // H
            case 35:
            {
                ctrlShow [1315, !ctrlVisible 1315];
                ctrlShow [1310, !ctrlVisible 1310];
                ctrlShow [1300, !ctrlVisible 1300];
                ctrlShow [1305, !ctrlVisible 1305];
                 _handled = true;
            };
            case 42:
            {
                f_cam_shift_down = true;
                [] spawn f_fnc_HandleCamera;
            };
            case 29:
            {
                f_cam_ctrl_down = true;
                [] spawn f_fnc_HandleCamera;
            };
            case 50:
            {
                //_mapWindow = _displayDialog displayCtrl 1350;
                f_cam_mapMode = f_cam_mapMode +1;
                if(f_cam_mapMode > 2) then
                {
                    f_cam_mapMode = 0;
                };
                switch (f_cam_mapMode) do
                {
                    // no maps
                    case 0:
                    {
                        ctrlShow [2110,true];
                        ctrlShow [2010,true];
                        ctrlShow [1350,false];
                        ctrlShow [1360,false];
                    };

                    case 1:
                    {
                        ctrlShow [2110,true];
                        ctrlShow [2010,true];
                        ctrlShow [1350,true];
                        ctrlShow [1360,false];
                    };
                    // big map
                    case 2:
                    {
                        ctrlShow [2110,false];
                        ctrlShow [2010,false];
                        ctrlShow [1350,false];
                        ctrlShow [1360,true];
                        _displayDialog = (findDisplay 9228);
                        _fullmapWindow = _displayDialog displayCtrl 1360;
                        ctrlMapAnimClear _fullmapWindow;
                        _fullmapWindow ctrlMapAnimAdd [0.001, 0.1,getpos f_cam_camera];
                        ctrlMapAnimCommit _fullmapWindow;
                    };
                };
                _handled = true;
            };
            case 1:
            {
              //  _handled = true;
            }

        };
        _handled
    };


    case "KeyUp":
    {
        if(!isNull (findDisplay 49)) exitWith {};
        _key = _args select 1;
        _handled = false;
        switch (_key) do
        {
            case 42:
            {
                f_cam_shift_down = false;
            };
            case 29:
            {
                f_cam_ctrl_down = false;
            };
            case 203:
            {
                _handled = true;
            };
            case 205:
            {
                _handled = true;
            };
            case 24:
            {
                _handled = true;
            };
            case 200:
            {
                _handled = true;
            };
            case 208:
            {
                _handled = true;
            };
            case 74:
            {
                _handled = true;
            };
            case 78:
            {
                _handled = true;
            };
            case 57:
            {
                _handled = true;
            };
            case 17:
            {
                f_cam_freecam_buttons set [0,false];
                _handled = true;
            };
            case 31:
            {
                f_cam_freecam_buttons set [1,false];
                _handled = true;
            };
            case 30:
            {
                f_cam_freecam_buttons set [2,false];
                _handled = true;
            };
            case 32:
            {
                f_cam_freecam_buttons set [3,false];
                _handled = true;
            };
            case 16:
            {
                f_cam_freecam_buttons set [4,false];
                _handled = true;
            };
            case 44:
            {
                f_cam_freecam_buttons set [5,false];
                _handled = true;
            };
        };
        _handled
    };
    _handled
};

