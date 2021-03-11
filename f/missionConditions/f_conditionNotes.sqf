// F3 - Mission Condition briefing notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!hasInterface) exitWith {}; //Exit if not a player.

// Wait until server publishes the mission conditions
waitUntil { !isNil "f_var_conditions_params" };

f_var_conditions_params params ["_date","_overcast","_rain","_lightnings","_waves","_wind","_fogParams"];

private _diaryText = "";

// Start time & date
private _diaryText = _diaryText + format ["<font size='18'><font color='#aaaaaa'>Mission start time:</font> %1:%2</font><br/>",
	(if (_date#3 >=10) then {""} else {"0"}) + str (_date#3),
	(if (_date#4 >=10) then {""} else {"0"}) + str (_date#4)];

_diaryText = _diaryText + format ["<font size='18' color='#aaaaaa'>Mission date:</font> <font size='18'>%1 %2 %3</font><br/><br/>",
	_date#0,
	["","January","February","March","April","May","June","July","August","September","October","November","December"] select (_date#1),
	_date#2];


// Weather
private _overCastText = "Overcast";
if (_overcast < .8) then {_overCastText = "Mostly Cloudy"};
if (_overcast < .5) then {_overCastText = "Partly Cloudy"};
if (_overcast < .13) then {_overCastText = "Clear"};

private _rainText = "Heavy Rain";
if (_rain < .65) then { _rainText = "Rain" };
if (_rain < .3) then { _rainText = "Light Rain" };
if (_rain < .01 || _overcast < .5) then { _rainText = "No Precipitation" }; // rain doesn't do anything below .5 overcast

_diaryText = _diaryText + format ["<font size='18' color='#aaaaaa'>Weather</font><br/><font size='16'>%1 | %2</font><br/>",_overCastText,_rainText];


// Wind and fog
private _windText = "High Winds";
if (_wind < .5) then {_windText = "Windy"; };
if (_wind < .3) then {_windText = "Light Winds"; };
private _windDirText = ["N","NE","E","SE","S","SW","W","NW"] select floor abs (((windDir+22.5) % 360)/45);

_diaryText = _diaryText + format ["<font size='16'>%1 (%2kt %3)</font><br/>",_windText,_wind*13.6 toFixed 1,_windDirText];

private _fogText = "No Visibility";
if (_fogParams#0 < .8) then {_fogText = "Heavy Fog"};
if (_fogParams#0 < .5) then {_fogText = "Foggy"};
if (_fogParams#0 < .2) then {_fogText = "Misty"};
if (_fogParams#0 < .01) then {_fogText = "Good Visibility"};
if (_fogParams#1 > 0) then {
	_fogText = _fogText + format [" (at %1m ASL)",_fogParams#2 toFixed 0];
};

_diaryText = _diaryText + format ["<font size='16'>%1</font><br/>",_fogText];


// Astronomical info
private _moonPhase = moonPhase _date;
private _moonText = "Full";
if (_moonPhase < .875) then { _moonText = "Gibbous"; };
if (_moonPhase < .625) then { _moonText = "Quarter"; };
if (_moonPhase < .375) then { _moonText = "Crescent"; };
if (_moonPhase < .125) then { _moonText = "New"; };

private _sunriseSunset = _date call BIS_fnc_sunriseSunsetTime apply {
	if (! (_x in [0,-1]) ) then { // probably unnecessary polar handling
		[_x,"HH:MM"] call BIS_fnc_timeToString;
	};
};

_diaryText = _diaryText + format ["<br/><font size='16'><font color='#aaaaaa'>Moon Phase:</font> %1<br/><font color='#aaaaaa'>Sunrise:</font> %2 | <font color='#aaaaaa'>Sunset:</font> %3</font>",_moonText,_sunriseSunset#0,_sunriseSunset#1];


// Insert final result into briefing
waitUntil {scriptDone f_script_briefing};
player createDiaryRecord ["diary", ["Mission Conditions", _diaryText]];
