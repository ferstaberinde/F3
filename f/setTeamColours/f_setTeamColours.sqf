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
private _colors = [
	["MAIN",   [] ],
	["RED",    ["_AT","_R1","_R2"] ],
	["BLUE",   ["_AR1","_AR2","_FTL"] ],
	["YELLOW", [] ],
	["GREEN",  [] ]
];

// ====================================================================================

// WAIT UNTIL 10 SECONDS AFTER INITIALIZING

sleep 10;

private _isFireteam = false;

// ====================================================================================

// CHECK GROUP SIZE
// If the group isn't a full fireteam, leave teams as default.

{
	if ((format["%1",(leader (group player))] find _x) != -1) exitWith {_isFireteam = true;}
} forEach _leaders;

if(!_isFireteam) exitWith {};

// Only run this for the group leader:
if((((units group player) select {isPlayer _x}) #0) != player) exitWith {};

// ====================================================================================

// SET TEAM COLOURS
{
	private _unit = _x;
	private _unitStr = str _unit;

	{
		_x params ["_color", "_suffixes"];
		{
			if ((_unitStr find _x) != -1) then {
				_unit assignTeam _color;
			};
		} forEach _suffixes;
	} forEach _colors;

} forEach units (group player);
