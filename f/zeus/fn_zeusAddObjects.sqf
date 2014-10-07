private ["_curator","_mode","_objects","_getGlobalVars"];

_curator = [_this,0,objNull,[objNull]] call bis_fnc_param;
_mode = [_this,1,true,[true,[],side]] call bis_fnc_param;

_objects = [];
switch (typeName _mode) do {
	case "ARRAY": {_objects = _mode};

	case side: {
		_getGlobalVars = [0] execVM "f\common\f_setLocalVars.sqf";
		waitUntil {scriptDone _getGlobalVars};

		_objects = switch (_mode) do {
			case west: {f_var_units_BLU};
			case blufor: {f_var_units_BLU};
			case east: {f_var_units_OPF};
			case opfor: {f_var_units_OPF};
			case resistance: {f_var_units_RES};
			case independent: {f_var_units_RES};
			case civilian: {f_var_units_CIV};
		};
	};

	default {_objects = (vehicles+allUnits)};
};

// Add all selected objects to curator lists
_curator addCuratorEditableObjects [_objects,true];