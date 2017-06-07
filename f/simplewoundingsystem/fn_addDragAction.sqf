#include "\a3\functions_f_mp_mark\Revive\defines.inc"

params ["_unit"];

if (!hasInterface) exitWith {};
waitUntil {sleep 0.1; !isNull player};
if (_unit == player) exitWith {};


//_target (object to which action is attached to)
// _this (caller/executing person)
//TODO CODE HAS TO BE A STRING
//TODO MAYBE {side group _this getFriend side group _target >= 0.6} (just like the bis revive thing)
private _drag_action_cond = str {
	_var = _this getVariable ['f_wound_dragging',nil];
	_target distance _this < 2 && {
		isNil '_var' && {
			GET_STATE(_target) == STATE_INCAPACITATED && {
				!(_target getVariable ['f_wound_being_dragged',false])
			}
		}
	}
};
//hacky method to remove the braces at the beginning and end, so that it's the format that addAction expects.
_drag_action_cond = _drag_action_cond select [1, count _drag_action_cond - 2];

_unit addAction [
	format ["Drag %1", name _unit],

	// _this variable (in the code below) is: [target, caller, ID, arguments]
	{ _this remoteExec ["f_fnc_OnDrag", [_this select 0,_this select 1]] }, //called for both players
	nil,
	6,
	false,
	true,
	"",
	_drag_action_cond
];
