// F3 - Caching Script Tracker
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// DECLARE VARIABLES AND PARAMETERS
private ["_groups","_debug","_exclude","_cached"];

params [
	["_range", 0, [0]]
];

_debug = if (f_param_debugMode == 1) then [{true},{false}];

// ====================================================================================

// BEGIN THE TRACKING LOOP
while {f_var_cacheRun} do {
	_groups = allGroups select { ! isNull _x };
	if (_debug) then{player globalchat format ["f_fnc_cache DBG: Tracking %1 groups",count _groups]};
	{
		_exclude = _x getvariable ["f_cacheExcl",false];
		_cached  = _x getvariable ["f_cached", false];

		if (!_exclude) then {
			if (_cached) then {

				if (_debug) then {player globalchat format ["f_fnc_cache DBG: Checking group: %1",_x]};

				if ([leader _x, _range] call f_fnc_nearPlayer) then {

					if (_debug) then {player globalchat format ["f_fnc_cache DBG: Decaching: %1",_x]};

					_x setvariable ["f_cached", false];
					_x spawn f_fnc_gUncache;

				};
			} else {
				if !([leader _x, _range * 1.1] call f_fnc_nearPlayer) then {

					if (_debug) then {player globalchat format ["f_fnc_cache DBG: Caching: %1",_x]};

					_x setvariable ["f_cached", true];
					[_x] spawn f_fnc_gCache;
				};
			};
		} else {
			if (_debug) then {player globalchat format ["f_fnc_cache DBG: Group is excluded: %1",_x]};
		};
	} foreach _groups;

	sleep f_var_cacheSleep;
};

// If the caching loop is terminated, uncache all cached groups
{
	if (_x getvariable ["f_cached", false]) then {
		_x spawn f_fnc_gUncache;
		_x setvariable ["f_cached", false];
	};
} forEach allGroups;
