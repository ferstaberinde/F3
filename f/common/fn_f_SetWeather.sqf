// F3 - SetWeather
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
_overCast = _this select 0;
_fog = _this select 1;
_rain = _this select 2;
0 setOvercast _overCast;
0 setFog _fog;
0 setRain _rain;
simulSetHumidity 1;
simulWeatherSync;
sleep 0.1;
skiptime 1;
sleep 0.1;
simulSetHumidity 1;
simulWeatherSync;