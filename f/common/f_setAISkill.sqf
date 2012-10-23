// F2 - AI Skill Selector (coop)
// Credits: Please see the F2 online manual (http://www.ferstaberinde.com/f2/en/)
// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

#include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_param_AISkill_Friendly","_param_AISkill_Enemy","_units","_localUnits","_localBLUUnits","_localRESUnits","_localOPFUnits","_localCIVUnits","_strMen","_strLocalUnits","_strLocalBLUUnits","_strLocalRESUnits","_strLocalOPFUnits","_strLocalCIVUnits","_superSkill","_highSkill","_mediumSkill","_lowSkill","_skillFriendly","_skillEnemy"];

// ====================================================================================

// WAIT FOR PARAMSARRAY TO BE PROCESSED

waitUntil {scriptDone f_processParamsArray};

// ====================================================================================

// WAIT FOR COMMON VARIABLES TO BE SET
// Before executing this script, we wait for the script 'f_setCommonVars.sqf' to run:

waitUntil {scriptDone f_script_setLocalVars};

// ====================================================================================

// SET KEY VARIABLES
// AI Skills are set in the parameters screen (during mission set-up).

_param_AISkill_Friendly = f_param_AISkill_Friendly;
_param_AISkill_Enemy = f_param_AISkill_Enemy;
_superSkill = 1.00;
_highSkill = 0.75;
_mediumSkill = 0.50;
_lowSkill = 0.25;

// Using a common variable, we will create an array containing all men.

_units = f_var_units;

// We split out the contents of _units - first by locality, then by side.

_localUnits = [];
_localBLUUnits = [];
_localRESUnits = [];
_localOPFUnits = [];
_localCIVUnits = [];

{if (local _x) then {_localUnits = _localUnits + [_x]}} forEach _units;
{if ((side _x) == west) then {_localBLUUnits = _localBLUUnits + [_x]}} forEach _localUnits;
{if ((side _x) == resistance) then {_localRESUnits = _localRESUnits + [_x]}} forEach _localUnits;
{if ((side _x) == east) then {_localOPFUnits = _localOPFUnits + [_x]}} forEach _localUnits;
{if ((side _x) == civilian) then {_localCIVUnits = _localCIVUnits + [_x]}} forEach _localUnits;

// DEBUG
if (f_var_debugMode == 1) then
{
	_strUnits = str _units;
	_strLocalUnits = str _localUnits;
	_strLocalBLUUnits = str _localBLUUnits;
	_strLocalRESUnits = str _localRESUnits;
	_strLocalOPFUnits = str _localOPFUnits;
	_strLocalCIVUnits = str _localCIVUnits;
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): _units = %1",_strUnits];
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): _localUnits = %1",_strLocalUnits];
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): _localBLUUnits = %1",_strLocalBLUUnits];
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): _localRESUnits = %1",_strLocalRESUnits];
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): _localOPFUnits = %1",_strLocalOPFUnits];
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): _localCIVUnits = %1",_strLocalCIVUnits];
};

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

// SET SIDE AI SKILL LEVELS
// AI Skill for each side is set (in part using variables from the init.sqf file).

if (f_isFriendlyBLU == 1) then {f_skillBLU = _skillFriendly} else {f_skillBLU = _skillEnemy};
if (f_isFriendlyRES == 1) then {f_skillRES = _skillFriendly} else {f_skillRES = _skillEnemy};
if (f_isFriendlyOPF == 1) then {f_skillOPF = _skillFriendly} else {f_skillOPF = _skillEnemy};
if (f_isFriendlyCIV == 1) then {f_skillCIV = _skillFriendly} else {f_skillCIV = _skillEnemy};

// DEBUG
if (f_var_debugMode == 1) then
{
	_strSkillFriendly = str _skillFriendly;
	_strSkillEnemy = str _skillEnemy;
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): _skillFriendly = %1",_strSkillFriendly];
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): _skillEnemy = %1",_strSkillEnemy];
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): f_skillBLU = %1",f_skillBLU];
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): f_skillRES = %1",f_skillRES];
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): f_skillOPF = %1",f_skillOPF];
	player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): f_skillCIV = %1",f_skillCIV];
};

// ====================================================================================

// SET SKILL LEVELS FOR ALL LOCAL AI
// AI Skill for all local AIs is set using side levels (see above).

{_x setSkill f_skillBLU} forEach _localBLUUnits;
{_x setSkill f_skillRES} forEach _localRESUnits;
{_x setSkill f_skillOPF} forEach _localOPFUnits;
{_x setSkill f_skillCIV} forEach _localCIVUnits;

// DEBUG (SPECIAL)
// if (f_var_debugMode == 1) then
// {
// 	{_x addEventHandler ["hit", {_v=_this select 0; _skillV = skill _v; player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): Skill %1 = %2",_v,_skillV]}];} forEach _localUnits;
// };

// ====================================================================================

if (true) exitWith {};
