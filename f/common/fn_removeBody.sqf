// F3 - Automatic Body Removal
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_body","_wait","_group","_distance","_pos","_nearPlayers","_nearUnits","_check"];

// ====================================================================================

// SET KEY VARIABLES
// The body to remove is passed to this script by the event handler itself. The time to sleep and minimal distance to remove are defined by global variables

_body = _this;
_group = group _this;

if (isNil "f_removeBodyDelay") then {f_removeBodyDelay = 20};
if (isNil "f_removeBodyDistance") then {f_removeBodyDistance = 50};

_wait = f_removeBodyDelay;
_distance = f_removeBodyDistance;

waitUntil  {!isNull _body};

_pos = getPos _body;
_nearPlayers = [objNull];

// ====================================================================================

// WAITING UNTIL ALL CONDITIONS ARE MET
// While there's at least 1 player within the minimal radius around the body the script sleeps the designated time.

_loop = true;
while {_loop} do {
	sleep _wait;
	_loop = [_body,_distance] call f_fnc_nearPlayer;
};


// ====================================================================================

// REMOVE BODY
// Remove the body from the game

deleteVehicle _body;

// ====================================================================================

// REMOVE BODY'S GROUP IF EMPTY
// We wait a while to make sure the body has been removed from the group. Then we count the living units in it and remove the group if it is empty
sleep 30;
_check = count (units (_group));
if (_check == 0) then {deleteGroup _group};


if (true) exitWith {};
