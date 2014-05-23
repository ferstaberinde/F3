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
if(f_cam_toggleTagsName) then
{
	f_cam_lb_toggleTagNameIndex = lbAdd[_listBox,"Disable Tag names"];
}
else
{
	f_cam_lb_toggleTagNameIndex = lbAdd[_listBox,"Enable Tag names"];
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