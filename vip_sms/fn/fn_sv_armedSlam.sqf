_dummy = _this select 0;
_mine = _dummy getVariable "vip_mineObj";
_dir = getDir _mine;
_lineTestStart = getPosASL _dummy; _lineTestStart set [2, (_lineTestStart select 2) + 0.15];
_lineTestEnd = [_lineTestStart, 8, _dir] call BIS_fnc_relPos; _lineTestEnd set [2, _lineTestStart select 2];

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 2, 50];

_safety = 0;
waitUntil {

	sleep 1;
	_safety = _safety + 1;
	(_safety == 10) || ((_dummy getVariable "vip_mineArm") == 0)
};

if ((_dummy getVariable "vip_mineArm") == 0) exitWith {[_dummy] call vip_sms_fnc_sv_disarm};

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 1.5, 50];

[_dummy, ["LandVehicle", "Air"], 50, 0.5] spawn vip_sms_fnc_sv_caching;

waitUntil {

	_cached = _dummy getVariable "vip_mineCached";
	if (_cached) then {waitUntil {sleep 0.1; !(_dummy getVariable "vip_mineCached")}} else {sleep 0.017};

	_objs = nearestObjects [getPosATL _dummy, ["LandVehicle", "Air"], 10];
	
	if (count _objs > 0) then {
		_intersects = lineIntersectsWith [_lineTestEnd, _lineTestStart, _dummy, _mine, true]; //check from end to start, because lineIntersectsWith sorts from furthest to closest
		if (count _intersects > 0) then {if ((_intersects select 0) in _objs) then {_dummy setVariable ["vip_mineDet", true, true]}};
	};
	
	((_dummy getVariable "vip_mineArm") == 0) || (_dummy getVariable "vip_mineDet")
};

if ((_dummy getVariable "vip_mineArm") == 0) then {[_dummy] call vip_sms_fnc_sv_disarm} else {
	if (_dummy getVariable "vip_mineDet") then {[_dummy, true] call vip_sms_fnc_sv_detonate};
};