// F3 - SimpleWoundingSystem

// ====================================================================================
#include "\a3\functions_f_mp_mark\Revive\defines.inc"

/*
CURRENT STATUS:
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
* bis revive JIP is broken. maybe only because of me => test in new mission => maybe we have to go back to sws
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

* test bis revive with zeus and admin tool
	https://feedback.bistudio.com/T85766


TEST
test if downed units can drag others.

what happens if a dragging unit gets downed?

*/
params ["_unit"];
if (!hasInterface) exitWith {};



//set our own event handler: (to allow special handling of vehicles, and to remove the force-respawn action)
[] spawn {
	waitUntil {sleep 1; (player getVariable ["bis_revive_ehDammaged", -1]) != -1};

	private _ehID = player getVariable ["bis_revive_ehDammaged", -1];
	if (_ehID != -1) then {
		player removeEventHandler ["Dammaged", _ehID];
	};

	player setVariable ["bis_revive_ehDammaged", player addEventHandler ["Dammaged", f_fnc_reviveEhDammaged]];
    
};
//drag action:
[player] remoteExec ["f_fnc_addDragAction", 0, player];

F_UncCC = ppEffectCreate ["ColorCorrections", 1603];
F_UncCC ppEffectEnable false;
