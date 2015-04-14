// F3 - Casualties Cap
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// WAIT FOR THE MISSION TO START
// A short sleep makes sure the script only starts once the mission is live

sleep 0.1;

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_grps","_pc","_end","_started","_remaining","_grpstemp","_alive","_faction","_temp_grp","_temp_grp2","_type","_onlyPlayers","_grpsno","_counter"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables.
// Up to 5 variables are passed to the script:
// 0: = Side (e.g. BLUFOR), or group name(s) as string array (e.g. ["mrGroup1","myGroup2"])
// 1: = What % of units must be dead before the ending is triggered
// 2: = What ending will be executed. Can also be code.

_grpstemp = _this select 0; // either SIDE or array with group strings
_pc = _this select 1;
_end = _this select 2;

// SET OPTIONAL VARIABLES
// The last two variables are optional, and may not be passed to the script.
// 3: = If only groups with a playable leader slot will be included (default is true)
// 4: = What faction(s) to filter for if the first variable is a side  (e.g. ["blu_f"])

_onlyPlayers = if (count _this > 3) then {_this select 3} else {true};
_faction = if (count _this > 4) then {_this select 4} else {[]};

// ====================================================================================

// COLLECT GROUPS TO CHECK
// If a side variable was passed we collect all relevant groups

_grps = [];

if(typeName _grpstemp == "SIDE") then // if the variable is any of the side variables use it to consturct a list of groups in that faction.
{

	{
		if(_onlyPlayers) then
		{
			if((side _x == _grpstemp) && (leader _x in playableUnits)) then
			{
				_grps set [count _grps,_x]; // Add group to array
			};
		}
		else
		{
			if (side _x == _grpstemp) then
			{
				_grps set [count _grps,_x]; // Add group to array
			};
		};

	} forEach allGroups;

	// Filter the created group array for the factions

	if(count _faction > 0) then
	{
		{
			if !(faction (leader _x) in _faction) then
			{
				_grps = _grps - [_x];
			};
		} forEach _grps;
	};
}
else
{
	sleep 1;
	{
		_Tgrp = call compile format ["%1",_x];
		if(!isnil "_Tgrp") then
		{
			_grps set [count _grps,_Tgrp];
		};
	} foreach _grpstemp;
};

// ====================================================================================

// FAULT CHECK
// 10 seconds into the mission we check if any groups were found. If not, exit with an error message

sleep 10;

if (count _grps == 0) exitWith {
	player GlobalChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): No groups found, _grpstemp = %1, _grps = %2",_grpstemp,_grps];
};

// ====================================================================================

// CREATE STARTING VALUES
// A count is made of units in the groups listed in _grps.

_started = 0;
{_started = _started + (count (units _x))} forEach _grps;

// DEBUG
if (f_param_debugMode == 1) then
{
	player sideChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): _started = %1",_started];
};

// ====================================================================================

// CHECK IF CASUALTIES CAP HAS BEEN REACHED OR EXCEEDED
// Every 6 seconds the server will check to see if the number of casualties sustained
// within the group(s) has reached the percentage specificed in the variable _pc. If
// the cap has been reached, the loop will exit to trigger the ending.

while {true} do
{
	_remaining = 0;

	// Calculate how many units in the groups are still alive
	{
	  _grp = _x;
	  _alive = {alive _x} count (units _grp);
	  _remaining = _remaining + _alive;
	} forEach _grps;

// DEBUG
	if (f_param_debugMode == 1) then
	{
		player sideChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): _remaining = %1",_remaining];
	};

	if (_remaining == 0 || ((_started - _remaining) / _started) >= (_pc / 100)) exitWith {};

	sleep 6;
};

// ====================================================================================

// END CASCAP
// Depending on input, either MPEnd or the parsed code itself is called

if (typeName _end == typeName 0) exitWith {
	[_end] call f_fnc_mpEnd;
};

if (typeName _end == typeName {}) exitWith {
	[_end,"bis_fnc_spawn",true] call BIS_fnc_MP;
};

player GlobalChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): Ending didn't fire, should either be code or scalar. _end = %1, typeName _end: %2",_end,typeName _end];