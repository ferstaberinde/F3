// F3 - Buddy Team Colours
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!hasInterface) exitWith {};

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// SET CUSTOM VARIABLES
// These variables govern the behaviour of the script

// Colors will be set for groups of leaders with these suffixes
private _leaders = ["_FTL"];

// Set suffixes for each color
private _white = [];
private _red = ["_AT","_R1","_R2"];
private _blue = ["_AR1","_AR2","_FTL"];
private _yellow = [];
private _green = [];

// ====================================================================================

// WAIT UNTIL 10 SECONDS AFTER INITIALIZING

sleep 10;

private _unit = player;
private _isFireteam = false;

// ====================================================================================

// CHECK GROUP SIZE
// If the group isn't a full fireteam, leave teams as default.

{
	if ([_x, format["%1",(leader (group _unit))]] call BIS_fnc_inString) exitWith {_isFireteam = true;}
} forEach _leaders;

if(!_isFireteam) exitWith {};

// SET TEAM COLOURS
{
	_unit = _x;
	_unitStr = str _x;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "RED";
		};
	} forEach _red;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "blue";
		};
	} forEach _blue;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "yellow";
		};
	} forEach _yellow;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "green";
		};
	} forEach _green;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "white";
		};
	} forEach _white;

} forEach units (group _unit);
