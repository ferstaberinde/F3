_pos = _this;
if(f_cam_mapMode == 2) then
{
    _chosen = nil;
    _dist = 99999;
    _ents = _pos nearEntities 50;
    {
        if(_pos distance _x <= _dist) then
        {

            _chosen = _x;
            _dist = _pos distance _x;
        };
    } foreach _ents;
    if(!isNil "_chosen") then
    {
        player sidechat "i've been chosen";
        f_cam_curTarget = _chosen;
        if(f_cam_toggleCamera) then
        {
          f_cam_curTarget switchCamera "INTERNAL";
        };
        ctrlSetText [1000,format ["Spectating:%1", name f_cam_curTarget]];
    };
};