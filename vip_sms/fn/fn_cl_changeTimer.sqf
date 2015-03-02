_dummy = _this select 0;
_secs = _this select 1;

_dummy setVariable ["vip_mineTimer", _secs, true];

if (_dummy getVariable "vip_mineArm" > 0) then {

	_dummy setVariable ["vip_mineArm", 0, true];
	waitUntil {_dummy getVariable "vip_mineArm" == 0};
	_dummy setVariable ["vip_mineArm", 5, true];	
};