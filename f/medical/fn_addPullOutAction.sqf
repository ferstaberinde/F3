#include "\a3\functions_f_mp_mark\Revive\defines.inc"

if (!hasInterface) exitWith {};

params ["_vehicle"];

private _actionId = _vehicle getVariable ["#revPullOutAction", -1];

// Vehicle already has a pull out action, don't try to add another
if (_actionId != -1) exitWith {};

// Code to run when the hold-action completes
private _action = {
	params ["_target"];
	
	{
		private _unit = _x;
		
		// Pull the unit out if they are down
		if (IS_DISABLED(_unit)) then {
			[_unit] remoteExec ["f_fnc_pullOutUnit", _unit];
		}
	} forEach crew _target;
};

_actionId = [
	_vehicle,
	"Pull out wounded",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",
	"(_this distance _target < 5) && {[_target] call f_fnc_vehicleHasWounded}",
	"(_caller distance _target < 5) && {[_target] call f_fnc_vehicleHasWounded}",
	{},
	{},
	_action,
	{},
	[],
	5,
	1000,
	false,
	false
] call BIS_fnc_holdActionAdd;

_vehicle setVariable ["#revPullOutAction", _actionId];