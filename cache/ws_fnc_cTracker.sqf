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

While {count _groups > 0} do {
        {
                _groups = allGroups;

                if (ws_debug) then ["ws_fnc_cache DBG: Tracking groups, range, sleep ",[count _groups,_range,_sleep],""] call ws_fnc_debugtext;


                if (isnull _x) then {
                        _groups = _groups - [_x];
                        if (ws_debug) then ["ws_fnc_cache DBG: Group is null, deleting: ",[_x,count _groups]," groups left"] call ws_fnc_debugtext;


                } else {
                        _exclude = _x getvariable ["ws_cacheExcl",false];
                        _cached = _x getvariable ["ws_cached", false];

                        if (!_exclude) then {
                                if (_cached) then {
                                        if ([_x, _range] call BIS_fnc_nearPlayer) then {
                                                _x setvariable ["ws_cached", false];
                                                _x call ws_fnc_gUncache;
                                        };
                                } else {
                                        if !([_x, _range * 1.1] call BIS_fnc_nearPlayer) then {
                                                _x setvariable ["ws_cached", true];
                                                _x call ws_fnc_gCache;
                                        };
                                };
                        };
                };
        } foreach _groups;

        sleep _sleep;
};