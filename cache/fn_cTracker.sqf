/*
ws_fnc_cTracker
Latest: 15.01.2014

based on Black Mamba's work, which in turn is based on Nou and Jaynus' work. (All credit to them)

FEATURE
Tracks all currently present AI-only groups and caches/uncaches them according to distance to parameters
*/

_groups = _this select 0;
_range = _this select 1;
_sleep = _this select 2;

_debug = if !(isNil "ws_debug") then [{ws_debug},{false}];

While {count _groups > 0} do {
        {

                _groups = allGroups;

                if (_debug) then{ ["ws_fnc_cache DBG: Tracking ",[count _groups]," groups"] call ws_fnc_debugtext;};

                if (isnull _x) then {
                        _groups = _groups - [_x];

                        if (_debug) then{ ["ws_fnc_cache DBG: Group is null, deleting: ",[_x,count _groups]," groups left"] call ws_fnc_debugtext;};

                } else {
                        _exclude = _x getvariable ["ws_cacheExcl",false];
                        _cached = _x getvariable ["ws_cached", false];

                        if (!_exclude) then {
                                if (_cached) then {

                                        if (_debug) then {["ws_fnc_cache DBG: Checking group: ",[_x],""] call ws_fnc_debugtext;};

                                        if ([_x, _range] call ws_fnc_nearPlayer) then {

                                                if (_debug) then {["ws_fnc_cache DBG: Decaching: ",[_x],""] call ws_fnc_debugtext;};

                                                _x setvariable ["ws_cached", false];
                                                [_x,"ws_fnc_gUncache", true] spawn BIS_fnc_MP;

                                        };
                                } else {
                                        if !([_x, _range * 1.1] call ws_fnc_nearPlayer) then {

                                                if (_debug) then {["ws_fnc_cache DBG: Caching: ",[_x],""] call ws_fnc_debugtext;};

                                                _x setvariable ["ws_cached", true];
                                                [_x,"ws_fnc_gCache", true] spawn BIS_fnc_MP;
                                        };
                                };

                                if (_debug) then {["ws_fnc_cache DBG: Group is excluded: ",[_x]," - Ignoring."] call ws_fnc_debugtext;};
                        };
                };
        } foreach _groups;

        sleep _sleep;
};