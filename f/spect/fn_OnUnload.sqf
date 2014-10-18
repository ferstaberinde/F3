disableSerialization;
sleep 1;
if (f_cam_forcedExit) ExitWith {};
createDialog "f_spec_dialog";

_displayDialog = (findDisplay 9228);
call f_fnc_ReloadModes;
ctrlSetText [2112,(f_cam_sideNames select f_cam_sideButton)];
if(f_cam_playersOnly) then { ctrlSetText [2111,"Players only"];}
else { ctrlSetText [2111,"All units"];};
_helpWindow = _displayDialog displayCtrl 1310;
_mapWindow = _displayDialog displayCtrl 1350;
_fullmapWindow = _displayDialog displayCtrl 1360;
_mapWindow ctrlShow false;
_fullmapWindow ctrlShow false;
_fullmapWindow mapCenterOnCamera false;
_mapWindow mapCenterOnCamera false;
_helpWindow ctrlSetStructuredText parseText (f_cam_helptext);
// hide it to stop from being spammed open.
ctrlShow [1315, !ctrlVisible 1315];
ctrlShow [1310, !ctrlVisible 1310];
ctrlShow [1300, !ctrlVisible 1300];
ctrlShow [1305, !ctrlVisible 1305];