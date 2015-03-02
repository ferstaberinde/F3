_dummy = _this select 0;
_type = _dummy getVariable "vip_mineType";
_state = _dummy getVariable "vip_mineArm";

switch (_type) do {

	case 0: { //bounding
	
		switch (_state) do {

			case 2: {[_dummy, 0] spawn vip_sms_fnc_sv_armedBounding};
		};
	};
	
	case 1: { //tripwire
	
		switch (_state) do {

			case 3: {[_dummy] spawn vip_sms_fnc_sv_armedTripwire};
		};
	};
	
	case 2: { //claymore
	
		switch (_state) do {

			case 3: {[_dummy] spawn vip_sms_fnc_sv_armedTripwire};
			case 4: {[_dummy] spawn vip_sms_fnc_sv_armedRemote};
		};
	};
	
	case 3: { //charge
	
		switch (_state) do {

			case 4: {[_dummy] spawn vip_sms_fnc_sv_armedRemote};
			case 5: {[_dummy] spawn vip_sms_fnc_sv_armedTimer};
		};
	};
	
	case 4: { //satchel
	
		switch (_state) do {

			case 4: {[_dummy] spawn vip_sms_fnc_sv_armedRemote};
			case 5: {[_dummy] spawn vip_sms_fnc_sv_armedTimer};
		};
	};
	
	case 5: { //sound
	
		switch (_state) do {

			case 2: {[_dummy] spawn vip_sms_fnc_sv_armedSound};
		};
	};
	
	case 6: { //AT
	
		switch (_state) do {
		
			case 2: {[_dummy] spawn vip_sms_fnc_sv_armedAT};
		};
	};
	
	case 7: { //SLAM
	
		switch (_state) do {

			case 2: {[_dummy] spawn vip_sms_fnc_sv_armedSlam};
			case 5: {[_dummy] spawn vip_sms_fnc_sv_armedTimer};
		};
	};
};