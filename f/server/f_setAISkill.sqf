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

private ["_units","_skill","_skillarray","_superSkill","_highSkill","_mediumSkill","_lowSkill"];

// ====================================================================================


// DEFINE SKILL LEVELS
// These values define the total skill level as set by the parameter

_superSkill = 1.00;
_highSkill = 0.75;
_mediumSkill = 0.50;
_lowSkill = 0.25;

// This are the skills a soldier set to _superSkill would have. For all other skill levels the values are rounded using the numbers above.
// These are recommended levels to avoid "laser" AI snipers. Change them accordingly if you are finding the AI to be too inaccurate or are using AI mods.

f_skillSet = [
0.55,		// aimingAccuracy
0.6,		// aimingShake
0.7,		// aimingSpeed
1,		// endurance
0.5,		// spotDistance
0.7,		// spotTime
1,		// courage
1,		// reloadSpeed
1,		// commanding
1		// general
];

// These are the ranges in which skills can differ between two soldiers on the same skill level.
f_randomUp = 0.15;
f_randomDown = 0.15;

// ====================================================================================

// SET KEY VARIABLES

// We use a common variable containing all men and vehicles

_units = allUnits ;
if (count _this > 0) then {_units = _this};

// The default skill levels for all sides. They are overriden by any parameters set.

f_skillBlu = _mediumSkill;
f_skillRes = _mediumSkill;
f_skillOpf = _mediumSkill;
f_skillCiv = _mediumSkill;
_skill = _mediumSkill;

// ====================================================================================

// INCLUDE FOLLOW-UP SCRIPT
// Depending on enabled parameters either the script for A&D or for COOP is included to set the side specific skill levels

if !(isNil "f_param_AISkill_Friendly" && isNil "f_param_AISkill_Enemy") then {
	 #include "f_setAISkillCoop.sqf";
};
if !(isNil "f_param_AISkill_BLUFOR" && isNil "f_param_AISkill_OPFOR") then {
	 #include "f_setAISkillAD.sqf";
};

// ====================================================================================

// BROADCAST PUBLIC VARIABLES
// We make the global variables known to all clients
{publicVariable _x} forEach ["f_skillSet","f_randomUP","f_randomDown","f_skillBLU","f_skillOPF","f_skillRES","f_skillCIV"];

// ====================================================================================

// SET SKILL LEVELS FOR ALL AI
// AI Skill for all AIs is set using side levels (see above).
// By using the BI function BIS_fnc_MP we ensure that AI is set to the correct level for all connected clients, including the server

{
    if !(_x getVariable ["f_setAISkill",false]) then {
	// We change the value of skill to the appropiate one depending on the unit's side
	switch (side _x) do {
		case west: {_skill = f_skillBLU};
		case east: {_skill = f_skillOPF};
		case independent: {_skill = f_skillRES};
		case civilian: {_skill = f_skillCIV};
	};

	_skillArray = [];
	for "_i" from 0 to 9 do {
		_skilllevel = (f_skillSet select _i) * _skill;
		_random =  random f_randomUp - random f_randomDown;
		_skillArray set [_i, (_skilllevel + _random)];
	};

	// We run the function that sets the skills on all clients
	[[_x,_skillArray],"f_fnc_setAISkill"] spawn BIS_fnc_MP;
     };

} forEach _units;

// DEBUG (SPECIAL)
// if (f_var_debugMode == 1) then
// {
// 	{_x addEventHandler ["hit", {_v=_this select 0; _skillV = skill _v; player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): Skill %1 = %2",_v,_skillV]}];} forEach _localUnits;
// };

// ====================================================================================

if (true) exitWith {};