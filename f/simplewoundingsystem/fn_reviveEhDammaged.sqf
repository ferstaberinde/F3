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

	//incapacitate unit outside of vehicle
	if (!IN_VEHICLE(_unit)) then
	{
		if (isNull _source || {!bis_revive_killfeedShow}) then
		{
			SET_STATE(_unit,STATE_INCAPACITATED);
		}
		else
		{
			SET_STATE_XTRA(_unit,STATE_INCAPACITATED,_source);
		};

		//remove force-"respawn" action
		if (f_wound_disallowForceRespawn) then {
			[] spawn {
				private _time = time + 10; //only wait for 10 seconds to avoid stacked threads
				waitUntil {sleep 0.05; (player getVariable [VAR_ACTION_ID_RESPAWN,-1] != -1) || (time > _time) };
				//remove user action
				private _actionID = player getVariable [VAR_ACTION_ID_RESPAWN,-1];
				if (_actionID != -1) then {
					[player,_actionID] call bis_fnc_holdActionRemove;
					player setVariable [VAR_ACTION_ID_RESPAWN,-1];
				};
				//reset 'forcing respawn' flags
				if (IS_FORCING_RESPAWN(player)) then {SET_FORCING_RESPAWN(player, false);};
			};
		};
	}
	//kill unit in vehicle
	else
	{
		_unit setDamage 1;
	};
};
