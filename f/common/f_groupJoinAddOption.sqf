// F3 - Add group join option to action menu
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// This script can be called either without parameters, or with a single boolean parameter.
// The boolean indicates whether players are allowed to join groups on different side.

if (isDedicated) exitWith{};

#include "f_waitForJIP.sqf"

private ["_nearUnit", "_nearGroup", "_actionDistance", "_actionGraceTime", "_allowDifferentSide"];

// How many meters player needs to be from another group's leader for the join action to be shown
_actionDistance = 2.5;
// How many seconds the action is shown for when you leave group leader's range
_actionGraceTime = 3;
// Check if script caller wants to enable joining of groups on different sides, default to false
if (count _this > 0) then {
	_allowDifferentSide = _this select 0;
} else {
	_allowDifferentSide = false;
};

// If nearest unit is leader of a different group with playable units in it, add option to join that group
while {true} do {
	if (count (nearestObjects [player, ["Man"], _actionDistance] - [player]) > 0) then {
		_nearUnit = (nearestObjects [player, ["Man"], _actionDistance] - [player]) select 0;
		_nearGroup = group _nearUnit;

		// Using curly braces makes the if statement cheaper to evaluate, but requires OA 1.62
		if (alive _nearUnit && group player != _nearGroup && _nearUnit == leader _nearGroup && _nearUnit in playableUnits) then {
			if (_allowDifferentSide || side player == side _nearGroup) then {
				_actionString = format["Join group: %1", _nearGroup];
			
				f_groupJoinAction = player addAction [_actionString, "f\common\f_groupJoinAction.sqf", _nearGroup, 0, false, true, "", "_this == player"];

				// Once player leaves the group leader's vicinity, remove action
				waitUntil {player distance _nearUnit > _actionDistance};
				sleep _actionGraceTime;
				player removeAction (f_groupJoinAction);
			};
		};
	};
	sleep 1;
};