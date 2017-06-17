#include "\a3\functions_f_mp_mark\Revive\defines.inc"
// F3 - SimpleWoundingSystem

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

//_unit    switchmove ""; //otherwise player might get stuck
//_dragger switchmove ""; //otherwise player might get stuck

if( GET_STATE(_dragger) == STATE_INCAPACITATED ) then {
	_dragger switchMove ANIM_WOUNDED;
} else {
	//_dragger switchMove "";
	//_unit switchmove "amovppnemstpsraswrfldnon"
	_dragger switchMove "";
};
//if( GET_STATE(_unit) == STATE_INCAPACITATED ) then {
//	//_unit switchMove ANIM_WOUNDED;
//} else {
//	//_unit switchMove ANIM_OK;
//	//_dragger switchMove "";
//	_unit switchMove "";
//};
