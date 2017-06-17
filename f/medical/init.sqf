// F3 - SimpleWoundingSystem

// ====================================================================================
#include "\a3\functions_f_mp_mark\Revive\defines.inc"

/*
CURRENT STATUS:
* DRAGGING.
	* animations are weird.
	* test all the things + dc while dragging. + wounding while dragging....
	* what if someone starts reviving? => dont do animation changes to dragged unit?

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
* bis revive JIP is broken. maybe only because of me => test in new mission => maybe we have to go back to sws
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

* test bis revive with zeus and admin tool
	https://feedback.bistudio.com/T85766


*  Vehicles - due to technical limitations, the unconscious state in vehicles is not supported. Players die immediately
   maybe we can add our own damage handler if in vehicle...
   fn_reviveEhDammaged if ! in vehicle => setdamage 0. can we prevent this?
   yes, we can delete and recreate the EH: player setVariable ["bis_revive_ehDammaged", player addEventHandler ["Dammaged",bis_fnc_reviveEhDammaged]];

* Also, I think the respawn button has been and will be still in the pause menu, not sure if that's the case in SWS or if I'm mixing things up

IF server side addon: can we override the old SWS? or just set a variable in description.ext to check if sws is a thing or not. (or just use the normal f_param...sws variable..
https://github.com/darkChozo/fa_crosshair

USE POST INIT in cfgfunctions instead of init.sqf for some things

TEST
test if downed units can drag others.
(all the tests from modified sws todo list)

what happens if a dragging unit gets downed?



*/
params ["_unit"];
diag_log "adding to local start";
if (!hasInterface) exitWith {};



//set our own event handler: (to allow special handling of vehicles, and to remove the force-respawn action)
[] spawn {
	waitUntil {sleep 1; (player getVariable ["bis_revive_ehDammaged", -1]) != -1};

    diag_log "waitUntil done";
	private _ehID = player getVariable ["bis_revive_ehDammaged", -1];
	if (_ehID != -1) then {

    diag_log "removing old";
		player removeEventHandler ["Dammaged", _ehID];
	};

    diag_log "adding new";
	player setVariable ["bis_revive_ehDammaged", player addEventHandler ["Dammaged", f_fnc_reviveEhDammaged]];
    
};
//drag action:
[player] remoteExec ["f_fnc_addDragAction", 0, player];

