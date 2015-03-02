_dummy = _this select 0;
_action = _this select 1;

switch (_action) do {

	case 0: {_dummy setVariable ["vip_mineArm", 0, true]};
	
	case 1: {
	
		_type = _dummy getVariable "vip_mineType";
		_pos = getPosATL _dummy;
		_attached = attachedTo _dummy;
		
		_mag = switch (_type) do {

			case 0: {"APERSBoundingMine_Range_Mag"};
			case 1: {"APERSTripMine_Wire_Mag"};
			case 2: {"ClaymoreDirectionalMine_Remote_Mag"};
			case 3: {"DemoCharge_Remote_Mag"};
			case 4: {"SatchelCharge_Remote_Mag"};
			case 5: {"APERSMine_Range_Mag"};
			case 6: {"ATMine_Range_Mag"};
			case 7: {"SLAMDirectionalMine_Wire_Mag"};
		};
		
		_dummy setVariable ["vip_mineRemoved", true, true];
		
		waitUntil {isNull _dummy};

		if (player canAdd _mag) then {
		
			player addMagazine _mag;
		
		} else {

			private ["_ground"];
			
			_nearHolders = nearestObjects [_pos, ["GroundWeaponHolder", "WeaponHolderSimulated"], 0.5];
			
			if (count _nearHolders > 0) then {
			
				_ground = _nearHolders select 0;
				
			} else {
			
				_holderType = "GroundWeaponHolder";
				if !(isNull _attached) then {_holderType = "WeaponHolderSimulated"; _pos = [_pos select 0, _pos select 1, (_pos select 2) + 0.1]};
				_ground = _holderType createVehicle _pos;
				_ground setPosATL _pos;
			};
			
			_ground addMagazineCargoGlobal [_mag, 1];
		};
	};
};