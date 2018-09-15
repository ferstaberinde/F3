#include "\a3\functions_f_mp_mark\Revive\defines.inc"

params ["_unit"];

if (!hasInterface) exitWith {};
waitUntil {sleep 0.1; !isNull player};
if (_unit == player) exitWith {};
if (_unit getVariable ["#revDragId", -1] != -1) exitWith {};

private _drag_action_cond = str {
	//_target (object to which action is attached to)
	// _this (caller/executing person)
	_target distance _this < 2 && {
		GET_STATE(_target) == STATE_INCAPACITATED && {
			!(_target getVariable ['f_wound_being_dragged',false])
		}
	}
};
//hacky method to remove the braces at the beginning and end, so that it's the format that addAction expects.
_drag_action_cond = _drag_action_cond select [1, count _drag_action_cond - 2];

private _drag_exec_code = {
	params [
		["_target", objNull, [objNull]],
		["_caller", objNull, [objNull]],
		["_ID", -1, [0]],
		["_arguments", nil]
	];
	 _this remoteExec ["f_fnc_OnDrag", [_caller]]; //Dragger
	 _this remoteExec ["f_fnc_OnDrag", [_target]]; //Target
};

private _resultId = _unit addAction [
	format ["Drag %1", name _unit],

	// "_this" variable (in the code below) is: [target, caller, ID, arguments]
	_drag_exec_code,
	nil,
	6,
	false,
	true,
	"",
	_drag_action_cond
];
_unit setVariable ['#revDragId', _resultId];
