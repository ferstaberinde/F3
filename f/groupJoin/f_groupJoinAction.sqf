// F3 - Add group join option to action menu
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// This script can be called either without parameters, or with a single boolean parameter.
// The boolean indicates whether players are allowed to join groups on different side.

// Only run this for players
if (!hasInterface) exitWith {};

// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

private ["_nearUnit", "_nearGroup", "_actionDistance", "_actionString", "_unit", "_grp"];

// How many meters player needs to be from another group's leader for the join action to be shown
_actionDistance = 2.5;

// Check if script caller wants to enable joining of groups on different sides, default to false
params [["_allowDifferentSide", false, [false]]];

// Main loop to detect whether the action should be displayed
while {true} do {

	// Only proceed if the action does not exist
	waitUntil {sleep 0.5; isNil "f_groupJoinAction"};

	// If player is not on board of a vehicle and the targeted unit is a player and infantry
	if (vehicle player == player && {isPlayer cursorTarget && player distance cursorTarget < _actionDistance && cursorTarget isKindOf "CAManBase"}) then {
		_nearUnit = cursorTarget;
		_nearGroup = group cursorTarget;

		// Using curly braces makes the if statement cheaper to evaluate
		if (group player != _nearGroup && alive _nearUnit && {(_allowDifferentSide || side player == side _nearGroup)}) then {

			_actionString = format["Join %1 (%2)", name _nearUnit,_nearGroup];

			f_groupJoinAction = player addAction [_actionString, {
				params [
					["_target", objNull, [objNull]],
					["_caller", objNull, [objNull]],
					["_ID", -1, [0]],
					["_grp", grpNull, [grpNull]]
				];

				_unit = player;

				// Player joins new group
				[player] joinSilent _grp;

				//Display notifications about new group member to the whole group
				["GroupJoin",[format ["You have joined %1 (%2).",name leader _grp,_grp]]] call BIS_fnc_showNotification;

				{
					if (isPlayer _x) then {["GroupJoin",[format ["%1 has joined your group.",name _unit]]] remoteExec ["BIS_fnc_showNotification", _x]};
				} forEach (units _grp - [_unit]); // Done using a forEach loop to avoid message spam should the group leader be controlling AI

				// Make sure the group leader is synchronized properly accross the network
				[_grp, leader _grp] remoteExec ["selectLeader", leader _grp];

				// Remove and reset the action after executing it
				player removeAction f_groupJoinAction;
				f_groupJoinAction = nil;
			}, _nearGroup, 0, false, true, "", "_this == player"];

			// Wait until the player is not facing the unit or has joined the group
			waitUntil {sleep 0.5;(group player == _nearGroup || cursorTarget != _nearUnit)};

			// Remove and reset the action if it's still present
			if !(isNil "f_groupJoinAction") then {
				player removeAction f_groupJoinAction;
				f_groupJoinAction = nil;
			};
		};
	};
};
