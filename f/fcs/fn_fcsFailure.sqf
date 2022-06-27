// F3 - FCS/Commander's Override system
// Credits and documentation: https://github.com/folkarps/F3/wiki
// Originally from: https://github.com/NikkoJT/njt_fcs (integrated with permission)

// This function is used in the Hit EH defined in fcs_init. It determines whether a given hit causes an FCS failure.

params ["_target","_projectile","_isDirect"];

	private _projectileClass = "";
	private _warheadType = "";
	private _randomNumber = 0;
	
	if (_target getVariable ["fcs_failure",false]) exitWith { 
		// diag_log "FCS: target already has an FCS failure" 
	};

	// Determine whether the projectile is an anti-tank weapon
	_projectileClass = typeOf _projectile;
	if !(_projectileClass isKindOf ["Default",configFile >> "CfgAmmo"]) exitWith {
		//diag_log "FCS: hit by something other than a weapon" 
	};
	_warheadType = (configProperties [configFile >> "CfgAmmo" >> _projectileClass >> "warheadName"]) select 0;
	if !(_warheadType in ["AP","HEAT"]) exitWith { 
		// diag_log "FCS: projectile not HEAT or AP" 
	};
	if !(_isDirect) exitWith { 
		// diag_log "FCS: splash damage only" 
	};

	// 5% of qualifying hits should trigger this
	_randomNumber = floor (random 20);
	if !(_randomNumber == 10) exitWith { 
		// diag_log "FCS: projectile not randomly selected" 
	};

	// Hit turns off the stabiliser and sets an appropriate variable on the vehicle
	// EXCEPT IT DOESN'T TURN OFF THE STABILISER BECAUSE THAT'S NOT WHAT THE COMMAND DOES
	// GOD DAMN IT BI
	// Turns off night vision though
	[_target,[false,[0]]] remoteExec ["enableDirectionStabilization",0,_target];
	_target disableNVGEquipment true;
	_target setVariable ["fcs_failure",true,true];
	
	// Spawn ongoing stuff that affects the vehicle until repaired
	[_target] spawn f_fnc_fcsPersistentEffects;