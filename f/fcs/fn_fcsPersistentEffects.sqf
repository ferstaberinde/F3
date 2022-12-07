// F3 - FCS/Commander's Override system
// Credits and documentation: https://github.com/folkarps/F3/wiki
// Originally from: https://github.com/NikkoJT/njt_fcs (integrated with permission)

// This component handles the FCS failure symptoms, such as the HUD warning and zeroing overrides. It's launched when an FCS failure is determined by the Hit EH added in fcs_init.

params ["_target"];

// It's all a big loop
while {(_target getVariable ["f_var_fcs_failure",false]) && (alive _target)} do {

	// Check whether there is a gunner
	if !(isNull (gunner _target)) then {
		_currentGunner = gunner _target;
		{
			// Get the muzzles for every weapon on the main turret and force set their zeroing
			private _targetWeapon = _x;
			private _targetWeaponMuzzles = getArray (configFile >> "CfgWeapons" >> _x >> "muzzles");
			{
				_targetMuzzle = _targetWeapon;
				if !(_x == "this") then {
					_targetMuzzle = _x;
				};
				_zeroCheck = _currentGunner setWeaponZeroing [_targetWeapon,_targetMuzzle,1];
				if !(_zeroCheck) then { 
					diag_log format ["FCS: Weapon zeroing failure for %1",_targetWeapon]
				} else { 
					// diag_log format ["Zeroing set for %1",_targetWeapon]
				};
			} forEach _targetWeaponMuzzles;
		} forEach (_target weaponsTurret [0]);
		
		// Show a visual warning to the gunner - remoteExec'd to be local and only displayed when they are in the optics
		["FCS FAILURE",0.5] remoteExec ["f_fnc_fcsLocalWarning",_currentGunner,false];
		
	};
	
	sleep 0.8;
	
};
