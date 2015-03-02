_dummy = _this select 0;

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 1.5, 50];
[_dummy] spawn vip_sms_fnc_sv_idle;