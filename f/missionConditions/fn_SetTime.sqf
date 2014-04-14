// F3 - SetTime
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_timeOfDay","_year","_month","_day","_hour","_minute"];

// ====================================================================================

// SET KEY VARIABLES
// Conditions are set in the parameters screen (during mission set-up).
// If a number is passed as parameter it is used instead.

_timeOfDay = if (count _this == 0) then {f_param_timeOfDay} else {(_this select 0)};


// ====================================================================================

// SET DEFAULT VALUES
// The default values that together form the in-game date are set.

_year = 2030;
_month = 5;
_day = 5;
_hour = 0;
_minute = 0;

// ====================================================================================

// SELECT MISSION TIME OF DAY
// Using the value of _timeOfDay, we define new values for _hour and _minute.

switch (_timeOfDay) do
{
// Dawn
	case 0:
	{
		_hour = 5;
		_minute = 30;
	};
// Early Morning
	case 1:
	{
		_hour = 7;
		_minute = 30;
	};
// Morning
	case 2:
	{
		_hour = 10;
		_minute = 30;
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
		_hour = 14;
		_minute = 30;
	};
// Evening
	case 5:
	{
		_hour = 17;
		_minute = 40;
	};
// Dusk
	case 6:
	{
		_hour = 19;
		_minute = 10;
	};
// Night
	case 7:
	{
		_hour = 0;
		_minute = 0;
	};
};

// ====================================================================================

// SET DATE FOR ALL CLIENTS
// Using a BIS function we share the new date across the network

_date = [_year,_month,_day,_hour,_minute];
[_date,true,false] call BIS_fnc_setDate;

// ====================================================================================

if (true) exitWith {};