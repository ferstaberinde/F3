// F3 - Casualties Cap
// Credits and documentation: https://github.com/folkarps/F3/wiki
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

private ["_grps","_started","_remaining","_alive","_grp", "_Tgrp"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables.
// Up to 5 variables are passed to the script:
// The last two variables are optional, and may not be passed to the script.
// 0: = Side (e.g. BLUFOR), or group name(s) as string array (e.g. ["mrGroup1","myGroup2"])
// 1: = What % of the initial *number* of units must be dead before the ending is triggered. Takes JIP players into account
// 2: = What ending will be executed. Can also be code.
// 3: = If only groups with a playable leader slot will be included (default is true)
// 4: = What faction(s) to filter for if the first variable is a side  (e.g. ["blu_f"])

params [
    ["_grpstemp", sideUnknown, [sideUnknown,[]]],
    ["_pc", 100, [0]],
    ["_end", 1, [0,{}]],
    ["_onlyPlayers", true, [true]],
    ["_faction",[], [[]]]
];

// ====================================================================================

// COLLECT GROUPS TO CHECK
// If a side variable was passed we collect all relevant groups

_grps = [];

// Local function to collect groups to consider for CasCap in a JIP-safe manner
private _collectSideGroups = {
    params [
        ["_side", sideUnknown, [sideUnknown]],
        ["_onlyPlayable", true, [true]],
        ["_factions",[], [[]]]
    ];
    // Do all checks in one loop through array to help performance since this is run multiple times
    // Select all the groups where:
    // * The group's side == _side
    // AND
    // * _onlyPlayable -> the group's leader is a playable unit (logical implication)
    // AND
    // * length _factions != 0 -> the group's leader is in _factions (logical implication)
    allGroups select {side _x == _side &&
        ((not _onlyPlayable) || (leader _x in playableUnits)) &&
        ((count _factions == 0) || (([leader _x] call f_fnc_virtualFaction) in _factions))
    };
};

if(_grpstemp isEqualType sideUnknown) then // if the variable is any of the side variables use it to consturct a list of groups in that faction.
{
    _grps = [_grpstemp, _onlyPlayers, _faction] call _collectSideGroups;
}
else
{
    sleep 1;
    {
        _Tgrp = call compile format ["%1",_x];
        if(!isNil "_Tgrp") then
        {
            _grps pushBack _Tgrp;
        };
    } forEach _grpstemp;
};

// ====================================================================================

// FAULT CHECK
// 10 seconds into the mission we check if any groups were found. If not, exit with an error message

sleep 10;

if (count _grps == 0) exitWith {
    player globalChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): No groups found, _grpstemp = %1, _grps = %2",_grpstemp,_grps];
};

// ====================================================================================

// CREATE STARTING VALUES
// A initial count is made of units in the groups listed in _grps.
_started = count (flatten (_grps apply {units _x}));

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
    // Update the list of groups to account for JIP players
    if(_grpstemp isEqualType sideUnknown) then
    {
        _grps = [_grpstemp, _onlyPlayers, _faction] call _collectSideGroups;
    };

    // Calculate how many units in the groups are still alive
    _remaining = {alive _x} count (flatten (_grps apply {units _x}));

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

if (_end isEqualType 0) exitWith {
    [_end] call f_fnc_mpEnd;
};

if (_end isEqualType {}) exitWith {
    _end remoteExec ["bis_fnc_spawn", 0];
};

player globalChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): Ending didn't fire, should either be code or scalar. _end = %1, typeName _end: %2",_end,typeName _end];
