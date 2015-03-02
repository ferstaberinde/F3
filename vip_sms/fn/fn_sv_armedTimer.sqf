_dummy = _this select 0;
_mine = _dummy getVariable "vip_mineObj";
_secs = _dummy getVariable "vip_mineTimer";
_t = 0;

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 2, 50];

waitUntil {

	sleep 1;
	
	_t = _t + 1;
	
	if (_t >= _secs) then {_dummy setVariable ["vip_mineDet", true, true]};

	((_dummy getVariable "vip_mineArm") == 0) || (_dummy getVariable "vip_mineDet")
};

if ((_dummy getVariable "vip_mineArm") == 0) then {[_dummy] spawn vip_sms_fnc_sv_idle} else {
	
	if (_dummy getVariable "vip_mineDet") then {[_dummy, true] call vip_sms_fnc_sv_detonate};
};