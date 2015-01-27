// F3 - Caching Script Init
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Check whether the paramater is defined (or caching switched off)) - if not, just exit
if (isNil "f_param_caching" || {f_param_caching == 0}) exitWith {};

// ====================================================================================

// Wait for the mission to have launched before starting to cache.
sleep 0.1;

// Wait up to the desired time into the mission to give AI and players time to settle
waitUntil {time > (_this select 0)};

// ====================================================================================

// Player and the headless client's (if present) groups are always excluded from being cached
if (!isDedicated && !(group player getVariable ["f_cacheExcl", false])) then {
        (group player) setVariable ["f_cacheExcl", true, true];
};

// ====================================================================================

// Rest of the Script is only run server-side
if !(isServer) exitWith {};

// ====================================================================================

// Make sure script is only run once
if (missionNameSpace getVariable ["f_cInit", false]) exitWith {};
f_cInit = true;

// ====================================================================================

// All groups with playable units are set to be ignored as well
{
	if ({_x in playableUnits} count units _x > 0) then {_x setVariable ["f_cacheExcl",true,true];};
} forEach allGroups;

// Define parameters
_range = f_param_caching;	// The range outside of which to cache units
f_var_cacheSleep = 6; 		// The time to sleep between checking
f_var_cacheRun = true;

[_range] spawn f_fnc_cTracker;

// Start the debug tracker
if (f_var_debugMode == 1) then {
	player globalchat format ["f_fnc_cInit DBG: Starting to track %1 groups, %2 range, %3 sleep",count allGroups,_range,f_var_cacheSleep];

	[] spawn {

	// Giving the tracker a head start
	sleep (f_var_cacheSleep * 1.1);

		while {f_var_cacheRun} do {
			_str1 = "f_fnc_cache DBG:<br/>";
			_str2 = format["Total groups: %1<br/>",count allGroups];
			_str3 = format ["Cached groups:%1<br/>",{_x getvariable "f_cached"} count allGroups];
			_str4 = format ["Activated groups:%1<br/>",{!(_x getvariable "f_cached")} count allGroups];
			_str5 = format ["Excluded groups:%1<br/>",{(_x getvariable "f_cacheExcl")} count allGroups];

			hintsilent parseText (_str1+_str2+_str3+_str4+_str5);
			diag_log (_str1+_str2+_str3+_str4+_str5);

			sleep f_var_cacheSleep;
		};
	};
};