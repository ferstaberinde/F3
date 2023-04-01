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

private ["_grps", "_side", "_factionsOnly", "_countAliveUnits", "_started", "_remaining"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables.
// Up to 5 variables are passed to the script:
// The last two variables are optional, and may not be passed to the script.
// 0: = Side (e.g. BLUFOR), or group name(s) as string array (e.g. ["mrGroup1","myGroup2"])
// 1: = What % of the initial *number* of units must be dead before the ending is triggered. Takes JIP players into account
// 2: = What ending will be executed. Can also be code.
// 3: = If in side mode, only playable units will be included (default is true)
// 4: = If in side mode, only units from these faction(s) will be included (e.g. ["blu_f"])

params [
    ["_sideorgrps", sideUnknown, [sideUnknown,[]]],
    ["_pc", 100, [0]],
    ["_end", 1, [0,{}]],
    ["_onlyPlayable", true, [true]],
    ["_factions",[], [[]]]
];

// ====================================================================================

// DEFINE LOCAL FUNCTIONS
// Define local functions to count the current units based on the mode: 'side' if a side was passed as the first argument, 'group' if a static list of groups was passed

if(_sideorgrps isEqualType sideUnknown) then
{
    // SIDE MODE

    _side = _sideorgrps;
	_factionsOnly = count _factions > 0;
	_countAliveUnits = {
	    private _eligibleUnits = if(_onlyPlayable) then {playableUnits} else {allUnits};
		private _filteredUnits = if(_factionsOnly) then
		{
		    _eligibleUnits select {(side _x == _side) && (([_x] call f_fnc_virtualFaction) in _factions)};
		}
		else
		{
		    _eligibleUnits select {side _x == _side};
		};
		{alive _x} count _filteredUnits;
	};
	
    // DEBUG
    if (f_param_debugMode == 1) then
    {
        systemChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): CasCap operating in SIDE mode. _side = %1, _onlyPlayable = %2, _factionsOnly = %3, _factions = %4",_side,_onlyPlayable,_factionsOnly,_factions];
    };
}
else
{
    // GROUP MODE

	// COLLECT GROUPS TO CHECK
	// If a groups variable was passed we collect all relevant groups
	
	_grps = [];

    sleep 1;
    {
        private _Tgrp = call compile format ["%1",_x];
        if(!isNil "_Tgrp") then
        {
            _grps pushBackUnique _Tgrp;
        };
    } forEach _sideorgrps;
	
	// FAULT CHECK
    // Check if any groups were found. If not, exit with an error message

    if (count _grps == 0) exitWith {
        systemChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): No groups found, _sideorgrps = %1, _grps = %2",_sideorgrps,_grps];
    };

    _countAliveUnits = {
        {alive _x} count (flatten (_grps apply {units _x}));
    };
	
	// DEBUG
    if (f_param_debugMode == 1) then
    {
        systemChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): CasCap operating in GROUP mode. _grps = %1",_grps];
    };
};

// ====================================================================================

// CREATE STARTING VALUES
// A initial count is made of units in the groups listed in _grps.
_started = [] call _countAliveUnits;

// DEBUG
if (f_param_debugMode == 1) then
{
    systemChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): _started = %1",_started];
};

// ====================================================================================

// CHECK IF CASUALTIES CAP HAS BEEN REACHED OR EXCEEDED
// Every 6 seconds the server will check to see if the number of casualties sustained
// has reached the percentage specificed in the variable _pc. If
// the cap has been reached, the loop will exit to trigger the ending.

while {true} do
{
    // Call the local function to determine how many units are still alive
    _remaining = [] call _countAliveUnits;

    // DEBUG
    if (f_param_debugMode == 1) then
    {
        systemChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): _remaining = %1",_remaining];
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

systemChat format ["DEBUG (f\casualtiesCap\f_CasualtiesCapCheck.sqf): Ending didn't fire, should either be code or scalar. _end = %1, typeName _end: %2",_end,typeName _end];
