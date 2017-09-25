#include "\a3\functions_f_mp_mark\Revive\defines.inc"

// ====================================================================================
params ["_unit", "_dragger"];

// Wait until the unit is released, dead or downed, or revived)
waitUntil {
	sleep 0.1;
	_dragged_unit =  _dragger getVariable ["f_wound_dragging",nil];
	(
		isNil "_dragged_unit" //unit is released
		|| !(_unit getVariable ["f_wound_being_dragged", false])
		|| !alive _dragger   // dragger died
		|| GET_STATE(_unit) != STATE_INCAPACITATED // unit isn't incapacitated anymore
		|| GET_STATE(_dragger) == STATE_INCAPACITATED // dragger is incapacitated
		|| IS_BEING_REVIVED(_unit) // someone else is reviving the unit
		|| !alive _unit
		|| !alive _dragger
		|| !(isPlayer _dragger)
		|| !(isPlayer _unit)
	)
};

_dragger setVariable ["f_wound_dragging", nil, true];
_unit    setVariable ["f_wound_being_dragged", false, true];
detach _unit;
_unit setPosATL getposATL _dragger;
if( GET_STATE(_dragger) == STATE_INCAPACITATED ) then {
	_dragger switchMove ANIM_WOUNDED;
} else {
	_dragger switchMove "";
};
