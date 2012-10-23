// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

private ['_handled', '_key', '_keys'];

_keys = keysToHandle;
_handled = false;
_key = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;

//_gen globalChat format["Recognize, Key: %1, %2", _key, _keys];

_keyCount = count _keys;
_i = 0;
while { _i < _keyCount && !_handled } do {
	_xKey = (_keys select _i) select 0;
	// player globalChat format["key: %1 %2", _key, _xKey];
	if (_xKey == _key) then {
		if (count (_keys select _i) > 1) then {
			// player globalChat format["key: %1 %2", _key, _xKey];
			_needsShift = 0;
			_needsControl = 0;
			for "_keymod" from 1 to ((count (_keys select _i)) - 1) do {
				if ((_keys select _i) select _keymod == "shift") then {
					_needsShift = 1;
				};
				if ((_keys select _i) select _keymod == "control") then {
					_needsControl = 1;
				};
			};
			/*
			while { w }
			{
				player globalChat format["_x: %1", _x];
				if (_x == "shift") then {
					_needsShift = true;
				};
				if (_x == "control") then {
					_needsControl = true;
				};
			} foreach (_keys select _i);
			*/
			_controlInt = 0;
			if (_control) then {
				_controlInt = 1;
			};
			_shiftInt = 0;
			if (_shift) then {
				_shiftInt = 1;
			};
			// player sideChat format["%1 %2, %3 %4", _needsControl, _controlInt, _needsShift, _shiftInt ];
			if (_needsControl == _controlInt && _needsShift == _shiftInt) then {
				_handled = true;
				_function = keyFunctions select _i;
				call compile format["['key', %1, %2, %3] call %4;", _key, _shift, _ctrl, _function];
				// player globalChat format["%1", keyPressCounter];
			};
		}
		else {
			_handled = true;
			_function = keyFunctions select _i;
			call compile format["['key', %1, %2, %3] call %4;", _key, _shift, _ctrl, _function];
			// player globalChat format["%1", keyPressCounter];
			keyPressCounter = keyPressCounter + 1;
		};
	};
	_i = _i + 1;
};

_handled; // return val
