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
	//award attacker with +1 'infantry kill' point
	[_source] spawn bis_fnc_reviveAwardKill;

	//incapacitate unit outside of vehicle
	if (!IN_VEHICLE(_unit)) then
	{
		if (isNull _source || {!bis_revive_killfeedShow}) then
		{
			SET_STATE(_unit,STATE_INCAPACITATED);
            diag_log format ["setting incapped outside damage: %1",_this];
		}
		else
		{
			SET_STATE_XTRA(_unit,STATE_INCAPACITATED,_source);
            diag_log format ["setting incapped outside damage: %1",_this];
		};

		//tell others that we are draggable
		[_unit ] spawn {
		    _unit = _this select 0;
		    waitUntil{ sleep 0.1; animationState _unit ==  "unconsciousrevivedefault"};
		    _unit setVariable ["f_wound_draggable", true, true];
		    waitUntil{ sleep 0.1; animationState _unit !=  "unconsciousrevivedefault"};
		    _unit setVariable ["f_wound_draggable", false, true];
		};

		//remove force-"respawn" action
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
	}
	//kill unit in vehicle
	else
	{

	    F_UncCC = ppEffectCreate ["ColorCorrections", 1603];
	    F_UncCC ppEffectEnable true;
        F_UncCC ppEffectAdjust [
            0,
            1,
            0,
            0, 0, 0, 0,
            1, 1, 1, 1,
            0.299, 0.587, 0.114, 0
        ];
        F_UncCC ppEffectCommit 1;
        oldUnit = player;
        _unit setVariable ["#revDownInVeh", true, true];
        _unit setVariable ["#revOwner", owner _unit, true];
        [_unit, (owner _unit)] remoteExec ["f_fnc_addServerKilledEh", 2];
        diag_log format ["setting incapped damage: %1",_this];
        diag_log format ["event handler %1",_unit getVariable ["f3_revive_ehKilled", -1]];
        _unit playMove ((getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit >> "interpolateTo")) select 0);
        [] spawn {
            sleep 1;
            if(alive player) then {
                _group = group player;
                _unit = player;
                player addMPEventHandler ["mpkilled", f_fnc_reviveEhKilledInVeh];
                _camera = _group createUnit ["VirtualCurator_F", ASLToAGL eyePos player, [], 0, ""];
                selectPlayer _camera;
                [_unit] remoteExecCall ["f_fnc_addEject"];
                _camera attachTo [(vehicle _unit), [0,0,0]];
            }else {
                F_UncCC ppEffectEnable false;
            };



        };

	};
};
