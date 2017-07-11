// F3 - SimpleWoundingSystem
/*
//\
unit placement post drag
post drag revive problems
revive ragdoll drag

test:
dragger down
dragger dead


*/
// ====================================================================================
#include "\a3\functions_f_mp_mark\Revive\defines.inc"

params ["_unit", "_dragger"];

_dragger setVariable ["f_wound_dragging", _unit, true];
_unit    setVariable ["f_wound_being_dragged", true, true];

private _actionIdx = -1;

diag_log local _dragger;

// the dragger gets a release option.
if(local _dragger) then {
	_this remoteExec ["f_fnc_onDragServer", 2];

	_actionIdx = _dragger addAction [format["Release %1",name _unit],{(_this select 1) setVariable ["f_wound_dragging",nil,true];(_this select 1) removeAction (_this select 2);}, nil, 6, false, true, "", "true"];
	_dragger playMoveNow "AcinPknlMstpSnonWnonDnon";
};
//_unit switchMove "AinjPpneMrunSnonWnonDb";

if(local _unit) then
{
	// setup the unit and all that fun stuff.
	_unit attachTo [_dragger, [0, 1.1, 0.092]];
	_unit SetDir 180;
	_unit SetPos (getpos _unit);
};

// Wait until the unit is released, dead, downed, or revived)
diag_log "starting drag";
diag_log isNil "_dragged_unit";
diag_log !(_unit getVariable ["f_wound_being_dragged", false]);
diag_log GET_STATE(_unit) != STATE_INCAPACITATED;
diag_log GET_STATE(_dragger) == STATE_INCAPACITATED;
diag_log IS_BEING_REVIVED(_unit);
diag_log !alive _unit;
diag_log !alive _dragger;
diag_log !(isPlayer _dragger);
diag_log !(isPlayer _unit);
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
	)
};

// release unit.
if (_actionIdx != -1) then { _dragger removeAction _actionIdx; };

_dragger setVariable ["f_wound_dragging", nil, true];
_unit    setVariable ["f_wound_being_dragged", false, true];
detach _unit;
[_unit, _dragger] spawn {
    params ["_unit", "_dragger"];'

    _unit setPosATL (_unit getPos [1.2, direction _dragger]);
};
_dragger switchmove ""; //otherwise player might get stuck
