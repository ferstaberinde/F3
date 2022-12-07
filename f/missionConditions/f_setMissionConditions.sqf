// F3 - Mission Conditions
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// SET CONDITIONS
// Set the mission conditions (weather and time) according to params.

// ONLY SET CONDITIONS ON THE SERVER
if (isServer) then {
	private _weatherParams = [f_param_weather, f_param_fog == 4, f_param_wind == 4] call f_fnc_setWeather;
	if (isNil "_weatherParams") then {
		f_var_conditions_params = [date, overcast, rain, lightnings, waves, windStr, fogParams];
	} else {
		f_var_conditions_params = [date] + _weatherParams;
	};

	// Fix for date sometimes returning wrong minute
	f_var_conditions_params#0 set [3,floor (dayTime + (.5/60))];
	f_var_conditions_params#0 set [4,floor ((dayTime%1)*60+.5)];

	private _fogParams = [f_param_fog] call f_fnc_setFog;
	if (!isNil "_fogParams") then {
		f_var_conditions_params set [6,_fogParams];
	};

	private _windParams = [f_param_wind] call f_fnc_setWind;
	if (!isNil "_windParams") then {
		f_var_conditions_params set [5,_windParams];
	};

	private _dateParams = [f_param_timeOfDay,f_param_timeOfYear] call f_fnc_setTime;
	if (!isNil "_dateParams") then {
		f_var_conditions_params set [0,_dateParams];
	};

	// STORE CONDITIONS PARAMETERS
	// Store all starting mission condition parameters in a global variable for later reference
	// array format - [[year,month,day,hour,minute],overcast,rain,lightnings,waves,windStr,[fogStr,fogDecay,fogBase]]
	publicVariable "f_var_conditions_params";
};

// ====================================================================================


// RUN CONDITIONS BRIEFING AND COLD BREATH ON CLIENTS ONLY
if (hasInterface) then {
	// Wait until server publishes the mission conditions
	waitUntil {!isNil "f_var_conditions_params"};

	// GENERATE CONDITION NOTES
	// Adds a briefing entry that summarizes the mission conditions
	[] execVM "f\missionConditions\f_conditionNotes.sqf";

	// Wait until the mission has started - ambient temperature takes a tick to update
	sleep 0.1;

	// COLD BREATH
	// Cold breath particle spawner for if it's snowing, or in low ambient temperatures
	if (rainParams select 15 || (ambientTemperature select 0) < 6) then {
		[] spawn f_fnc_coldBreath;
	};
};
