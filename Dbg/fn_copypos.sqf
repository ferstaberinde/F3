_pos = [(getposASL player) select 0,(getposASL player) select 1,(getposATL player) select 2];
copyToClipboard format ["%1",_pos];
["ws_fnc_copyPos: ",_pos," copied!"] call ws_fnc_debugtext;