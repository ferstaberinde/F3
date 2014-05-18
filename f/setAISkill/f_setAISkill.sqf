// F3 - AI Skill Selector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN THE SCRIPT ONLY SERVER SIDE

if !(isServer) exitWith {};

// ====================================================================================

// WAIT UNTIL THE MISSION HAS STARTED

waitUntil {time > 1};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_units","_superSkill","_highSkill","_mediumSkill","_lowSkill"];

// ====================================================================================

// DEFINE SKILL LEVELS
// These values define the total skill level as set by the parameter

_superSkill = 1.00;
_highSkill = 0.75;
_mediumSkill = 0.50;
_lowSkill = 0.25;

// This are the skills a soldier set to _superSkill would have. For all other skill levels the values are rounded using the numbers above.
// These are recommended levels to avoid "laser" AI snipers. Change them accordingly if you are finding the AI to be too inaccurate or are using AI mods.

f_var_skillSet = [
	0.55,		// aimingAccuracy
	0.6,		// aimingShake
	0.7,		// aimingSpeed
	1,			// endurance
	0.5,		// spotDistance
	0.7,		// spotTime
	1,			// courage
	1,			// reloadSpeed
	1,			// commanding
	1			// general
];

// These are the ranges in which skills can differ between two soldiers on the same skill level.
f_randomUp = 0.15;
f_randomDown = 0.15;

// ====================================================================================

// SET DEFAULT VALUES
// The default skill levels for all sides. They are overriden by any parameters set.
// Values of > 1 mean that units belonging to that side are not modified by the script

f_var_skillBlu = 99; // BLUFOR
f_var_skillRes = 99; // INDEPENDENT
f_var_skillOpf = 99; // OPFOR
f_var_skillCiv = 99; // CIVILIAN

// ====================================================================================

// SET UP SKILL Levels
// As the skill level are passed as full integers, we interpret each of them to set the correct value

#include "f_setAISkillValues.sqf";

// ====================================================================================

// BROADCAST PUBLIC VARIABLES
// We make the global variables known to all clients

{publicVariable _x} forEach ["f_var_skillSet","f_randomUP","f_randomDown","f_var_skillBLU","f_var_skillOPF","f_var_skillRES","f_var_skillCIV"];

// ====================================================================================

// SET KEY VARIABLES
// If an array of units was passed, the skill change will apply only to them

_units = allUnits;
if (count _this > 0) then {_units = _this};

// ====================================================================================

// SET SKILL LEVELS FOR ALL AI
// AI Skill for all AIs is set using side levels (see above).
// By using the BI function BIS_fnc_MP we ensure that AI is set to the correct level for all connected clients, including the server

{

private ["_skill","_skillarray","_random"];
_skill = 0;
_skillArray = [];

    if !(_x getVariable ["f_setAISkill",false]) then {
	// We change the value of skill to the appropiate one depending on the unit's side
	switch (side _x) do {
		case west: {_skill = f_var_skillBLU};
		case blufor: {_skill = f_var_skillBLU};
		case east: {_skill = f_var_skillOPF};
		case opfor: {_skill = f_var_skillOPF};
		case independent: {_skill = f_var_skillRES};
		case resistance: {_skill = f_var_skillRES};
		case civilian: {_skill = f_var_skillCIV};
	};

	if (_skill == 99) exitWith {};

	for "_i" from 0 to 9 do {
		_skilllevel = (f_var_skillSet select _i) * _skill;
		_random =  random f_randomUp - random f_randomDown;
		_skillArray set [_i, (_skilllevel + _random)];
	};

	// We run the function that sets the skills on all clients
	[[_x,_skillArray],"f_fnc_setAISkill"] spawn BIS_fnc_MP;
     };

sleep 0.1; // Very short sleep to avoid lag when modifiyng a lot of AI

} forEach _units;