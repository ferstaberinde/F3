_pos = _this select 0;
_dummy = _this select 1;

_trip = "Land_CanOpener_F" createVehicle _pos;
_trip setPosATL _pos;
_trip setDir 0;
_trip setVectorUp [1, -1, 0];
_trip enableSimulationGlobal false;

_dummy setVariable ["vip_mineTripObj", _trip, true];
_dummy setVariable ["vip_mineArm", 3, true];

playSound3D ["a3\sounds_f\weapons\closure\sfx3.wss", _dummy, false, getPosASL _dummy, 1, 1, 50];