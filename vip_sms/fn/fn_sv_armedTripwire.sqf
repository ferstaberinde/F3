_dummy = _this select 0;
_mine = _dummy getVariable "vip_mineObj";
_obj = _dummy getVariable "vip_mineTripObj";
_lineTestStart = [(getPosATL _mine) select 0, (getPosATL _mine) select 1, ((getPosATL _mine) select 2) + 0.1];
_lineTestEnd = [(getPosATL _obj) select 0, (getPosATL _obj) select 1, (getPosATL _obj select 2) + 0.08];
_dist = _lineTestStart distance _lineTestEnd;

vip_sms_var_gl_3DWires pushBack [_lineTestStart, _lineTestEnd];
publicVariable "vip_sms_var_gl_3DWires";

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 2, 50];

_safety = 0;
waitUntil {

	sleep 1;
	_safety = _safety + 1;
	(_safety == 10) || ((_dummy getVariable "vip_mineArm") == 0)
};

if ((_dummy getVariable "vip_mineArm") == 0) exitWith {

	_index = vip_sms_var_gl_3DWires find [_lineTestStart, _lineTestEnd];
	vip_sms_var_gl_3DWires deleteAt _index;
	publicVariable "vip_sms_var_gl_3DWires";
	deleteVehicle _obj;
	[_dummy] call vip_sms_fnc_sv_disarm
};

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 1.5, 50];

[_dummy, ["CAManBase", "LandVehicle", "Air", "thingX"], 40, 0.5] spawn vip_sms_fnc_sv_caching;

waitUntil {
	
	_cached = _dummy getVariable "vip_mineCached";
	if (_cached) then {waitUntil {sleep 0.1; !(_dummy getVariable "vip_mineCached")}} else {sleep 0.017};

	if (lineIntersects [ATLtoASL _lineTestStart, ATLtoASL _lineTestEnd, _mine, _obj]) then {_dummy setVariable ["vip_mineDet", true, true]} else { //save some CPU time by only checking units if objects fail
	
		_units = nearestObjects [_lineTestStart, ["CAManBase"], _dist];
		if (count _units > 0) then {
			{
				_intersectPlayer = [vehicle _x, "FIRE"] intersect [_lineTestStart, _lineTestEnd];
				if (count _intersectPlayer > 0) exitWith {_dummy setVariable ["vip_mineDet", true, true]};
			} forEach _units;
		};
	};
		
	((_dummy getVariable "vip_mineArm") == 0) || (_dummy getVariable "vip_mineDet")
};

_index = vip_sms_var_gl_3DWires find [_lineTestStart, _lineTestEnd];
vip_sms_var_gl_3DWires deleteAt _index;
publicVariable "vip_sms_var_gl_3DWires";
deleteVehicle _obj;

if ((_dummy getVariable "vip_mineArm") == 0) then {[_dummy] call vip_sms_fnc_sv_disarm} else {

	if (_dummy getVariable "vip_mineDet") then {

		playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 2, 50];
		[_dummy, true] call vip_sms_fnc_sv_detonate;
	};
};