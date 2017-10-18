#include "\a3\functions_f_mp_mark\Revive\defines.inc"


params ["_unit", "_dragger"];

_dragger setVariable ["f_wound_dragging", _unit, true];
_unit    setVariable ["f_wound_being_dragged", true, true];


if (f_param_debugMode == 1) then {
    diag_log format ["receiving drag on %1, being dragged by %2", _unit, _dragger];
};

_unit attachTo [_dragger, [0, 1.1, 0.092]];
_unit setDir 180;
_unit setPos getPos _unit;

//setting these here to prevent race cconditions
_dragger setVariable ["f_wound_dragging", _unit, false];
_unit    setVariable ["f_wound_being_dragged", true, false];


// Wait until the unit is released, dead, downed, or revived)
waitUntil {
	sleep 0.1;
	_dragged_unit =  _dragger getVariable ["f_wound_dragging",nil];
	(
		isNil "_dragged_unit" //unit is released
		|| !(_unit getVariable ["f_wound_being_dragged", false])
		|| GET_STATE(_unit) != STATE_INCAPACITATED // unit isn't incapacitated anymore
		|| GET_STATE(_dragger) == STATE_INCAPACITATED // dragger is incapacitated
		|| IS_BEING_REVIVED(_unit) // someone else is reviving the unit
		|| !alive _unit
		|| !alive _dragger
		|| !(isPlayer _dragger)
		|| !(isPlayer _unit)
		|| (vehicle _dragger != _dragger)
	)
};

_dragger setVariable ["f_wound_dragging", nil, true];
_unit    setVariable ["f_wound_being_dragged", false, true];

if (f_param_debugMode == 1) then {
    diag_log format ["releasing unit on target"];
};
