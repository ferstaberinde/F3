// F3 - Caching Script Tracker
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS
private ["_range","_sleep","_groups"];

_range = _this select 0;
_sleep = _this select 1;
_groups = allGroups;

_debug = if !(isNil "ws_debug") then [{ws_debug},{false}];

// ====================================================================================

// BEGIN THE TRACKING LOOP
While {count _groups > 0} do {
        {
                _groups = allGroups;

                if (_debug) then{ ["f_fnc_cache DBG: Tracking ",[count _groups]," groups"] call f_fnc_debugtext;};

                if (isnull _x) then {
                        _groups = _groups - [_x];

                        if (_debug) then{ ["f_fnc_cache DBG: Group is null, deleting: ",[_x,count _groups]," groups left"] call f_fnc_debugtext;};

                } else {
                        _exclude = _x getvariable ["ws_cacheExcl",false];
                        _cached = _x getvariable ["ws_cached", false];

                        if (!_exclude) then {
                                if (_cached) then {

                                        if (_debug) then {["f_fnc_cache DBG: Checking group: ",[_x],""] call f_fnc_debugtext;};

                                        if ([_x, _range] call f_fnc_nearPlayer) then {

                                                if (_debug) then {["f_fnc_cache DBG: Decaching: ",[_x],""] call f_fnc_debugtext;};

                                                _x setvariable ["ws_cached", false];
                                                [_x,"f_fnc_gUncache", true] spawn BIS_fnc_MP;

                                        };
                                } else {
                                        if !([_x, _range * 1.1] call f_fnc_nearPlayer) then {

                                                if (_debug) then {["f_fnc_cache DBG: Caching: ",[_x],""] call f_fnc_debugtext;};

                                                _x setvariable ["ws_cached", true];
                                                [_x,"f_fnc_gCache",true] spawn BIS_fnc_MP;
                                        };
                                };

                                if (_debug) then {["f_fnc_cache DBG: Group is excluded: ",[_x]," - Ignoring."] call f_fnc_debugtext;};
                        };
                };
        } foreach _groups;

        sleep _sleep;
};