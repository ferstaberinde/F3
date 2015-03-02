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

_beat = false;
_pos = getPosATL _mine;
_lineTestStart = ATLtoASL [_pos select 0, _pos select 1, (_pos select 2) + 0.1];

[_dummy, ["CAManBase"], 7, 0.5] spawn vip_sms_fnc_sv_caching;

waitUntil {

	_cached = _dummy getVariable "vip_mineCached";
	if (_cached) then {waitUntil {sleep 0.25; !(_dummy getVariable "vip_mineCached")}} else {sleep 0.5};
	
	_objs = nearestObjects [_pos, ["CAManBase"], 4];
	_units = [];
	_sound = false;
	
	if (_beat) then {_beat = false} else {_beat = true};
	{if (alive _x) then {_units pushBack _x}} foreach _objs;
	if (count _units > 0) then {
		{
			_modelPos = _x selectionPosition "neck";
			_worldPos = _x modelToWorld _modelPos;
			_lineTestEnd = ATLtoASL _worldPos;
			_intersectsObjs = lineIntersects [_lineTestStart, _lineTestEnd, _mine, _x];
			if !(_intersectsObjs) then {
				_intersectsTerrain = terrainIntersectASL [_lineTestStart, _lineTestEnd];
				if !(_intersectsTerrain) exitWith {_sound = true};
			};
		} foreach _units;
	};
	
	if (_sound && _beat) then {playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\drill_start.wss", _mine, false, getPosASL _mine, 1, 1.5, 200]};
	
	((_dummy getVariable "vip_mineArm") == 0)
};

[_dummy] call vip_sms_fnc_sv_disarm;