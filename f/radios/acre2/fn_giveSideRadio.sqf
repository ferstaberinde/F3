////////// f_fnc_GiveSideRadio
////////// Must happen after radios have been setup...
////////// 0: Unit to receive radio
////////// 1: The side the radio should be configured for
////////// 2: radio classname
////////// Example: [player,opfor,"ACRE_PRC148"];

_unit = _this select 0;
_side = _this select 1;
_radio = _this select 2;

// must be local.
if (!local _unit) ExitWith {};
_ret = [_radio, str _side] call acre_api_fnc_setDefaultChannels;
_unit addItem _radio;
