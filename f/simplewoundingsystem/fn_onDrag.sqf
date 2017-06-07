// F3 - SimpleWoundingSystem

// ====================================================================================
#include "\a3\functions_f_mp_mark\Revive\defines.inc"

params ["_unit", "_dragger"];

_dragger setVariable ["f_wound_dragging", _unit, true];
_unit    setVariable ["f_wound_being_dragged", true, true];

private _actionIdx = -1;

//TODO wait until animation ANIM_WOUNDED??

// the dragger gets a release option.
if(local _dragger) then {
	_this remoteExec ["f_fnc_onDragServer", 2];

	_actionIdx = _dragger addAction [format["Release %1",name _unit],{(_this select 1) setVariable ["f_wound_dragging",nil,true];(_this select 1) removeAction (_this select 2);}, nil, 6, false, true, "", "true"];

	//switch (currentWeapon _dragger) do {
	//	case (primaryWeapon _dragger): {
	//		_dragger playMoveNow "acinpknlmstpsraswrfldnon";
	//	};
	//	case (secondaryWeapon _dragger): {
	//		_dragger playMoveNow "AcinPknlMstpSnonWnonDnon";
	//	};
	//};                  acinpknlmstpsraswrfldnon
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
waitUntil {
	sleep 0.1;
	_dragged_unit =  _dragger getVariable ["f_wound_dragging",nil];
	(
		isNil "_dragged_unit" //unit is released
		|| !(_unit getVariable ["f_wound_being_dragged", false])
		|| GET_STATE(_unit) != STATE_INCAPACITATED // unit isn't incapacitated anymore
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
_unit setPosATL getposATL _dragger;
/*
_unit    switchmove ""; //otherwise player might get stuck
_dragger switchmove ""; //otherwise player might get stuck
*/
/*
//Animations:
if( GET_STATE(_dragger) != STATE_INCAPACITATED && GET_STATE(_dragger) != STATE_DEAD) then {
	_unit switchMove "AinjPpneMstpSnonWrflDb_release";
};

sleep 0.1;
*/
if( GET_STATE(_unit) == STATE_INCAPACITATED ) then {
	//_unit switchMove ANIM_WOUNDED;
	_unit switchMove ANIM_WOUNDED;
} else {
	//_unit switchMove "amovppnemstpsraswrfldnon";
	//_unit switchmove "amovppnemstpsraswrfldnon"
	_unit switchMove "";
};
/*
if( GET_STATE(_dragger) == STATE_INCAPACITATED ) then {
	_dragger switchMove ANIM_WOUNDED;
} else {
	//_dragger switchMove "";
	_dragger switchMove "";
};
*/
