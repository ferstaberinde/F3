_pos = (_this select 0) ctrlMapScreenToWorld [(_this select 2), (_this select 3)];
if(f_cam_mapMode == 2) then
{
    if(f_cam_mode == 0 || f_cam_mode == 1) then
    {
        _chosen = nil;
        _dist = 99999;
        _ents = _pos nearEntities [["CAManBase","AllVehicles"],10];


        {
            {
                if(_pos distance _x <= _dist && _x in f_cam_listUnits) then
                {

                    _chosen = _x;
                    _dist = _pos distance _x;
                };
            } foreach crew _x;
        } foreach _ents;
        if(!isNil "_chosen") then
        {
            f_cam_curTarget = _chosen;
            if(f_cam_toggleCamera) then
            {
              f_cam_curTarget switchCamera "INTERNAL";
            };

            // hide map
            f_cam_mapMode = 0;
            ctrlShow [2110,true];
            ctrlShow [2010,true];
            ctrlShow [1350,false];
            ctrlShow [1360,false];


            ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
        };
    };
    if(f_cam_mode == 3) then
    {
        _x = _pos select 0;
        _y = _pos select 1;
        f_cam_freecamera setPosASL [_x,_y,((getposASL f_cam_freecamera) select 2 ) max ((getTerrainHeightASL [_x,_y])+1)];
        // hide map
        f_cam_mapMode = 0;
        ctrlShow [2110,true];
        ctrlShow [2010,true];
        ctrlShow [1350,false];
        ctrlShow [1360,false];

    };
};
true