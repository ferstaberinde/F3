// FA3 - Dynamic View Distance
// ====================================================================================

// Parameters
// Note: _oldCameraOn, _newCameraOn, and _uav are only used for the PlayerViewChanged event.
params [
	["_unit", player, [objNull]],
	["_unit2_or_position", nil],
	["_veh", vehicle player, [objNull]],
	["_oldCameraOn", nil],
	["_newCameraOn", nil],
	["_uav", objNull, [objNull]]
];

private _vd = f_var_viewDistance_default;

private _isInCargo = _unit in assignedCargo _veh;

if (!(f_var_viewDistance_crewOnly && _isInCargo) && vehicle player != player) then
{
	if (_veh isKindOf "Car") then {_vd = f_var_viewDistance_car;};
	if (_veh isKindOf "Tank") then {_vd = f_var_viewDistance_tank;};
	if (_veh isKindOf "Helicopter_Base_F") then {_vd = f_var_viewDistance_rotaryWing;};
	if (_veh isKindOf "Plane") then {_vd = f_var_viewDistance_fixedWing;};
};
if (!(isNull _uav) && {unitIsUAV _uav }) then
{
	//Note: Helicopter_Base_F includes quadcopters/hexacopters as well as the bigger Falcon
	if (_uav isKindof "Land") then {_vd = f_var_viewDistance_car;};
	if (_uav isKindOf "Tank") then {_vd = f_var_viewDistance_tank;};
	if (_uav isKindOf "Helicopter_Base_F") then {_vd = f_var_viewDistance_rotaryWing;};
	if (_uav isKindOf "Plane") then {_vd = f_var_viewDistance_fixedWing;};
};

// if new viewDistance is different from the one in previous seat, change it, otherwise do nothing.
if (_vd != viewDistance) then
{
	setViewDistance _vd;
	
	if (f_param_debugMode == 1) then 
	{
		player sideChat format ["DEBUG (f\dynamicViewDistance\fn_ehSetViewDistance.sqf): Viewdistance set to %1",_vd];
	};
}
else 
{
	if (f_param_debugMode == 1) then 
	{
		player sideChat "DEBUG (f\dynamicViewDistance\fn_ehSetViewDistance.sqf): No Viewdistance change required";
	};
};
