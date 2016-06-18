// F3 - Mission Conditions
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SCRIPT SHOULD ONLY RUN ON SERVER

if (!isServer) exitWith {};

// ====================================================================================

// SET WEATHER
// Set the mission weather according to params. If the fog and wind override params
// are set, then prevent setWeather from setting them and set them manually instead.

[f_param_weather,f_param_fog == 4,f_param_wind == 4] call f_fnc_setWeather;

if (f_param_fog != 4) then {
	[f_param_fog] call f_fnc_setFog;
};

if (f_param_wind != 4) then {
	[f_param_wind] call f_fnc_setWind;
};

// ====================================================================================
