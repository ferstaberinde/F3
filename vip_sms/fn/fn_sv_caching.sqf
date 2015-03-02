_dummy = _this select 0;
_types = _this select 1;
_dist = _this select 2;
_sleep = _this select 3;

waitUntil {

	if (isNull _dummy) exitWith {};
	_cached = _dummy getVariable "vip_mineCached";
	_objs = nearestObjects [_dummy, _types, _dist];
	_goodObjs = [];
	
	if ("thingX" in _types) then {
		{
			if !((typeOf _x) in ["Land_CanOpener_F", "Land_Map_F"]) then {
				_goodObjs pushBack _x;
			}
		} forEach _objs;
	} else {_goodObjs = _objs};

	if (count _goodObjs > 0) then {
	
		if (_cached) then {_dummy setVariable ["vip_mineCached", false, false]};
	
	} else {
	
		if (!_cached) then {_dummy setVariable ["vip_mineCached", true, false]};
	};
	
	sleep _sleep;

	((_dummy getVariable "vip_mineArm") == 0) || (_dummy getVariable "vip_mineDet")
};