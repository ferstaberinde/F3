// F3 - AI Skill Selector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RUN THE SCRIPT ONLY SERVER SIDE

if !(isServer) exitWith {};

// ====================================================================================

// WAIT FOR THE MISSION TO BEGIN
// By waiting a few seconds into the mission the server is giving time to settle and it assures that the component catches AI created during init

sleep 2;

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_units","_superSkill","_highSkill","_mediumSkill","_lowSkill"];

// ====================================================================================

// DEFINE SKILL LEVELS
// These values define the total skill level as set by the parameter

_superSkill = 1.00;
_highSkill = 0.7;
_mediumSkill = 0.6;
_lowSkill = 0.5;

// This are the minimal skills a soldier set to _superSkill would have. For all other skill levels the values are rounded using the numbers above.
// These are recommended levels to avoid "laser" AI snipers. Change them accordingly if you are finding the AI to be too inaccurate or are using AI mods.

f_var_skillSet = [
	0.55,		// aimingAccuracy
	0.6,		// aimingShake
	0.6,		// aimingSpeed
	0.7,		// spotDistance
	0.7,		// spotTime
	1.2,		// courage
	2,			// reloadSpeed
	2,			// commanding
	1.2			// general
];

// The final skill will within +/- this range
f_var_skillRandom = 0.08;

// ====================================================================================

// BROADCAST PUBLIC VARIABLES
// Make the relevant global variables known to all clients

{publicVariable _x} forEach ["f_var_skillRandom","f_var_skillSet"];

// ====================================================================================

// SET UP SKILL Levels
// As the params can only set full numbers, we interpret each of them to set the correct value

#include "f_setAISkillValues.sqf";

// ====================================================================================

// SET KEY VARIABLES
// If an array of units was passed, the skill change will apply only to the units in the array

_units = if (count _this > 0) then [{_this},{allUnits}];

// ====================================================================================

// SET SKILL LEVELS FOR ALL AI
// AI Skill for all AIs is set using side levels (see above).
// By using the BI function BIS_fnc_MP we ensure that AI is set to the correct level for all connected clients, including the server

{

private ["_skill","_skillarray"];
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

		// If skill is 99 it is not configured in the params and the unit will be ignored
		if (_skill == 99) exitWith {
			_x setVariable ["f_setAISkill",true];
		};

		for "_i" from 0 to 8 do {
			_skilllevel = (f_var_skillSet select _i) * _skill;
			_skillArray pushBack (_skilllevel + random f_var_skillRandom - random f_var_skillRandom);
		};

		// Call the function to set the skills for the unit
		[_x,_skillArray] call f_fnc_setAISkill;
     };

} forEach _units;