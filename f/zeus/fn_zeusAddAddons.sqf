private ["_curator","_mode","_addons","_cfgPatches","_class"];

_curator = [_this,0,objNull,[objNull]] call bis_fnc_param;
_mode = [_this,1,true,[objNull,true,[]]] call bis_fnc_param;

_addons = [];
switch (typeName _mode) do {
	case "ARRAY": {_addons = _mode};
	case "OBEJCT": {_addons = [_mode]};
	default {
		// Add all allowed addons to curator list
		_cfgPatches = configfile >> "cfgpatches";
		for "_i" from 0 to (count _cfgPatches - 1) do {
			_class = _cfgPatches select _i;
			if (isclass _class) then {_addons set [count _addons,configname _class];};
		};
	};
};

_curator addcuratoraddons _addons;