// F3 - Buddy Team Colours
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_unit","_isFireteam","_white","_red","_blue","_yellow","_green"];

// ====================================================================================

// SET CUSTOM VARIABLES
// These variables govern the behaviour of the script

// Colors will be set for groups of leaders with these suffixes
_leaders = ["_FTL"];

// Set suffixes for each color
_white = [];
_red = ["_AR","_AAR"];
_blue = ["_AT","_FTL"];
_yellow = [];
_green = [];

// ====================================================================================

// WAIT UNTIL 10 SECONDS AFTER INITIALIZING

sleep 10;

_unit = player;
_isFireteam = false;

// ====================================================================================

// CHECK GROUP SIZE
// If the group isn't a full fireteam, leave teams as default.

{
	if ([_x, format["%1",(leader (group _unit))]] call BIS_fnc_inString) exitWith {_isFireteam = true;}
} forEach _leaders;

if(!_isFireteam) exitWith {};

// SET TEAM COLOURS
{
	private ["_unit"];
	_unit = _x;

	{
		if ([_x, format ["%1",_unit]] call BIS_fnc_inString) then {
			_unit assignTeam "RED";
		};
	} forEach _red;

	{
		if ([_x, format ["%1",_unit]] call BIS_fnc_inString) then {
			_unit assignTeam "blue";
		};
	} forEach _blue;

	{
		if ([_x, format ["%1",_unit]] call BIS_fnc_inString) then {
			_unit assignTeam "yellow";
		};
	} forEach _yellow;

	{
		if ([_x, format ["%1",_unit]] call BIS_fnc_inString) then {
			_unit assignTeam "green";
		};
	} forEach _green;

	{
		if ([_x, format ["%1",_unit]] call BIS_fnc_inString) then {
			_unit assignTeam "white";
		};
	} forEach _white;

} foreach units (group _unit);