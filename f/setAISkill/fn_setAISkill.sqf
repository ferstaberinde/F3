// F3 - SetAISkill
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SET KEY VARIABLES

params [
	["_unit", objNull, [objNull]],
	["_skillOverride", f_var_skillError, [0]]
];

// ====================================================================================

// FAULT CHECK
// If f_setAISkill.sqf has not been run exit with an error message

if ((isNil "f_var_skillSet") || (isNil "f_var_skillRandom")) exitWith {};

// ====================================================================================

// If the unit was already processed, exit the function
if (_unit getVariable ["f_setAISkill",false]) exitWith {};

// ====================================================================================

// Set the skill to the relevant side's skill-level
private _skill = switch (side _unit) do {
	case west:        {f_var_skillBLU};
	case blufor:      {f_var_skillBLU};
	case east:        {f_var_skillOPF};
	case opfor:       {f_var_skillOPF};
	case independent: {f_var_skillRES};
	case resistance:  {f_var_skillRES};
	case civilian:    {f_var_skillCIV};
	default           {f_var_skillError};
};

//Parameter override
if (_skillOverride != f_var_skillError) then {
	_skill = _skillOverride;
};

// ====================================================================================

// If the faction's skill level is not configured, exit and ignore the unit from now on
if (_skill == f_var_skillError) exitWith {
	_unit setVariable ["f_setAISkill",true];
};

// ====================================================================================

// Populate _skillArray using the new skill.
private _skillArray = f_var_skillSet apply {(_x * _skill) + random f_var_skillRandom - random f_var_skillRandom};

// ====================================================================================

// We loop through all skilltypes and set them for the individual unit
{
	_unit setSkill [_x, _skillArray select _forEachIndex];
} forEach ['aimingAccuracy','aimingShake','aimingSpeed','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];

// Mark the unit as processed
_unit setVariable ["f_setAISkill",true];

// Return true
true
