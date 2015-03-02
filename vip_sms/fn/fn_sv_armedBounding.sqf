_dummy = _this select 0;
_mine = _dummy getVariable "vip_mineObj";
_lineTestStart = getPosASL _dummy;
_lineTestEndUnit = getPosASL _dummy; _lineTestEndUnit set [2, (_lineTestEndUnit select 2) + 0.05];
_lineTestEndVeh = getPosASL _dummy; _lineTestEndVeh set [2, (_lineTestEndVeh select 2) + 0.3];

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 2, 50];

_safety = 0;
waitUntil {

	sleep 1;
	_safety = _safety + 1;
	(_safety == 10) || ((_dummy getVariable "vip_mineArm") == 0)
};

if ((_dummy getVariable "vip_mineArm") == 0) exitWith {[_dummy] call vip_sms_fnc_sv_disarm};

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 1.5, 50];

[_dummy, ["CAManBase", "LandVehicle", "Air", "thingX"], 30, 0.5] spawn vip_sms_fnc_sv_caching;

waitUntil {

	_cached = _dummy getVariable "vip_mineCached";
	if (_cached) then {waitUntil {sleep 0.25; !(_dummy getVariable "vip_mineCached")}} else {sleep 0.067};

	if (lineIntersects [_lineTestStart, _lineTestEndVeh, _mine, _dummy]) then {_dummy setVariable ["vip_mineDet", true, true]} else { //save some CPU time by only checking units if vehicles fail
	
		_units = nearestObjects [getPosATL _dummy, ["CAManBase"], 1];
		if (count _units > 0) then {
			{
				_intersectUnit = [vehicle _x, "FIRE"] intersect [ASLtoATL _lineTestStart, ASLtoATL _lineTestEndUnit];
				if (count _intersectUnit > 0) exitWith {_dummy setVariable ["vip_mineDet", true, true]};
			} forEach _units;
		};
	};
	
	((_dummy getVariable "vip_mineArm") == 0) || (_dummy getVariable "vip_mineDet")
};

if ((_dummy getVariable "vip_mineArm") == 0) then {[_dummy] call vip_sms_fnc_sv_disarm} else {
	if (_dummy getVariable "vip_mineDet") then {[_dummy, true] call vip_sms_fnc_sv_detonate};
};