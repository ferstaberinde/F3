/*
ws_fnc_cache
Latest: 15.01.2014

based on Black Mamba's work, which in turn is based on Nou and Jaynus' work. (All credit to them)

FEATURE
Caches groups.

USAGE
[min caching distance,sleep] call ws_fnc_cInit in init.sqf or unit init

To exclude a group from being cached:
a) In unit init: (group this) setVariable ["ws_cacheExcl",true];
b) Anywhere: Groupname setVariable ["ws_cacheExcl",true];

PARAMETERS
1. Distance to players for units to be de-cached 							| OPTIONAL - default is 1500
2. Amount of seconds between distance-checks to player units	| OPTIONAL - default is 5 seconds

RETURNS
true
*/

// Player groups are always excluded from being cached
if !isDedicated then {
        group player setVariable ["ws_cacheExcl", true, true];
};

// Script is run server-side
if !(isServer) exitWith {};

// Make sure script is only run once
if (missionNameSpace getVariable ["ws_Track", false]) exitWith {};
ws_Track = true;
waituntil {!isnil "bis_fnc_init"};

// Collect currently present groups
_groups = allGroups;

// Define parameters
_range = if (count _this > 0) then [{_this select 0},{1500}];
_sleep = if (count _this > 1) then [{_this select 1},{6}];

[_groups, _range, _sleep] spawn ws_fnc_cTracker;

if (ws_debug) then ["ws_fnc_cache DBG: Starting to track %1 groups, range:%2, sleep:%3 ",[count _groups,_range,_sleep],""] call ws_fnc_debugtext;

true