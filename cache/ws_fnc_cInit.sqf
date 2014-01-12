/*
ws_fnc_cache
based on Black Mamba's work, which in turn is based on Nou and Jaynus' work. (All credit to them)

FEATURE
Caches groups.

USAGE
[min caching distance,sleep] call ws_fnc_cInit in init.sqf or unit init

To exclude a group from being cached:
group this setVariable ["ws_cacheExcl",true] in unit init

PARAMETERS
1. | OPTIONAL - default is 1500
2. | OPTIONAL - default is 5 seconds

RETURNS
true
*/

if !isDedicated then {
        group player setVariable ["ws_cacheExcl", true, true];
};
if !(isServer) exitWith {};
if (missionNameSpace getVariable ["ws_Track", false]) exitWith {};
ws_Track = true;
waituntil {!isnil "bis_fnc_init"};

_groups = allGroups;
if (count _this > 0) then {_range = _this select 0} else {_range = missionNameSpace getVariable ["ws_cacheRange", 1500];};
if (count _this > 1) then {_sleep = _this select 1} else {_sleep = missionNameSpace getVariable ["ws_cacheSleep", 5];};


[_groups, _range, sleep] spawn ws_fnc_cTracker;

true