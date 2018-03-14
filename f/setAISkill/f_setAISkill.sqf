// F3 - AI Skill Selector
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// WAIT FOR THE MISSION TO BEGIN
// By waiting a few seconds into the mission the server is giving time to settle and it assures that the component catches AI created during init

sleep 2;

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

// If an array of units was passed, the skill change will apply only to the units in the array
params [["_units", [], [[]]]];

// ====================================================================================

// RUN THE SCRIPT ONLY SERVER SIDE

//If _units is empty, then it is called from init.sqf and should only run on the server.
//Otherwise it should be allowed to run on the server or on the headless client.
if (count _units == 0) then {
	if (!isServer) exitWith {};
} else {
	if (!isServer && hasInterface) exitWith {};
};

// ====================================================================================

// SET KEY VARIABLES
// If an array of units was passed, the skill change will apply only to the units in the array
if (count _units == 0) then {
	_units = allUnits;
};

// ====================================================================================

// DEFINE SKILL LEVELS

// This value is used as a default value for error handling.
f_var_skillError = 99;

// These values define the total skill level as set by the parameter
private _skillLevels = [
	1.00,            // 0 Super
	0.7,             // 1 High
	0.6,             // 2 Medium
	0.5,             // 3 Low
	f_var_skillError // last: Default
];

// These are the minimal skills a soldier set to "Super" would have.
// For all other skill levels the values are multiplied with the numbers above.
// These are recommended levels to avoid "laser" AI snipers.
// Change them accordingly if you are finding the AI to be too inaccurate or are using AI mods.
// Note: setSkill takes values between 0 and 1. Other values will be rounded to the nearest valid value.
//       e.g. If we have 2 in this array and then 0.5 as the lowest value in _skillLevels,
//       then this means that this particular skill will always be 1
//       for all possible skillLevels that were set via parameter.
f_var_skillSet = [
	0.55, // aimingAccuracy
	0.6,  // aimingShake
	0.6,  // aimingSpeed
	0.7,  // spotDistance
	0.7,  // spotTime
	1.2,  // courage
	2,    // reloadSpeed
	2,    // commanding
	1.2   // general
];

// The final skill will be within +/- this range
f_var_skillRandom = 0.08;

// ====================================================================================

// BROADCAST PUBLIC VARIABLES
// Make the relevant global variables known to all clients

{publicVariable _x} forEach ["f_var_skillRandom","f_var_skillSet","f_var_skillError"];

// ====================================================================================

// SET UP SKILL Levels
// As the params can only set full numbers, we interpret each of them to set the correct value

// CHECK ACTIVATED PARAMETERS
if (isNil "f_param_AISkill_BLUFOR") then {f_param_AISkill_BLUFOR = (count _skillLevels) - 1};
if (isNil "f_param_AISkill_OPFOR")  then {f_param_AISkill_OPFOR  = (count _skillLevels) - 1};
if (isNil "f_param_AISkill_INDP")   then {f_param_AISkill_INDP   = (count _skillLevels) - 1};

// SELECT BLUFOR AI SKILLS
if (isNil "f_var_skillBlu") then
{
	f_var_skillBlu = _skillLevels select f_param_AISkill_BLUFOR;
	publicVariable "f_var_skillBlu";
};

// SELECT OPFOR AI SKILLS
if (isNil "f_var_skillOpf") then
{
	f_var_skillOpf = _skillLevels select f_param_AISkill_OPFOR;
	publicVariable "f_var_skillOpf";
};

// SELECT INDEPENDENT AI SKILLS
if (isNil "f_var_skillRes") then
{
	f_var_skillRes = _skillLevels select f_param_AISkill_INDP;
	publicVariable "f_var_skillRes";
};

// SELECT CIVILIAN AI SKILLS
// If the civilian side variable is enabled, their level will be set accordingly
if (!isNil "f_var_civAI" && isNil "f_var_skillCiv") then {
	f_var_skillCiv = switch (f_var_civAI) do {
		case west:        {f_var_skillBlu};
		case blufor:      {f_var_skillBlu};
		case east:        {f_var_skillOpfor};
		case opfor:       {f_var_skillOpfor};
		case independent: {f_var_skillRes};
		case resistance:  {f_var_skillRes};
		default           {f_var_skillError};
	};
	publicVariable "f_var_skillCiv";
};

// ====================================================================================

// SET SKILL LEVELS FOR ALL AI
// AI Skill for all AIs is set using side levels (see above).

{
	if !(_x getVariable ["f_setAISkill",false]) then {
		// Call the function to set the skills for the unit
		[_x] call f_fnc_setAISkill;
	};
} forEach _units;
