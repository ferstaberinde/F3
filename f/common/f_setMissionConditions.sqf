// F3 - Mission Conditions Selector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_timeOfDay","_weather","_MissionOvercast","_MissionRain","_MissionRainbow","_MissionLightnings","_MissionWindStr","_MissionWindGusts","_MissionFog","_MissionWaves"];

// ====================================================================================

// WAIT FOR PARAMSARRAY TO BE PROCESSED

waitUntil {scriptDone f_processParamsArray};

// ====================================================================================

// SET KEY VARIABLES
// Conditions are set in the parameters screen (during mission set-up).

_timeOfDay = f_param_timeOfDay;

// WARNING: WEATHER PARAMETER IS DISABLED UNTIL CERTAIN ARMA 3 COMMANDS ARE FIXED
// _weather = f_param_weather;

// ====================================================================================

// SELECT MISSION TIME OF DAY
// Using the value of _timeOfDay, a new date is set.

switch (_timeOfDay) do
{
// Dawn
	case 0:
	{
		setDate [2007, 5, 11, 4, 20];
	};
// Early Morning
	case 1:
	{
		setDate [2007, 5, 11, 5, 50];
	};
// Morning
	case 2:
	{
		setDate [2007, 5, 11, 9, 00];
	};
// Noon
	case 3:
	{
		setDate [2007, 5, 11, 12, 0];
	};
// Afternoon
	case 4:
	{
		setDate [2007, 5, 11, 15, 00];
	};
// Evening
	case 5:
	{
		setDate [2007, 5, 11, 17, 50];
	};
// Dusk
	case 6:
	{
		setDate [2007, 5, 11, 19, 30];
	};
// Night
	case 7:
	{
		setDate [2007, 5, 11, 0, 0];
	};
};

// ====================================================================================

// SELECT MISSION WEATHER
// Using the value of _weather, values for _MissionOvercast and _MissionFog are set.

switch (_weather) do
{
// Clear (Calm)
	case 0:
	{
		_MissionOvercast = 0;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0;
		_MissionWindGusts = 0;
		_MissionFog = 0;
		_MissionWaves = 0.1;
	};
// Clear (Light Winds)
	case 1:
	{
		_MissionOvercast = 0;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.25;
		_MissionWindGusts = 0.5;
		_MissionFog = 0;
		_MissionWaves = 0.25;
	};
// Clear (Strong Winds)
	case 2:
	{
		_MissionOvercast = 0;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.75;
		_MissionWindGusts = 1;
		_MissionFog = 0;
		_MissionWaves = 0.75;
	};
// Overcast (Calm)
	case 3:
	{
		_MissionOvercast = 0.6;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0;
		_MissionWindGusts = 0;
		_MissionFog = 0;
		_MissionWaves = 0.1;
	};
// Overcast (Light Winds)
	case 4:
	{
		_MissionOvercast = 0.6;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.25;
		_MissionWindGusts = 0.5;
		_MissionFog = 0;
		_MissionWaves = 0.25;
	};
// Overcast (Strong Winds)
	case 5:
	{
		_MissionOvercast = 0.6;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.75;
		_MissionWindGusts = 1;
		_MissionFog = 0;
		_MissionWaves = 0.75;
	};
// Rain (Light Winds)
	case 6:
	{
		_MissionOvercast = 0.8;
		_MissionRain = 0.75;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.25;
		_MissionWindGusts = 0.5;
		_MissionFog = 0;
		_MissionWaves = 0.75;
	};
// Rain (Strong Winds)
	case 7:
	{
		_MissionOvercast = 0.8;
		_MissionRain = 0.75;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0.75;
		_MissionWindGusts = 1;
		_MissionFog = 0;
		_MissionWaves = 0.75;
	};
// Storm
	case 8:
	{
		_MissionOvercast = 1;
		_MissionRain = 1;
		_MissionRainbow = 0;
		_MissionLightnings = 1;
		_MissionWindStr = 1;
		_MissionWindGusts = 1;
		_MissionFog = 0;
		_MissionWaves = 1;
	};
// Light Fog
	case 9:
	{
		_MissionOvercast = 0.25;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0;
		_MissionWindGusts = 0;
		_MissionFog = 0.9;
		_MissionWaves = 0;
	};
// Heavy Fog
	case 10:
	{
		_MissionOvercast = 0.8;
		_MissionRain = 0;
		_MissionRainbow = 0;
		_MissionLightnings = 0;
		_MissionWindStr = 0;
		_MissionWindGusts = 0;
		_MissionFog = 1;
		_MissionWaves = 0;
	};
};

// ====================================================================================

// ENABLE DEBUG MODE
// If either _timeOfDay or _weather is set to 99, debug mode is enabled; in this case
// conditions are set to Noon, Clear.

// if ((_timeOfDay == 99) || (_weather == 99)) then 
// {
// 	setDate [2007, 5, 11, 12, 0];
//  	_MissionOvercast = 00.00;
// 	_MissionFog = 00.00;
// };

// ====================================================================================

// SET MISSION CONDITIONS
// Use new values for _MissionTime, _MissionOvercast and _MissionFog to set
// mission conditions on server and all clients (including JIP clients).

// WARNING: WEATHER PARAMETER IS DISABLED UNTIL CERTAIN ARMA 3 COMMANDS ARE FIXED
// 0 setOvercast _MissionOvercast;
// 0 setRain _MissionRain;
// 0 setRainbow _MissionRainbow;
// 0 setLightnings _MissionLightnings;
// 0 setWindStr _MissionWindStr;
// 0 setGusts _MissionWindGusts;
// 0 setFog _MissionFog;
// 0 setWaves _MissionWaves;

// DEBUG
// if (f_var_debugMode == 1) then
// {
// 	player sideChat format ["DEBUG (f\common\f_setMissionConditions.sqf): _MissionOvercast: %1",_MissionOvercast];
// 	player sideChat format ["DEBUG (f\common\f_setMissionConditions.sqf): _MissionRain: %1",_MissionRain];
// 	player sideChat format ["DEBUG (f\common\f_setMissionConditions.sqf): _MissionRainbow: %1",_MissionRainbow];
// 	player sideChat format ["DEBUG (f\common\f_setMissionConditions.sqf): _MissionLightnings: %1",_MissionLightnings];
// 	player sideChat format ["DEBUG (f\common\f_setMissionConditions.sqf): _MissionWindStr: %1",_MissionWindStr];
// 	player sideChat format ["DEBUG (f\common\f_setMissionConditions.sqf): _MissionWindGusts: %1",_MissionWindGusts];
// 	player sideChat format ["DEBUG (f\common\f_setMissionConditions.sqf): _MissionFog: %1",_MissionFog];
// 	player sideChat format ["DEBUG (f\common\f_setMissionConditions.sqf): _MissionWaves: %1",_MissionWaves];
// };

sleep 10;

// ====================================================================================

// WEATHER SYNCHRONIZATION
// Every 10 seconds the weather on the server client is broadcasted to all player clients to keep weather in sync.

// f2_weather = [_MissionOvercast, _MissionRain, _MissionFog];

// "f2_weather" addPublicVariableEventHandler 
// { 
// 	_overcast 	= (_this select 1) select 0;
//	_rain 		= (_this select 1) select 1;
//	_fog 		= (_this select 1) select 2;
//	
//	10 setOvercast _overcast;
//	10 setRain _rain;
//	10 setFog _fog;
// }; 
//
// if (isServer) then 
// {
//	while {true} do
//	{
//		f2_weather = [overcast, rain, fog];
//		publicVariable "f2_weather";
//	
//		sleep 10;
//	};
// };

// ====================================================================================

if (true) exitWith {};