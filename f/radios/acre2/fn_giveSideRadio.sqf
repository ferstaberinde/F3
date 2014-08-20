//////////
//////////
//////////
//////////
_unit = _this select 0;
_side = _this select 1;
if (!local _unit) ExitWith {};
_ret = ["ACRE_PRC148", _side] call acre_api_fnc_setDefaultChannels;
_unit addItem "ACRE_PRC148";
