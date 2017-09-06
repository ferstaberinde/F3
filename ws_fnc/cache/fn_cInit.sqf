/*
ws_fnc_cache
Latest: 15.01.2014

based on Black Mamba's work, which in turn is based on Nou and Jaynus' work. (All credit to them)

FEATURE
Caches groups.

USAGE
[min caching distance,agressiveness,sleep] call ws_fnc_cInit;

To exclude a group from being cached:
a) In unit init: (group this) setVariable ["ws_cacheExcl",true];
b) Anywhere: Groupname setVariable ["ws_cacheExcl",true,true];

NOTE
It's recommended to wait up until a minute into the mission before launching the caching script to make sure that all AI have settled

PARAMETERS
1. Distance to players for units to be de-cached 				| OPTIONAL - default is 1000
2. Agressiveness of the caching									| OPTIONAL - default is 2
	1 - cache only non-leaders and non-drivers
	2 - cache all non-moving units, always exclude vehicle drivers
	3 - cache all units, incl. group leaders and vehicle drivers
3. Amount of seconds between distance-checks to player units	| OPTIONAL - default is 5 seconds

RETURNS
true
*/

// Player and the headless client's groups are always excluded from being cached
if (!isDedicated) then {
        group player setVariable ["ws_cacheExcl", true, true];
};

// Script is only run server-side
if !(isServer) exitWith {};

// Make sure script is only run once
if (missionNameSpace getVariable ["ws_cInit", false]) exitWith {};
ws_cInit = true;
waituntil {!isnil "bis_fnc_init"};

// All groups with playable units are set to be ignored as well
{
	if ({_x in playableUnits} count units _x > 0) then {_x setVariable ["ws_cacheExcl",true,true];};
} forEach allGroups;

// Define parameters
_range = if (count _this > 0) then [{_this select 0},{1000}];
ws_var_cachingAggressiveness = if (count _this > 1) then [{_this select 1},{2}];
_sleep = if (count _this > 2) then [{_this select 2},{6}];


[_range, _sleep] spawn ws_fnc_cTracker;

_debug = if !(isNil "ws_debug") then [{ws_debug},{false}];

if (_debug) then {
	["ws_fnc_cache DBG: Starting to track groups, range, sleep",[count allGroups,_range,_sleep],""] call ws_fnc_debugtext;

	[_sleep] spawn {

	// Giving the tracker a head start
	sleep (_this select 0 * 1.1);

		while {true} do {
			_str1 = "ws_fnc_cache DBG:<br/>";
			_str2 = format["Total groups: %1<br/>",count allGroups];
			_str3 = format ["Cached groups:%1<br/>",{_x getvariable "ws_cached"} count allGroups];
			_str4 = format ["Activated groups:%1<br/>",{!(_x getvariable "ws_cached")} count allGroups];
			_str5 = format ["Excluded groups:%1<br/>",{(_x getvariable "ws_cacheExcl")} count allGroups];

			hintsilent parseText (_str1+_str2+_str3+_str4+_str5);

			sleep (_this select 0);
		};
	};
};


true