// F3 - AI Skill Selector (A&D)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE KEY VARIABLES ARE DEFINED
// If one of the two required global variables is not defined we default it to medium skill

if (isNil "f_param_AISkill_BLUFOR") then {f_param_AISkill_BLUFOR = 1};
if (isNil "f_param_AISkill_OPFOR") then {f_param_AISkill_OPFOR = 1};
if (isNil "f_isFriendlyToBLU_RES") exitWith {player sidechat format ["DEBUG (f\common\f_setAISkillAD.sqf): f_isFriendlyToBlu_RES is undefined. Needs to be set in init.sqf!"]};
if (isNil "f_isFriendlyToBLU_CIV") exitWith {player sidechat format ["DEBUG (f\common\f_setAISkillAD.sqf): f_isFriendlyToBLU_CIV is undefined. Needs to be set in init.sqf!"]};

// SET KEY VARIABLES
// AI Skills are set in the parameters screen (during mission set-up).

_param_AISkill_BLUFOR = f_param_AISkill_BLUFOR;
_param_AISkill_OPFOR = f_param_AISkill_OPFOR;

_skillSideBLUFOR = 0;
_skillSideOPFOR = 0;

// ====================================================================================

// SELECT BLUFOR AI SKILLS
// Using the value of _param_AISkill_BLUFOR, a value for _skillSideBLUFOR is set.

switch (_param_AISkill_BLUFOR) do
{
// Super
	case 0:
	{
		_skillSideBLUFOR = _superSkill;
	};
// High
	case 1:
	{
		_skillSideBLUFOR = _highSkill;
	};
// Medium
	case 2:
	{
		_skillSideBLUFOR = _mediumSkill;
	};
// Low
	case 3:
	{
		_skillSideBLUFOR = _lowSkill;
	};
};

// ====================================================================================

// SELECT OPFOR AI SKILLS
// Using the value of _param_AISkill_OPFOR, a value for _skillSideOPFOR is set.

switch (_param_AISkill_OPFOR) do
{
// Super
	case 0:
	{
		_skillSideOPFOR = _superSkill;
	};
// High
	case 1:
	{
		_skillSideOPFOR = _highSkill;
	};
// Medium
	case 2:
	{
		_skillSideOPFOR = _mediumSkill;
	};
// Low
	case 3:
	{
		_skillSideOPFOR = _lowSkill;
	};
};

// ====================================================================================

// ENABLE DEBUG MODE
// If either _param_AISkill_BLUFOR or _param_AISkill_OPFOR is set to 99, debug mode is
// enabled; in this case _skillSideBLUFOR and _skillSideOPFOR are set to _lowSkill.

if ((_param_AISkill_BLUFOR == 99) || (_param_AISkill_OPFOR == 99)) then
{
	_skillSideBLUFOR = _lowSkill;
	_skillSideOPFOR = _lowSkill;
};

// ====================================================================================

// SET SIDE AI SKILL LEVELS
// AI Skill for each side is set (in part using variables from the init.sqf file).

f_skillBLU = _skillSideBLUFOR;
if (f_isFriendlyToBLU_RES == 1) then {f_skillRES = _skillSideBLUFOR} else {f_skillRES = _skillSideOPFOR};
f_skillOPF = _skillSideOPFOR;
if (f_isFriendlyToBLU_CIV == 1) then {f_skillCIV = _skillSideBLUFOR} else {f_skillCIV = _skillSideOPFOR};

// DEBUG
if (f_var_debugMode == 1) then
{
	_strSkillSideBLUFOR = str _skillSideBLUFOR;
	_strSkillSideOPFOR = str _skillSideOPFOR;
	player sideChat format ["DEBUG (f\common\f_setAISkillAD.sqf): _skillSideBLUFOR = %1",_strSkillSideBLUFOR];
	player sideChat format ["DEBUG (f\common\f_setAISkillAD.sqf): _skillSideOPFOR = %1",_strSkillSideOPFOR];
	player sideChat format ["DEBUG (f\common\f_setAISkillAD.sqf): f_skillBLU = %1",f_skillBLU];
	player sideChat format ["DEBUG (f\common\f_setAISkillAD.sqf): f_skillRES = %1",f_skillRES];
	player sideChat format ["DEBUG (f\common\f_setAISkillAD.sqf): f_skillOPF = %1",f_skillOPF];
	player sideChat format ["DEBUG (f\common\f_setAISkillAD.sqf): f_skillCIV = %1",f_skillCIV];
};

// ====================================================================================