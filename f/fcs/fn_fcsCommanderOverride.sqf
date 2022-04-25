// F3 - FCS/Commander's Override system
// Credits and documentation: https://github.com/folkarps/F3/wiki
// Originally from: https://github.com/NikkoJT/njt_fcs (integrated with permission)

// This function is called when the commander issues a TC override from the action defined in fcs_init

params ["_vehicle","_caller"];

// If there's no valid target under the commander's crosshair, tell them and do nothing else
if (isNull cursorObject) then {
	["NO TARGET",1] remoteExec ["f_fnc_fcsOverrideLocalWarning",commander _vehicle];
} else {
	// Get the position of the centre of the targeted object at the time of the override
	_overrideTarget = (cursorObject modelToWorldWorld (boundingCenter cursorObject));
	// Order the gunner to aim their camera at the target position
	[_vehicle,[_overrideTarget,_vehicle unitTurret (gunner _vehicle),true]] remoteExec ["lockCameraTo",gunner _vehicle];
	// Display a HUD indicator for the gunner
	["TC OVERRIDE",2] remoteExec ["f_fnc_fcsOverrideLocalWarning",gunner _vehicle];
	// Handle cooldown on override
	_vehicle setVariable ["fcsCommanderOverride_cooldown",true,true];
	sleep 3;
	_vehicle setVariable ["fcsCommanderOverride_cooldown",false,true];
};