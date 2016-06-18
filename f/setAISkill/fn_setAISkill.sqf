// F3 - SetAISkill
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES

private ["_unit","_skill","_skillset","_skillarray"];

// ====================================================================================

// SET KEY VARIABLES

_unit = _this select 0;
_skillset = if (count _this > 1) then [{_this select 1},{false}];
_skill = 99;
_skillarray = _skillset; // If _skillset is not an array of skills, _skillarray will be properly set further down

// ====================================================================================

// FAULT CHECK
// If f_setAISkill.sqf has not been run exit with an error message

if ((isNil "f_var_skillSet") || (isNil "f_var_skillRandom")) exitWith {};

// ====================================================================================

// If the unit was already processed, exit the function
if (_unit getVariable ["f_setAISkill",false]) exitWith {};

// ====================================================================================

// If no skill-array was passed, set it to the relevant side's skill-level at first
if (typeName _skillset == typeName false) then {
	_skillset =
	switch (side _unit) do {
			case west: {f_var_skillBLU};
			case blufor: {f_var_skillBLU};
			case east: {f_var_skillOPF};
			case opfor: {f_var_skillOPF};
			case independent: {f_var_skillRES};
			case resistance: {f_var_skillRES};
			case civilian: {f_var_skillCIV};
			default {0};
	};
};

// ====================================================================================

// If the faction's skill level is not configured, exit and ignore the unit from now on
if (typename _skillset == typename 0 && {_skillset == 99}) exitWith {_unit setVariable ["f_setAISkill",true];};

// ====================================================================================

// If a specific skill level was passed, populate _skillArray using the new value.
if (typename _skillset == typename 0) then {
	_skill = _skillset;
	_skillArray = [];
	for '_x' from 0 to 8 do {
		_skilllevel = (f_var_skillSet select _x) * _skill;
		_skillArray pushBack (_skilllevel + random f_var_skillRandom - random f_var_skillRandom);
	};
};

// ====================================================================================

// We loop through all skilltypes and set them for the individual unit
{
	_unit setSkill [_x,_skillarray select _forEachIndex];
} forEach ['aimingAccuracy','aimingShake','aimingSpeed','spotDistance','spotTime','courage','reloadSpeed','commanding','general'];

// Mark the unit as processed
_unit setVariable ["f_setAISkill",true];

// Return true
true