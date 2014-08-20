// F3 - Caching Script Tracker
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
private ["_range","_sleep","_groups","_debug"];

_range = _this select 0;
_sleep = _this select 1;
_groups = allGroups;

_debug = if (f_var_debugMode == 1) then [{true},{false}];

// ====================================================================================

// BEGIN THE TRACKING LOOP
While {count _groups > 0} do {
        {
                _groups = allGroups;

                if (_debug) then{player globalchat format ["f_fnc_cache DBG: Tracking %1 groups",count _groups]};

                if (isnull _x) then {
                        _groups = _groups - [_x];

                        if (_debug) then{player globalchat format ["f_fnc_cache DBG: Group is null, deleting: %1",_x,count _groups]};

                } else {
                        _exclude = _x getvariable ["f_cacheExcl",false];
                        _cached = _x getvariable ["f_cached", false];

                        if (!_exclude) then {
                                if (_cached) then {

                                        if (_debug) then {player globalchat format ["f_fnc_cache DBG: Checking group: %1",_x]};

                                        if ([leader _x, _range] call f_fnc_nearPlayer) then {

                                                if (_debug) then {player globalchat format ["f_fnc_cache DBG: Decaching: %1",_x]};

                                                _x setvariable ["f_cached", false];
                                                [_x,"f_fnc_gUncache", false,false] spawn BIS_fnc_MP;

                                        };
                                } else {
                                        if !([leader _x, _range * 1.1] call f_fnc_nearPlayer) then {

                                                if (_debug) then {player globalchat format ["f_fnc_cache DBG: Caching: %1",_x]};

                                                _x setvariable ["f_cached", true];
                                                [_x,"f_fnc_gCache",false,false] spawn BIS_fnc_MP;
                                        };
                                };

                                if (_debug) then {player globalchat format ["f_fnc_cache DBG: Group is excluded: %1",_x]};
                        };
                };
        } foreach _groups;

        sleep _sleep;
};