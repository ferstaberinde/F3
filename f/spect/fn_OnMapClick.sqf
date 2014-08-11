_pos = _this;
if(f_cam_mapMode == 2) then
{
    _chosen = nil;
    _dist = 99999;
    _ents = _pos nearEntities [["SoldierWB","AllVehicles"],10];


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