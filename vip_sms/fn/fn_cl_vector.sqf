_dummy = _this select 0;
waitUntil {!isNull (_dummy getVariable ["vip_mineObj", objNull])};
waitUntil {count (_dummy getVariable ["vip_mineVector", []]) > 0};
_mine = _dummy getVariable "vip_mineObj";
_vectorDir = _dummy getVariable "vip_mineVector";

_mine setDir (_vectorDir select 0);
_mine setVectorUp (_vectorDir select 1);