/* ws_fnc_taskDefend
Latest: 11.10.2013
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Thanks to Black Mamba for the idea/concept

FEATURE
Makes a group find a position providing overwatch over the the parsed position. If enemy approaches the trigger or comes to close to the hiding group they start engaging.

USAGE
Minimal:
[group,position] call ws_fnc_taskAmbush;
Full:
[group,position,radius] call ws_fnc_taskAmbush;

PARAMETERS
1. The ambush group                     | MANDATORY
2. The position to be ambushed  | MANDATORY
3. The max radius in which to find a good ambush spot | OPTIONAL (default: 400)
*/

if !(ws_game_a3) exitWith {["ws_fnc_taskAmbush DBG: Game version: ",[_game]," Must be ARMA 3!"] call ws_fnc_debugtext};

private ["_grp","_pos","_nPos","_radius","_mindis","_side","_sidesEnemy","_wp"];

_count = count _this;
_grp = _this select 0;
_pos = _this select 1;

_radius = 400; if (_count > 2) then {_radius = _this select 2;};
_mindis = 100;

if (_mindis > _radius) then {_radius = _mindis * 4};

_side = side _grp;
_sidesEnemy = _side call BIS_fnc_enemySides;

_nPos = [_pos, _radius, _mindis, 10] call BIS_fnc_findOverwatch;
_wp = _grp addWaypoint [_npos,0];
_wp setWaypointType "move";
_grp setCurrentWaypoint _wp;

_wp = [_grp,_nPos,["HOLD",0],["STEALTH","GREEN","NORMAL"]] call ws_fnc_addWaypoint;

{
                _trg = createTrigger ["EmptyDetector", _pos];
                _trg setTriggerArea [75,75,0,false];
                _trg setTriggerActivation [str(_x), "PRESENT", false];
                _trg setTriggerStatements ["this", "", ""];
                _trg setTriggerType "SWITCH";
                _trg synchronizeTrigger [_wp];

                 _trg = createTrigger ["EmptyDetector", _nPos];
                _trg setTriggerArea [20,20,0,false];
                _trg setTriggerActivation [str(_x), "PRESENT", false];
                _trg setTriggerStatements ["this", "", ""];
                _trg setTriggerType "SWITCH";
                _trg synchronizeTrigger [_wp];
} forEach _sidesEnemy;


[_grp,_Pos,["SAD",0],["COMBAT","RED","FULL"]] call ws_fnc_addWaypoint;




true