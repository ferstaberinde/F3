// F3 - Add group join option to action menu
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// This script can be called either without parameters, or with a single boolean parameter.
// The boolean indicates whether players are allowed to join groups on different side.

// Only run this for players
if (isDedicated) exitWith{};

// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

private ["_nearUnit", "_nearGroup", "_actionDistance", "_actionGraceTime", "_allowDifferentSide"];

// How many meters player needs to be from another group's leader for the join action to be shown
_actionDistance = 2.5;
// How many seconds the action is shown for when you leave group leader's range
_actionGraceTime = 3;

// Check if script caller wants to enable joining of groups on different sides, default to false
_allowDifferentSide = [_this,0,false] call bis_fnc_param;

// If nearest unit is leader of a different group with playable units in it, add option to join that group
while {true} do {
	if (count (nearestObjects [player, ["Man"], _actionDistance] - [player]) > 0) then {
		_nearUnit = (nearestObjects [player, ["Man"], _actionDistance] - [player]) select 0;
		_nearGroup = group _nearUnit;

		// Using curly braces makes the if statement cheaper to evaluate, but requires OA 1.62
		if (alive _nearUnit && group player != _nearGroup && _nearUnit == leader _nearGroup && _nearUnit in playableUnits) then {
			if (_allowDifferentSide || side player == side _nearGroup) then {
				_actionString = format["Join group: %1", _nearGroup];

				f_groupJoinAction = player addAction [_actionString, {
					[player] joinSilent (_this select 3);
					["JIP",[format ["You have joined %1.",(_this select 3)]]] call BIS_fnc_showNotification;
					_unit = player;
					{
						if (isPlayer _x) then {
							[["JIP",[format ["%1 has joined your group.",name _unit]]],"BIS_fnc_showNotification",_x] spawn BIS_fnc_MP;
						};
					} forEach (units (_this select 3) - [_unit]);
				}, _nearGroup, 0, false, true, "", "_this == player"];

				// Once player leaves the group leader's vicinity, remove action
				waitUntil {sleep 0.1;player distance _nearUnit > _actionDistance};
				sleep _actionGraceTime;
				player removeAction (f_groupJoinAction);
			};
		};
	};
	sleep 1;
};