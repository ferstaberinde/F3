// F3 - SetTime
// Credits and documentation: https://github.com/folkarps/F3/wiki
// ====================================================================================

// RUN ONLY ON THE SERVER
// This function does never need to run on a client
if !(isServer) exitWith {};

// DECLARE VARIABLES AND FUNCTIONS

private ["_year","_month","_day","_hour","_minute","_transition","_sunsetSunrise","_sunriseSunsetExists","_sunrise","_sunset","_addTime","_time","_date"];

// ====================================================================================

// SET KEY VARIABLES
// We interpret the values parsed to the script. If the function was called from the parameters those values are used.

params [
	["_timeOfDay", 8, [0]]
];

// Exit when using mission settings
if ( _timeOfDay == 8 ) exitWith {};


// ====================================================================================

// GET DEFAULT VALUES
// Grab the mission's current date and time.

date params ["_year", "_month", "_day", "_hour", "_minute"];

// ====================================================================================

// CALCULATE SUNSET/SUNRISE
// Ensure dawn and dusk don't happen in the dark during different seasons and at different latitudes

_sunsetSunrise = [_year,_month,_day,_hour,_minute] call BIS_fnc_sunriseSunsetTime;
_sunriseSunsetExists = !(_sunsetSunrise in [[-1,0],[0,-1]]); // can happen if you're far north or far south
_sunrise = [floor (_sunsetSunrise select 0), floor (((_sunsetSunrise select 0) % 1) * 60)];
_sunset = [floor (_sunsetSunrise select 1), floor (((_sunsetSunrise select 1) % 1) * 60)];

// function for correcting adding hours and minutes to hours and minutes
_addTime = {
	params [
		["_time1", [], [[]], 2],
		["_time2", [], [[]], 2]
	];
	private _result = [_time1#0 + _time2#0,_time1#1 + _time2#1];

	private _extraHours = floor (_result#1 / 60);
	_result = [(_result#0 + _extraHours) % 24,_result#1 - 60*_extraHours];

	if (_result#0 < 0) then { _result = [_result#0 + 24,_result#1] };

	_result
};

// ====================================================================================

// SELECT MISSION TIME OF DAY
// Using the value of _timeOfDay, we define new values for _hour and _minute.

switch (_timeOfDay) do
{
// Dawn (at sunrise)
	case 0:
	{
        if (_sunriseSunsetExists) then {
            _hour = _sunrise select 0;
            _minute = _sunrise select 1;
        } else {
            _hour = 4;
            _minute = 50;
        };
	};
// Early Morning (30 minutes after sunrise)
	case 1:
	{
        if (_sunriseSunsetExists) then {
            _time = [_sunrise,[0,30]] call _addTime;
            _hour = _time select 0;
            _minute = _time select 1;
        } else {
            _hour = 5;
            _minute = 20;
        };
	};
// Morning
	case 2:
	{
		_hour = 9;
		_minute = 20;
	};
// Noon
	case 3:
	{
		_hour = 12;
		_minute = 00;
	};
// Afternoon
	case 4:
	{
		_hour = 15;
		_minute = 30;
	};
// Evening (30 minutes before sunset)
	case 5:
	{
        if (_sunriseSunsetExists) then {
            _time = [_sunset,[0,-30]] call _addTime;
            _hour = _time select 0;
            _minute = _time select 1;
        } else {
            _hour = 18;
            _minute = 40;
        };
	};
// Dusk (at sunset)
	case 6:
	{
        if (_sunriseSunsetExists) then {
            _hour = _sunset select 0;
            _minute = _sunset select 1;
        } else {
            _hour = 19;
            _minute = 10;
        };
	};
// Night
	case 7:
	{
		_hour = 0;
		_minute = 0;
	};
};

// ====================================================================================

// CHECK IF TRANSITION IS NEEDED
// If we're changing the date in-mission, set the BIS function to display a smooth transition
// We check the varios dates to make sure we stick with a smart value

_transition = false;
if (time > 0) then {
	_transition = true;
	_day = date select 2;
	_month = date select 1;
	_year = date select 0;

	if (date select 3 > _hour) then {_day = _day + 1};
	if (_day > 31) then {_day = 1; _month = _month + 1};
	if (_month > 12) then {_month = 1; _year = _year + 1};
};

// ====================================================================================

// SET DATE VARIABLE
// Using the single variables, we construct a new variable _date
_date = [_year,_month,_day,_hour,_minute];

// ====================================================================================

// SET DATE FOR ALL CLIENTS
// Using a BIS function we share the new date across the network
[_date,true,_transition] call BIS_fnc_setDate;

// ====================================================================================

// RETURN DATE
_date
