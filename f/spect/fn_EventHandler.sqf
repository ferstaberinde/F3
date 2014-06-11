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
                f_cam_curTarget = _unit;
                if(f_cam_toggleCamera) then
                {
                  f_cam_curTarget switchCamera "INTERNAL";
                };
                ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
            };
        };
    };
    case "LBListSelChanged_modes":
    {

        _index =  (_args select 1);
        switch (_index) do
        {
            case f_cam_lb_toggleplayersIndex:
            {

                f_cam_playersOnly = !f_cam_playersOnly;
                f_cam_listUnits = [];
                lbClear 2100;
                call F_fnc_ReloadModes;

            };
            case f_cam_lb_togglecameraIndex:
            {

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
            case f_cam_lb_toggleTagNameIndex:
            {
                f_cam_toggleTagsName = !f_cam_toggleTagsName;
                call F_fnc_ReloadModes;
            };
            case f_cam_lb_toggleTagsIndex:
            {
                f_cam_toggleTags = !f_cam_toggleTags;
                call F_fnc_ReloadModes;

            };
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
            default
            {
                 /* STATEMENT */
            };
        };
    };
// ==================================================================
// handles keys
    case "KeyDown":
    {
        _key = _args select 1;
        _handled = false;
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

        };
        _handled
    };
    _handled
};

