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

// Main loop to detect whether the action should be displayed

while {true} do {

	// If targeted unit is a player and infantry
	if (isPlayer cursorTarget && {player distance cursorTarget < _actionDistance && cursorTarget isKindOf "CAManBase"}) then {
		_nearUnit = cursorTarget;
		_nearGroup = group cursorTarget;

		// Using curly braces makes the if statement cheaper to evaluate
		if (group player != _nearGroup && {alive _nearUnit && _nearUnit == leader _nearGroup}) then {
			if (_allowDifferentSide || side player == side _nearGroup) then {

				_actionString = format["Join %1's group", name _nearUnit];

				f_groupJoinAction = player addAction [_actionString, {

					_unit = player;
					_grp = (_this select 3);

					// Player joins new group
					[player] joinSilent _grp;

					//Display notifications about new group member to the whole group
					["JIP",[format ["You have joined %1's group.",name leader _grp]]] call BIS_fnc_showNotification;
					[["JIP",[format ["%1 has joined your group.",name _unit]]],"BIS_fnc_showNotification",(units _grp - [_unit])] spawn BIS_fnc_MP;

					// Make sure the group leader is synchronized properly accross the network
					[[_nearGroup, leader _nearGroup], "selectLeader", leader _nearGroup, false] call BIS_fnc_mp;

					player removeAction f_groupJoinAction;
				}, _nearGroup, 0, false, true, "", "_this == player"];

				// Once player leaves the group leader's vicinity, remove action
				waitUntil {sleep 0.1;player distance _nearUnit > _actionDistance};

				sleep _actionGraceTime;
				if !(isNil "f_groupJoinAction") then {
					player removeAction f_groupJoinAction;
				};
			};
		};
	};
	sleep 1;
};