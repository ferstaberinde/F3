_dialog = _this select 0;
_control = _dialog displayCtrl 26;

if ((lbSize _control) > 0) then {lbClear _control; _control lbSetCurSel -1};

vip_sms_var_cl_mineList = [];
vip_sms_var_cl_3DIcon = [];
_tempList = nearestObjects [player, ["Land_Map_F"], 2];

{
	if !(isNull (_x getVariable ["vip_mineObj", objNull])) then {
		_dir = [player, _x] call BIS_fnc_relativeDirTo;
		if ((_dir >= 270) || (_dir <= 90)) then {
			vip_sms_var_cl_mineList pushback _x;
		};
	};
} foreach _tempList;

if ((count vip_sms_var_cl_mineList) > 0) then {
	
	_count0 = 0;
	_count1 = 0;
	_count2 = 0;
	_count3 = 0;
	_count4 = 0;
	_count5 = 0;
	_count6 = 0;
	_count7 = 0;
	
	{
		_type = [];
		switch (_x getVariable "vip_mineType") do {
		
			case 0: {
				_count0 = _count0 + 1;
				_type = ["Bounding Mine", _count0];
			};
			
			case 1: {
				_count1 = _count1 + 1;
				_type = ["Tripflare", _count1];
			};
			
			case 2: {
				_count2 = _count2 + 1;
				_type = ["Claymore Mine", _count2];
			};
			
			case 3: {
				_count3 = _count3 + 1;
				_type = ["Explosive Charge", _count3];
			};
			
			case 4: {
				_count4 = _count4 + 1;
				_type = ["Satchel Charge", _count4];
			};
			
			case 5: {
				_count5 = _count5 + 1;
				_type = ["Proximity Alarm", _count5];
			};
			
			case 6: {
				_count6 = _count6 + 1;
				_type = ["AT Mine", _count6];
			};
			
			case 7: {
				_count7 = _count7 + 1;
				_type = ["SLAM", _count7];
			};
		};
		
		_control lbAdd ((_type select 0) + " #" + str (_type select 1));

	} foreach vip_sms_var_cl_mineList;
	
	_control lbSetCurSel 0;
};

{
	_idc = _dialog displayCtrl _x;
	_idc ctrlEnable false;
} forEach [1,2,3,4,5,6,7,8,9,10,24];

(_dialog displayCtrl 24) ctrlSetText "30"; //timer text

[_control] call vip_sms_fnc_cl_menuUpdate;
[_control] call vip_sms_fnc_cl_menuRemotes;