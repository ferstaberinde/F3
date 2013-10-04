// F3 - AI Skill Selector (coop)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE KEY VARIABLES ARE DEFINED
// If one of the two required global variables is not defined we default it to medium skill

if (isNil "f_param_AISkill_Friendly") then {f_param_AISkill_Friendly = 1};
if (isNil "f_param_AISkill_Enemy") then {f_param_AISkill_Enemy = 1};
if (isNil "f_isFriendly") exitWith {player sidechat format ["DEBUG (f\common\f_setAISkillCoop.sqf): f_isFriendly is undefined. Needs to be set in init.sqf!"]};

// SET KEY VARIABLES
// AI Skills are set in the parameters screen (during mission set-up).

_param_AISkill_Friendly = f_param_AISkill_Friendly;
_param_AISkill_Enemy = f_param_AISkill_Enemy;

_skillfriendly = 0;
_skillEnemy = 0;

// ====================================================================================

// SELECT FRIENDLY AI SKILLS
// Using the value of _param_AISkill_Friendly, a value for _skillFriendly is set.

switch (_param_AISkill_Friendly) do
{
// Super
	case 0:
	{
		_skillFriendly = _superSkill;
	};
// High
	case 1:
	{
		_skillFriendly = _highSkill;
	};
// Medium
	case 2:
	{
		_skillFriendly = _mediumSkill;
	};
// Low
	case 3:
	{
		_skillFriendly = _lowSkill;
	};
};

// ====================================================================================

// SELECT ENEMY AI SKILLS
// Using the value of _param_AISkill_Enemy, a value for _skillEnemy is set.

switch (_param_AISkill_Enemy) do
{
// Super
	case 0:
	{
		_skillEnemy = _superSkill;
	};
// High
	case 1:
	{
		_skillEnemy = _highSkill;
	};
// Medium
	case 2:
	{
		_skillEnemy = _mediumSkill;
	};
// Low
	case 3:
	{
		_skillEnemy = _lowSkill;
	};
};

// ====================================================================================

// ENABLE DEBUG MODE
// If either _param_AISkill_Friendly or _param_AISkill_Enemy is set to 99, debug mode is
// enabled; in this case _skillFriendly and _skillEnemy are set to _lowSkill.

if ((_param_AISkill_Friendly == 99) || (_param_AISkill_Enemy == 99)) then
{
	_skillFriendly = _lowSkill;
	_skillEnemy = _lowSkill;
};

// ====================================================================================

// SET SIDE AI SKILL LEVELS (COOP)
// AI Skill for each side is set (in part using variables from the init.sqf file).

if (west in f_isFriendly) then {f_skillBLU = _skillFriendly} else {f_skillBLU = _skillEnemy};
if (independent in f_isFriendly) then {f_skillRES = _skillFriendly} else {f_skillRES = _skillEnemy};
if (east in f_isFriendly) then {f_skillOPF = _skillFriendly} else {f_skillOPF = _skillEnemy};
if (civilian in f_isFriendly) then {f_skillCIV = _skillFriendly} else {f_skillCIV = _skillEnemy};

// DEBUG
if (f_var_debugMode == 1) then
{
	_strSkillFriendly = str _skillFriendly;
	_strSkillEnemy = str _skillEnemy;
	player sideChat format ["DEBUG (f\common\f_setAISkillCoop.sqf): _skillFriendly = %1",_strSkillFriendly];
	player sideChat format ["DEBUG (f\common\f_setAISkillCoop.sqf): _skillEnemy = %1",_strSkillEnemy];
	player sideChat format ["DEBUG (f\common\f_setAISkillCoop.sqf): f_skillBLU = %1",f_skillBLU];
	player sideChat format ["DEBUG (f\common\f_setAISkillCoop.sqf): f_skillRES = %1",f_skillRES];
	player sideChat format ["DEBUG (f\common\f_setAISkillCoop.sqf): f_skillOPF = %1",f_skillOPF];
	player sideChat format ["DEBUG (f\common\f_setAISkillCoop.sqf): f_skillCIV = %1",f_skillCIV];
};

// ====================================================================================


