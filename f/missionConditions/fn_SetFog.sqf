// F3 - SetFog
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_fog","_strenght","_decay","_base"];

// ====================================================================================

// SET KEY VARIABLES
// Conditions are set in the parameters screen (during mission set-up).

_fog = if (count _this == 0) then {f_param_fog} else {(_this select 0)};

_strength = 0;	//value for fog at base level
_decay = 0; 	//decay of fog density with altitude
_base = 0; 		//base altitude of fog (in meters)

// ====================================================================================

// SELECT FOG VALUES
// Using the value of _fog, new fog values are set.

switch (_fog) do
{
	//None
	case 0:
	{
		_strength = 0;
		_decay = 0;
		_base = 0;
	};

	//Light
	case 1:
	{
		_strength = 0.2;
		_decay = 0;
		_base = 0;
	};

	//Heavy
	case 2:
	{
		_strength = 0.4;
		_decay = 0;
		_base = 0;
	};
};

// ====================================================================================

// SET MISSION CONDITIONS
// Use new values to set
// mission conditions on server and all clients (including JIP clients).

0 setFog [_strength,_decay,_base];

// ====================================================================================

if (true) exitWith {};
