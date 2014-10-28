// // F3 Zeus Support - AI Skill Selector Event Handler
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

// ====================================================================================

// DECLARE VARIABLES

private ["_curator"];

// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_curator = [_this,0,objNull] call bis_fnc_param;

// ====================================================================================

// If a player unit was passed instead of a module, point _curator to the respective module
if (isPlayer _curator) then {
		call compile format ["
	_curator = f_curator_%1;
	",name _curator];
};

// If _curator does not point to a module, exit
if !(typeOf _curator != "ModuleCurator_F") exitWith {};

// If the eventhandler has already been added, exit
if (_curator getVariable ["f_var_setAISkill",false]) exitWith {};

// ====================================================================================

// Add the eventhandler to set AI skill on newly placed units
_curator addEventHandler ["CuratorObjectPlaced",{
	[[[(_this select 1)],'f\setAISKill\f_setAISkill.sqf'],'Bis_fnc_ExecVM',false]call BIS_fnc_MP;
}];

// Set a variable on the module to mark that the event-handler has been added
_curator setVariable ["f_eh_setAISkill",true,true];