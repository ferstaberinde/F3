// This is a modified version of "\a3\functions_f_mp_mark\Revive\fn_reviveEhDammaged.sqf"

#include "\a3\functions_f_mp_mark\Revive\defines.inc"

/*
unit: Object - Object the event handler is assigned to
hitSelection: String - Name of the selection where the unit was damaged
damage: Number - Resulting level of damage
hitPartIndex: Number - hit index of the hit selection
hitPoint: String - hit point Cfg name
shooter: Object - shooter reference (to get instigator use getShotParents on projectile)
projectile: Object - the projectile that caused damage
*/

params ["_unit", "", "_damage","","_hitPoint","_source"];

if (alive _unit && {_damage >= 1 && {REVIVE_ENABLED(_unit) && {_hitPoint == "Incapacitated" && {IS_ACTIVE(_unit)}}}}) then
{
	//["[i] Incapacitated by dependence: %1",_this] call bis_fnc_logFormat;

	//award attacker with +1 'infantry kill' point
	[_source] spawn bis_fnc_reviveAwardKill;

	// Allow the downed player to be dragged if they are not in a vehicle
	if (!IN_VEHICLE(_unit)) then
	{
		[_unit ] spawn {
		    params ["_unit"];
		    waitUntil{ sleep 0.1; animationState _unit ==  "unconsciousrevivedefault"};
		    _unit setVariable ["f_wound_draggable", true, true];
		    waitUntil{ sleep 0.1; animationState _unit !=  "unconsciousrevivedefault"};
		    _unit setVariable ["f_wound_draggable", false, true];
		};
	}
	else
	{
		// Play the 'downed' animation in a vehicle
		_unit playMove ([_unit] call f_fnc_findDeadAnim);
		
		// Add the 'pull out' action
		[vehicle player] remoteExec ["f_fnc_addPullOutAction", 0, vehicle player];
	};
	
	if (isNull _source || {!bis_revive_killfeedShow}) then
	{
		SET_STATE(_unit,STATE_INCAPACITATED);
	}
	else
	{
		SET_STATE_XTRA(_unit,STATE_INCAPACITATED,_source);
	};
};