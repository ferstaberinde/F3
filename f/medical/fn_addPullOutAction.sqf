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
			// Hack: Despite the wiki claiming 'moveOut' works on unconscious players, it doesn't
			// So make them conscious again until they are out
			_unit setUnconscious false;
			
			// Eject the downed player from the vehicle
			moveOut _unit;
			
			// Hack
			_unit setUnconscious true;
			
			// Move them away from the vehicle slightly once they are out
			[] spawn {
				sleep 0.2;
				(_unit) setPosATL (_unit getPos [0.6, direction _unit]);
			};
			
			// Make them draggable
			[_unit] spawn {
				params ["_unit"];
				waitUntil{ sleep 0.1; animationState _unit ==  "unconsciousrevivedefault"};
				_unit setVariable ["f_wound_draggable", true, true];
				waitUntil{ sleep 0.1; animationState _unit !=  "unconsciousrevivedefault"};
				_unit setVariable ["f_wound_draggable", false, true];
			};
		}
	} forEach crew _target;
};

_actionId = [
	_vehicle,
	"Pull out wounded",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"[_target] call f_fnc_vehicleHasWounded",
	"",
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