_dummy = _this select 0;

waitUntil {sleep 0.1; ((_dummy getVariable "vip_mineArm") > 1) || (_dummy getVariable "vip_mineRemoved") || (_dummy getVariable "vip_mineDet")};

if (_dummy getVariable "vip_mineArm" > 1) then {

	[_dummy] call vip_sms_fnc_sv_arm;
};

if (_dummy getVariable "vip_mineRemoved") then {

	[_dummy] call vip_sms_fnc_sv_remove;
};

if (_dummy getVariable "vip_mineDet") then {

	[_dummy, true] call vip_sms_fnc_sv_detonate;
};