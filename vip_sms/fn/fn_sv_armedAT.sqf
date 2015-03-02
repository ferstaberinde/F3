_dummy = _this select 0;
_mine = _dummy getVariable "vip_mineObj";

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 2, 50];

_safety = 0;
waitUntil {

	sleep 1;
	_safety = _safety + 1;
	(_safety == 10) || ((_dummy getVariable "vip_mineArm") == 0)
};

if ((_dummy getVariable "vip_mineArm") == 0) exitWith {[_dummy] call vip_sms_fnc_sv_disarm};

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 1.5, 50];

_mine setDamage 0;
_mine enableSimulationGlobal true;

waitUntil {

	sleep 0.1;

	((_dummy getVariable "vip_mineArm") == 0) || (_dummy getVariable "vip_mineDet") || !(alive _mine)
};

if ((_dummy getVariable "vip_mineArm") == 0) then {_mine enableSimulationGlobal false; [_dummy] call vip_sms_fnc_sv_disarm} else {
	if (_dummy getVariable "vip_mineDet") then {[_dummy, true] call vip_sms_fnc_sv_detonate};
	if !(alive _mine) then {[_dummy] call vip_sms_fnc_sv_remove};
};