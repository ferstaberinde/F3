disableSerialization;
private ["_dummy", "_armed"];
_control = _this select 0;
_action = _this select 1;
_dialog = ctrlParent _control;

if (_action < 8) then {

	_mineList = (_dialog displayCtrl 26);
	_currentSelection = lbCurSel _mineList;
	_dummy = vip_sms_var_cl_mineList select _currentSelection;
	_nullDummy = (isNull _dummy) || ((player distance _dummy) > 2.5);
	
	if !(_nullDummy) then {

		_armed = _dummy getVariable "vip_mineArm";
		
		switch (_action) do {
			
			case 0: { //disarm
			
				if (_armed < 2) then {
					hintSilent "Mine status changed. Refreshing.";
				} else {
					if (_armed == 4) then {
						if (count vip_sms_var_cl_remoteMines > 0) then {
							{
								if ((_x select 0) == _dummy) then {
									_x set [0, objNull];
									[_control] call vip_fnc_mines_menuRemote;
								};
							} forEach vip_sms_var_cl_remoteMines;
						};
					};
					[_dummy, 0] call vip_sms_fnc_cl_remove;
				};
				[_control] call vip_sms_fnc_cl_menuUpdate;
			};
			
			case 1: { //remove
			
				if (_armed != 0) then {
					[_control] call vip_sms_fnc_cl_menuUpdate; hintSilent "Mine status changed. Refreshing.";
				} else {
					[_dummy, 1] call vip_sms_fnc_cl_remove;
					(_dialog displayCtrl 2) ctrlEnable false;
					waitUntil {isNull (_dummy)};
					[_dialog] call vip_sms_fnc_cl_menuOpen;
				};
			};
			
			case 2: { //arm
				
				if (_armed != 0) then {
					hintSilent "Mine status changed. Refreshing.";
				} else {
					[_dummy, 0] call vip_sms_fnc_cl_arm;
				};
				[_control] call vip_sms_fnc_cl_menuUpdate;
			};
			
			case 3: { //tripwire
			
				if (_armed != 0) then {
					[_control] call vip_sms_fnc_cl_menuUpdate; hintSilent "Mine status changed. Refreshing.";
				} else {
					[_dummy, 1] spawn vip_sms_fnc_cl_arm; //must be spawn!!!
					vip_sms_var_cl_3DIcon = [];
					closeDialog 0;
				};
			};
			
			case 4: { //remote
			
				if (_armed != 0) then {
					hintSilent "Mine status changed. Refreshing.";
				} else {	
					[_dummy, 2] call vip_sms_fnc_cl_arm;
					[_control] call vip_sms_fnc_cl_menuRemotes;
				};
				[_control] call vip_sms_fnc_cl_menuUpdate;
			};
			
			case 5: { //timer
			
				if ((_armed != 0) && (_armed != 5)) then {
					hintSilent "Mine status changed. Refreshing.";
				} else {
					_timer = [(ctrlText (_dialog displayCtrl 24))] call BIS_fnc_parseNumber;
					if (_timer > -1) then {
						_timer = round(_timer);
						if ((_timer <= 600) && (_timer >= 10)) then {
							_dummy setVariable ["vip_mineTimer", _timer, true];
							[_dummy, 3] call vip_sms_fnc_cl_arm;
						} else {hintSilent "Timer value must be between 10 and 600 seconds."};
					} else {hintSilent "Timer value must be a number.";};
				};
				[_control] call vip_sms_fnc_cl_menuUpdate;
			};
			
			case 6: { //rot left
			
				if (_armed != 0) then {
					[_control] call vip_sms_fnc_cl_menuUpdate; hintSilent "Mine status changed. Refreshing.";
				} else {
					_vector = _dummy getVariable "vip_mineVector";
					_vector set [0, (_vector select 0) - 5];
					_dummy setVariable ["vip_mineVector", _vector, true];
					[[_dummy], "vip_sms_fnc_cl_vector"] call BIS_fnc_MP;
				};
			};
			
			case 7: { //rot right
			
				if (_armed != 0) then {
					[_control] call vip_sms_fnc_cl_menuUpdate; hintSilent "Mine status changed. Refreshing.";
				} else {
					_vector = _dummy getVariable "vip_mineVector";
					_vector set [0, (_vector select 0) + 5];
					_dummy setVariable ["vip_mineVector", _vector, true];
					[[_dummy], "vip_sms_fnc_cl_vector"] call BIS_fnc_MP;
				};
			};
		};
	} else {[_dialog] call vip_sms_fnc_cl_menuOpen; hintSilent "Mine missing. Refreshing list."};

} else {

	switch (_action) do {
	
		case 8: { //safety
		
			_safety = (_dialog displayCtrl 10);
			_detonate = (_dialog displayCtrl 9);
			
			switch (ctrlEnabled _detonate) do {
				case true: {
					_safety ctrlSetText "SAFETY OFF";
					_detonate ctrlEnable false;
				};
				case false: {
					_safety ctrlSetText "SAFETY ON";
					_detonate ctrlEnable true;
				};
			};
		};
		
		case 9: { //detonate

			_remoteList = (_dialog displayCtrl 27);
			_currentSelection = lbCurSel _remoteList;
			_index = _remoteList lbValue _currentSelection;
			_dummy = (vip_sms_var_cl_remoteMines select _index) select 0;
			_armed = -1;
			if (!isNull _dummy) then {_armed = _dummy getVariable "vip_mineArm"};
			
			if ((_armed != 4) || (isNull _dummy)) then {
				[_control] call vip_sms_fnc_cl_menuRemotes; hintSilent "Remote status changed. Refreshing list.";
			} else {

				_explode = [_dummy] call vip_sms_fnc_cl_remoteTrigger;
				if (_explode) then {
					{
						if ((_x select 0) == _dummy) then {_x set [0, objNull]};
					} forEach vip_sms_var_cl_remoteMines;
					[_control] call vip_sms_fnc_cl_menuRemotes;
				};
			};
		};
	};
};