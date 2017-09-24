
params ["_unit"];
 _countCondit = {
            params["_animEntry", "_testString"];
            if(_animEntry isEqualType "") exitWith {
               _animEntry find _testString != -1
            };
            false
        };
_anim = configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit;
if (!isNull _anim) then {
    if(!isNull (_anim >> "interpolateTo")) then {
        _anim = ((getArray (_anim >> "interpolateTo")));
        _kiaAnim = _anim select {[_x, "kia"] call _countCondit};
        _dieAnim = _anim select {[_x, "Die"] call _countCondit};
        _unconAnim = _anim select {[_x, "Unconscious"] call _countCondit};
        if(count _kiaAnim > 0) exitWith {
            _anim = _kiaAnim select 0;
        };
        if(count _dieAnim > 0) exitWith {
            _anim = _dieAnim select 0;
        };
        if(count _unconAnim > 0) exitWith {
            _anim = _unconAnim select 0;
        };
        _anim = "Unconscious";
    }else {
        _anim = "Unconscious";
    }

}else {
    _anim = "Unconsious";
};
_anim;
