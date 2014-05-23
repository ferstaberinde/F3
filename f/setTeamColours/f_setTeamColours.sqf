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

private ["_unit","_isFireteam"];

// ====================================================================================

// WAIT UNTIL 10 SECONDS AFTER INITIALIZING

sleep 10;

// ====================================================================================

// SET KEY VARIABLES

_unit = player;

// ====================================================================================

// CHECK GROUP SIZE
// If the group isn't a full fireteam, leave teams as default.

if( (count (units (group _unit))) != 4 ) exitWith {};

_isFireteam = ["_FTL", format["%1",(leader (group _unit))]] call BIS_fnc_inString;
if(!_isFireteam) exitWith {};

// SET TEAM COLOURS

{
	if((["_AR", format ["%1", vehicle _x]] call BIS_fnc_inString) || (["_AAR", format ["%1", vehicle _x]] call BIS_fnc_inString)) then
	{
		_x assignTeam "BLUE";
	}
	else
	{
		_x assignTeam "RED";
	};
} foreach units (group _unit);
