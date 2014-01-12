_groups = _this select 0;
_range = _this select 1;
_sleep = _this select 2;

While {count _groups > 0} do {
        {
                _groups = allGroups;
                if (isnull _x) then {
                        _groups = _groups - [_x];
                } else {
                        _exclude = _x getvariable ["ws_cacheExcl",false];
                        _cached = _x getvariable ["ws_cached", false];

                        if (!_exclude) then {
                                if (_cached) then {
                                        if ([_x, _range] call BIS_fnc_nearPlayer) then {
                                                _x setvariable ["ws_cached", false];
                                                _x call ws_fnc_uncache;
                                        };
                                } else {
                                        if !([_x, _range * 1.1] call BIS_fnc_nearPlayer) then {
                                                _x setvariable ["ws_cached", true];
                                                _x call ws_fnc_cache;
                                        };
                                };
                        };
                };
        } foreach _groups;

        sleep _sleep;
};