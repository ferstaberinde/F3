_inputControl = _this select 0;
_dialog = ctrlParent _inputControl;
_mineList = _dialog displayCtrl 26;
_currentSelection = lbCurSel _mineList; 

{
	_idc = _dialog displayCtrl _x;
	_idc ctrlEnable false;
} forEach [1,2,3,4,5,6,7,8,24];

(_dialog displayCtrl 23) ctrlSetBackgroundColor [0.8,0.8,0.8,0.25]; //timer bg colour

if (_currentSelection > -1) then {

	_mine = vip_sms_var_cl_mineList select _currentSelection;
	_armed = _mine getVariable "vip_mineArm";
	_statusText = "";

	switch (_armed) do {

		case 0: {
			 _statusText = "SAFE"; //status text
			(_dialog displayCtrl 2) ctrlEnable true; //remove
			
			switch (_mine getVariable "vip_mineType") do {

				case 0: { //bounding
					(_dialog displayCtrl 3) ctrlEnable true; //arm
				};
				
				case 1: { //flare
					(_dialog displayCtrl 4) ctrlEnable true; //arm tripwire
				};
				
				case 2: { //claymore
					(_dialog displayCtrl 4) ctrlEnable true; //arm tripwire
					(_dialog displayCtrl 5) ctrlEnable true; //arm remote
					(_dialog displayCtrl 7) ctrlEnable true; //rotate+
					(_dialog displayCtrl 8) ctrlEnable true; //rotate-
				};

				case 3; //explosive
				
				case 4: { //satchel
					(_dialog displayCtrl 5) ctrlEnable true; //arm remote
					(_dialog displayCtrl 6) ctrlEnable true; //arm timer
					(_dialog displayCtrl 23) ctrlSetBackgroundColor [0.8,0.8,0.8,1]; //timer bg colour
					(_dialog displayCtrl 24) ctrlEnable true; //timer text
				};
				
				case 5: { //sound
					(_dialog displayCtrl 3) ctrlEnable true; //arm sound
				};
				
				case 6: { //AT
					(_dialog displayCtrl 3) ctrlEnable true; //arm AT
				};
				
				case 7: { //SLAM
					(_dialog displayCtrl 3) ctrlEnable true; //arm
					(_dialog displayCtrl 6) ctrlEnable true; //arm timer
					(_dialog displayCtrl 23) ctrlSetBackgroundColor [0.8,0.8,0.8,1]; //timer bg colour
					(_dialog displayCtrl 24) ctrlEnable true; //timer text
					(_dialog displayCtrl 7) ctrlEnable true; //rotate+
					(_dialog displayCtrl 8) ctrlEnable true; //rotate-
				};
			};
		};
		
		case 1: {
			_statusText = "ARMING";
		};
		
		case 2: {
			_statusText = "ARMED";
			(_dialog displayCtrl 1) ctrlEnable true; //disarm
		};
		
		case 3: {
			_statusText = "ARMED: TRIPWIRE";
			(_dialog displayCtrl 1) ctrlEnable true; //disarm
		};
		
		case 4: {
			_statusText = "ARMED: REMOTE";
			(_dialog displayCtrl 1) ctrlEnable true; //disarm
		};
		
		case 5: {
			_statusText = "ARMED: TIMER";
			(_dialog displayCtrl 1) ctrlEnable true; //disarm
		};
	};

	(_dialog displayCtrl 22) ctrlSetText _statusText;
	_pos = getPosATL _mine;
	vip_sms_var_cl_3DIcon = ["\a3\Ui_F_Curator\Data\CfgMarkers\minefield_ca.paa", [1,0,0,0.5], [_pos select 0, _pos select 1, (_pos select 2) + 0.1], 2, 2, 0];
};

[_control] call vip_sms_fnc_cl_menuRemotes;