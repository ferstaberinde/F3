_dummy = _this select 0;
_mine = _dummy getVariable "vip_mineObj";
_type = _dummy getVariable "vip_mineType";

if (_type == 1) then {

	_mine spawn {
		
		_flare = "F_40mm_Yellow" createVehicle getPos _this;
		_flare2 = "F_40mm_Yellow" createVehicle getPos _this;
		sleep 0.5;
		deleteVehicle _this;
		_smoke = "SmokeShell" createVehicle getPos _this;
		waitUntil {!alive _flare};
		deleteVehicle _smoke;
	};

} else {

	_mine enableSimulationGlobal true;
	_mine setDamage 1;
};

deleteVehicle _dummy;

vip_sms_var_gl_jipMines deleteAt (vip_sms_var_gl_jipMines find _dummy);
publicVariable "vip_sms_var_gl_jipMines";