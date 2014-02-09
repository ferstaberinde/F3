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

    		f_cam_mLeftDown = true;
            if((_args select 4)) then
            {
                f_cam_mShift = true;
            };
            f_cam_MouseMoving = true;
    		f_cam_onMouseMoving = (_args select 0) ctrlAddEventHandler ["MouseMoving", "['MouseMoving',_this] call f_cam_eventHandler"];

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
    		f_cam_mLeftDown = false;
            f_cam_mShift = false;
    		(_args select 0) ctrlRemoveEventHandler  ["MouseMoving",f_cam_onMouseMoving];
    		f_cam_MouseMoving = false;
    		f_cam_startX = 0;
    		f_cam_startY = 0;
    		f_cam_detlaX = 0;
    		f_cam_detlaY = 0;
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
    	if(f_cam_mLeftDown && f_cam_startX == -1 && f_cam_startY == -1  ) then
    	{
    		f_cam_startX = _args select 1;
    		f_cam_startY = _args select 2;
    	};
    	if(f_cam_mLeftDown && f_cam_startY >= 0) then
    	{
    		f_cam_detlaX = _args select 1;
    		f_cam_detlaY = _args select 2;
    	};

	};
    case "MouseZChanged":
    {
        f_cam_zoom = f_cam_zoom - (_args select 1);

    };

// ==================================================================
// handles dropboxes
    case "LBListSelChanged":
    {
        if(f_cam_playersOnly) then
        {
            if(count f_cam_players > (_args select 1)) then
            {
                _unit = f_cam_players select (_args select 1);
                if(!isnil "_unit") then
                {
                    f_cam_camera camSetTarget _unit;
                    f_cam_curTarget = _unit;
                    if(f_cam_toggleCamera) then
                    {
                      f_cam_curTarget switchCamera "INTERNAL";
                    };
                    ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
                };
            };
        }
        else
        {
            if(count f_cam_units > (_args select 1)) then
            {
                _unit = f_cam_units select (_args select 1);
                if(!isnil "_unit") then
                {
                    f_cam_camera camSetTarget _unit;
                    f_cam_curTarget = _unit;
                    if(f_cam_toggleCamera) then
                    {
                      f_cam_curTarget switchCamera "INTERNAL";
                    };
                    ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
                };
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
                call f_cam_reloadModesBox;

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
                    f_cam_camera = "camera" camCreate [position player select 0,position player select 1,2];
                    f_cam_camera cameraEffect ["internal", "BACK"];
                    f_cam_camera camSetTarget f_cam_curTarget;
                };
                call f_cam_reloadModesBox;

            };
            case f_cam_lb_toggleTagsIndex:
            {
                f_cam_toggleTags = !f_cam_toggleTags;
                if(f_cam_toggleTags) then
                {
                    f_cam_tagsEvent = addMissionEventHandler ["Draw3D", {_this call f_cam_drawTags}];
                }
                else
                {
                    removeMissionEventHandler ["Draw3D",f_cam_tagsEvent];
                };
                call f_cam_reloadModesBox;

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

            case 203: // right arrow
            {
                f_cam_angle = f_cam_angle + 1;
                _handled = true;
            };

            case 205: // left arrow
            {
                f_cam_angle = f_cam_angle - 1;
                _handled = true;
            };

            case 200: // up arrow
            {
                f_cam_height = f_cam_height + 1;
                _handled = true;
            };
            case 208: // down arrow
            {
                f_cam_height = f_cam_height - 1;
                f_cam_height = 0.3 max f_cam_height;
                _handled = true;
            };
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
            case 50:
            {
                ctrlShow [1350, !ctrlVisible 1350];
                 _handled = true;
            };

        };
        _handled
    };
    case "KeyUp":
    {
        _key = _args select 1;
        _handled = false;
        switch (_key) do
        {

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

