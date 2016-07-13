// F3 - SetWind
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_wind","_strength","_decay","_base"];

// ====================================================================================

// SET KEY VARIABLES
// We interpret the values parsed to the script. If the function was called from the parameters those values are used.

params [["_wind",4,[0]],["_transition",0,[0]]];

// Exit if we're not overriding
if ( _wind == 4 ) exitWith {};

_strength = 0.01;	// Base wind strength
_gusts = 0.01; 		// How fast the wind can change
_waves = 0; 		// Size of waves

// ====================================================================================

// SELECT WIND VALUES
// Using the value of _wind, new wind values are set.

switch (_wind) do
{
	//None
	case 0:
	{
		_strength = 0.01;
		_gusts = 0.01;
		_waves = 0;
	};

	//Light
	case 1:
	{
		_strength = 0.25;
		_gusts = 0.25;
		_waves = 0.6;
	};

	//Heavy
	case 2:
	{
		_strength = 0.75;
		_gusts = 0.75;
		_waves = 1;
	};
};

// ====================================================================================

// SET MISSION CONDITIONS
// Use the new values to set the transition across the network


_transition setWindStr  _strength;
_transition setWindForce _gusts;
_transition setWaves _waves;

// ====================================================================================
