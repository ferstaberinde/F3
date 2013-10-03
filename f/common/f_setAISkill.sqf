// F3 - AI Skill Selector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// WAIT UNTIL THE MISSION HAS STARTED

waitUntil {time > 1};

// ====================================================================================

// JIP CHECK
// Prevents the script executing until the player has synchronised correctly:

 #include "f_waitForJIP.sqf"

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_units","_localUnits","_localBLUUnits","_localRESUnits","_localOPFUnits","_localCIVUnits","_strMen","_strLocalUnits","_strLocalBLUUnits","_strLocalRESUnits","_strLocalOPFUnits","_strLocalCIVUnits","_superSkill","_highSkill","_mediumSkill","_lowSkill"];

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
0.6,		// aimingAccuracy
1,		// aimingShake
0.7,		// aimingSpeed
1,		// endurance
0.4,		// spotDistance
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

_units = allUnits;

// The default skill levels for all sides. They are overriden by any parameters set.

f_skillBlu = _mediumSkill;
f_skillRes = _mediumSkill;
f_skillOpf = _mediumSkill;
f_skillCiv = _mediumSkill;


// We split out the contents of _units - first by locality, then by side.
// By checking for the Variable "f_skillarray" on each unit we can make sure that only units that haven't been touched by the script are added to the array.

_localUnits = [];
_localBLUUnits = [];
_localRESUnits = [];
_localOPFUnits = [];
_localCIVUnits = [];

// To save processing power we stop looping through it once we hit the first unit that has already been touched by f_setAISkill as newly spawned units are always added to the beginning of the allUnits array
{
	if (count (_x getVariable ["f_skillarray",[]])) != 0) exitWith {};
	if (local _x && () then {_localUnits = _localUnits + [_x]}
} forEach _units;

if (count _localUnits == 0) exitWith {};

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

// EXECUTE FOLLOW-UP SCRIPT
// Depending on enabled parameters either the script for A&D or for COOP is included

if !(isNil "f_param_AISkill_Friendly" && isNil "f_param_AISkill_Enemy") then {
	 #include "f_setAISkillCoop.sqf";
};
if !(isNil "f_param_AISkill_BLUFOR" && isNil "f_param_AISkill_OPFOR") then {
	 #include "f_setAISkillAD.sqf";
};

// SET SKILL LEVELS FOR ALL LOCAL AI
// AI Skill for all local AIs is set using side levels (see above).

{[_x,f_skillBlu] call f_fnc_setAISkill} forEach _localBLUUnits;
{[_x,f_skillRes] call f_fnc_setAISkill} forEach _localRESUnits;
{[_x,f_skillOpf] call f_fnc_setAISkill} forEach _localOPFUnits;
{[_x,f_skillCiv] call f_fnc_setAISkill} forEach _localCIVUnits;

// DEBUG (SPECIAL)
// if (f_var_debugMode == 1) then
// {
// 	{_x addEventHandler ["hit", {_v=_this select 0; _skillV = skill _v; player sideChat format ["DEBUG (f\common\f_setAISkill.sqf): Skill %1 = %2",_v,_skillV]}];} forEach _localUnits;
// };

// ====================================================================================

if (true) exitWith {};
