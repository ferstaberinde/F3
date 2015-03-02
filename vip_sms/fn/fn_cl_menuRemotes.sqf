_inputControl = _this select 0;
_dialog = ctrlParent _inputControl;
_control = _dialog displayCtrl 27;

(_dialog displayCtrl 9) ctrlEnable false;

if ((lbSize _control) > 0) then {lbClear _control};

if ((count vip_sms_var_cl_remoteMines) > 0) then {
	
	_countClaymore = 0;
	_countCharge = 0;
	_countSatchel = 0;
	
	{
		_type = [];
		switch (_x select 1) do { 
			case 2: {
			
				_countClaymore = _countClaymore + 1;
				_type = ["Claymore Mine", _countClaymore];
			};
			case 3: {

				_countCharge = _countCharge + 1;
				_type = ["Explosive Charge", _countCharge];
			};
			case 4: {

				_countSatchel = _countSatchel + 1;
				_type = ["Satchel Charge", _countSatchel];
			};
		};
		
		if (!isNull (_x select 0)) then {
			_index = _control lbAdd ((_type select 0) + " #" + str (_type select 1));
			_control lbSetValue [_index, _forEachIndex];
		};

	} foreach vip_sms_var_cl_remoteMines;
};

if (lbSize _control > 0) then {

	(_dialog displayCtrl 10) ctrlEnable true;
	_control lbSetCurSel 0;
} else {

	(_dialog displayCtrl 10) ctrlEnable false;
};