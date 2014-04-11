// F3 - SetTime
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_timeOfDay"];

// ====================================================================================

// SET KEY VARIABLES
// Conditions are set in the parameters screen (during mission set-up).

_timeOfDay = if (count _this == 0) then {f_param_timeOfDay} else {(_this select 0)};

// ====================================================================================

// SELECT MISSION TIME OF DAY
// Using the value of _timeOfDay, a new date is set.

switch (_timeOfDay) do
{
// Dawn
	case 0:
	{
		setDate [2030, 5, 11, 5, 0];
	};
// Early Morning
	case 1:
	{
		setDate [2030, 5, 11, 6, 0];
	};
// Morning
	case 2:
	{
		setDate [2030, 5, 11, 9, 0];
	};
// Noon
	case 3:
	{
		setDate [2030, 5, 11, 12, 0];
	};
// Afternoon
	case 4:
	{
		setDate [2030, 5, 11, 15, 0];
	};
// Evening
	case 5:
	{
		setDate [2030, 5, 11, 17, 40];
	};
// Dusk
	case 6:
	{
		setDate [2030, 5, 11, 19, 10];
	};
// Night
	case 7:
	{
		setDate [2030, 5, 11, 0, 0];
	};
};

// ====================================================================================

if (true) exitWith {};