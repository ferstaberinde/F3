// F3 - SetWeather
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
_overCast = _this select 0;
_fog = _this select 1;
_rain = _this select 2;
_rainbow = _this select 3;
_windStr = _this select 4;
_windGus = _this select 5;
_waves = _this select 6;
_humid = _this select 7;
0 setOvercast _overCast;
0 setFog _fog;
0 setRain _rain;
0 setRainbow _rainbow;
0 setWindStr  _windStr;
0 setWindForce _windGus;
0 setWaves _waves;

simulWeatherSync;
skiptime 1;

simulWeatherSync;