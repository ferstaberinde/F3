_type = _this select 0;
_pos = _this select 1;
_dir = _this select 2;
_vector = _this select 3;
_attachTo = _this select 4;

_dummy = "Land_Map_F" createVehicle _pos;
_mine = _type createVehicle _pos;
_dummy setVariable ["vip_mineVector", [_dir, _vector], true];
_dummy setVariable ["vip_mineObj", _mine, true];
[[_dummy], "vip_sms_fnc_cl_vector", true] call BIS_fnc_MP;
_dummy hideObjectGlobal true;
vip_sms_var_gl_jipMines pushBack _dummy;
publicVariable "vip_sms_var_gl_jipMines";

_dummy setPosATL _pos;
_mine setPosATL _pos;

if !(isNull _attachTo) then {
	_relativePos = _attachTo worldToModel _pos;
	_mine attachTo [_attachTo, _relativePos];
	_mine setVectorUp _vector;
	_dummy attachTo [_attachTo, _relativePos];
};

_mine enableSimulationGlobal false;
_dummy enableSimulationGlobal false;

_dummy setVariable ["vip_mineArm", 0, true]; //0 for safe, 1 for arming, 2 for armed, 3 for tripwire, 4 for remote, 5 for timed
_dummy setVariable ["vip_mineTimer", 30, true];
_dummy setVariable ["vip_mineRemoved", false, true];
_dummy setVariable ["vip_mineDet", false, true];
_dummy setVariable ["vip_mineTripObj", objNull, true];
_dummy setVariable ["vip_mineCached", false, true];

//[_dummy] execVM "debugCaching.sqf";

switch (_type) do  {

	case "APERSBoundingMine_Range_Ammo": {

		_mine setPosATL [getPosATL _mine select 0, getPosATL _mine select 1, (getPosATL _mine select 2) - 0.14];
		_dummy setVariable ["vip_mineType", 0, true]; //0 for bounding, 1 for trip, 2 for claymore, 3 for charge, 4 for satchel, 5 for sound, 6 for AT, 7 for SLAM
		
		_dummy addEventHandler ["Explosion", { 
			_d = _this select 0;
			if (random(1) > 0.75) then { //armor value should be different depending on munition type
				_d setVariable ["vip_mineDet", true, true];
			};
		}];
	};

	case "Land_GasCanister_F": {

		_dummy setVariable ["vip_mineType", 1, true]; 
		
		_dummy addEventHandler ["Explosion", {
			_d = _this select 0;
			if (random(1) > 0.25) then {
				_d setVariable ["vip_mineArm", 0, true];
				_d setVariable ["vip_mineRemoved", true, true]; //tripflare only deletes; doesn't explode
			};
		}];
	};

	case "ClaymoreDirectionalMine_Remote_Ammo_Scripted": {

		_dummy setVariable ["vip_mineType", 2, true];
		
		_dummy addEventHandler ["Explosion", {
			_d = _this select 0;
			if (random(1) > 0.25) then {
				_d setVariable ["vip_mineDet", true, true];
			};
		}];
	};

	case "DemoCharge_Remote_Ammo_Scripted": {

		_dummy setVariable ["vip_mineType", 3, true];
		
		_dummy addEventHandler ["Explosion", {
			_d = _this select 0;
			if (random(1) > 0.4) then {
				_d setVariable ["vip_mineDet", true, true];
			};
		}];
	};

	case "SatchelCharge_Remote_Ammo_Scripted": {

		_dummy setVariable ["vip_mineType", 4, true];
		
		_dummy addEventHandler ["Explosion", {
			_d = _this select 0;
			if (random(1) > 0.5) then {
				_d setVariable ["vip_mineDet", true, true];
			};
		}];
	};

	case "APERSMine_Range_Ammo": {

		_dummy setVariable ["vip_mineType", 5, true];
		
		_dummy addEventHandler ["Explosion", {
			_d = _this select 0;
			if (random(1) > 0.25) then {
				_d setVariable ["vip_mineArm", 0, true];
				_d setVariable ["vip_mineRemoved", true, true]; //sound alarm only deletes; doesn't explode
			};
		}];
	};
	
	case "ATMine_Range_Ammo": {

		_dummy setVariable ["vip_mineType", 6, true];
		if ((((surfaceType _pos) find "Concrete") < 0) && !(isOnRoad _pos)) then {_mine setPosATL [getPosATL _mine select 0, getPosATL _mine select 1, (getPosATL _mine select 2) - 0.105]};
		
		_dummy addEventHandler ["Explosion", {
			_d = _this select 0;
			if (random(1) > 0.35) then {
				_d setVariable ["vip_mineDet", true, true];
			};
		}];
	};
	
	case "SLAMDirectionalMine_Wire_Ammo": {
	
		_dummy setVariable ["vip_mineType", 7, true];
		
		_dummy addEventHandler ["Explosion", {
			_d = _this select 0;
			if (random(1) > 0.25) then {
				_d setVariable ["vip_mineDet", true, true];
			};
		}];
	};
};

playSound3D ["a3\sounds_f\weapons\closure\sfx3.wss", _mine, false, getPosASL _mine, 1, 1, 50];

[_dummy] spawn vip_sms_fnc_sv_idle;