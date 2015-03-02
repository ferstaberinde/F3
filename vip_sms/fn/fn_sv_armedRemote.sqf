_dummy = _this select 0;
_mine = _dummy getVariable "vip_mineObj";

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 2, 50];

waitUntil {

	sleep 0.1;

	((_dummy getVariable "vip_mineArm") == 0) || (_dummy getVariable "vip_mineDet")
};

if ((_dummy getVariable "vip_mineArm") == 0) then {[_dummy] call vip_sms_fnc_sv_disarm} else {
	if (_dummy getVariable "vip_mineDet") then {[_dummy, true] call vip_sms_fnc_sv_detonate};
};