// F2 - Name Tags
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

#define RECOGOVERLAY_IDD 990
#define RECOGOVERLAY_TEXT0_IDC 991

[(_this select 0)] spawn {
	private ['_display', '_ctrl'];
	disableSerialization;
	_display = (_this select 0);
	_overlayWidth = 0.7;

	_ctrls = [];
	_i = 0;
	while { _i < 10 } do {
		_ctrls set [_i, _display displayCtrl (RECOGOVERLAY_TEXT0_IDC + _i)];
		_i = _i + 1;
	};

	while { true } do {
		[] call recognize;
		_i = 0;
		while {_i < foundUnitsCount} do {
			_ctrl = _ctrls select _i;

			// move backwards through the list because closer units are at the front (painter's algorithm)
			// only necessary when using partially opaque backgrounds
			_unit = foundUnitsCount - _i - 1;

			_tmpText = (foundUnitsText select _unit) select 0;
			_scrPos = (foundUnitsText select _unit) select 1;
			_lineCount = (foundUnitsText select _unit) select 2;
			_distMod = (foundUnitsText select _unit) select 3;
			_absolutePos = (foundUnitsText select _unit) select 4;

			// left corner, must be set so the box will be centered on scrPos.x
			if !(_absolutePos) then {
				_scrPos set [0, (_scrPos select 0) - _overlayWidth / 2.0 * recognizeScale * _distMod / 2.0];
			};
			// overlay box width
			_scrPos set [2, _overlayWidth];
			// overlay box height
			_scrPos set [3, (0.005 + 0.06 * _lineCount)];

			_ctrl ctrlSetBackgroundColor [1, 1, 1, 0];
			//_ctrl ctrlSetBackgroundColor [1, 1, 1, 0.1 + (_distMod - 1.0) / 2.0];
			_ctrl ctrlSetScale (recognizeScale * _distMod / 2.0);
			_ctrl ctrlSetStructuredText parseText _tmpText;
			_ctrl ctrlSetPosition _scrPos;
			_ctrl ctrlCommit 0;
			_ctrl ctrlShow true;
			_i = _i + 1;
		};

		while {_i < 10} do {
			_ctrl = _ctrls select _i;
			_ctrl ctrlShow false;
			_i = _i + 1;
		};

		sleep 0.05;
	};

};
