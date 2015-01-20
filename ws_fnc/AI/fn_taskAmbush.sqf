/* ws_fnc_taskAmbush
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Thanks to Black Mamba for the idea/concept

FEATURE
Group will move to a hiding spot overwatching the parsed position.
If enemy units enter the area around the passed trigger (i.e. the killzone) or come too close to the hiding spot, the group will go active and engage.

USAGE
Minimal:
[group,trigger] call ws_fnc_taskAmbush;
Full:
[group,trigger, radius, minimal distance] call ws_fnc_taskAmbush;

PARAMETERS
1. The ambush group                                                         | MANDATORY
2. The killzone as indicated by a trigger                                   | MANDATORY - trigger, it's radius designates the killzone. Condition needs to be "Convoy Side - present", countdown/timeout optional, rest does not matter
3. The radius in which to find a spot overlooking the ambush site          | OPTIONAL (default: 300)
4. The minimal distance the overwatch has to be from the ambush location    | OPTIONAL (default: 100)
*/

if !(ws_game_a3) exitWith {["ws_fnc_taskAmbush DBG:",[]," Must be ARMA 3!"] call ws_fnc_debugtext};

private ["_debug","_grp","_pos","_nPos","_killzone","_radius","_mindis","_wp","_mkr"];

// Debug. If ws_debug is globally defined it overrides _debug
_debug = if !(isNil "ws_debug") then [{ws_debug},{false}];

_count = count _this;
_grp = _this select 0;
_killzone = _this select 1;
_radius = if (_count > 2) then [{_this select 2},{300}];
_mindis = if (_count > 3) then [{_this select 3},{100}];

if (_mindis > _radius) then {_radius = _mindis * 4};

_pos = [_killzone] call ws_fnc_getPosInArea;
// Get a position overwatching the ambush point
_nPos = [_pos, _radius, _mindis, 10] call BIS_fnc_findOverwatch;

// Get group to move to overwatch position
_wp = _grp addWaypoint [_npos,0];
_grp setCurrentWaypoint _wp;

// Set group to go stealth at overwatch position
_wp = [_grp,_nPos,["HOLD",0,10],["STEALTH","BLUE","NORMAL"]] call ws_fnc_addWaypoint;

// Create switch triggers for enemy side and synch them to overwatch-hold waypoint
_killzone setTriggerStatements ["this", "{_grp reveal [_x, 4]}forEach thisList;", ""];
_killzone setTriggerType "SWITCH";
_killzone synchronizeTrigger [_wp];

_trg = createTrigger ["EmptyDetector", _nPos];
_trg setTriggerArea [15,15,0,false];
_trg setTriggerActivation (triggerActivation _killzone);
_trg setTriggerStatements ["this", "{_grp reveal [_x, 4]}forEach thisList;", ""];
_trg setTriggerType "SWITCH";
_trg synchronizeTrigger [_wp];

// Create attack waypoint (becomes active once trigger flips)
[_grp,_Pos,["SAD",0],["AWARE","RED","NORMAL"]] call ws_fnc_addWaypoint;

// If debug's enabled, place markers
if (_debug) then {
    _mkr = createMarker [format ["%1-pos",_pos],_pos];_mkr setMarkerSize [0.5,0.5];_mkr setMarkerType "mil_ambush";_mkr setMarkerColor "ColorRed"; _mkr setMarkerText format ["Ambush %1",_grp];
    _mkr = createMarker [format ["%1-npos",_npos],_npos];_mkr setMarkerSize [0.5,0.5];_mkr setMarkerType "mil_flag";_mkr setMarkerColor "ColorRed"; _mkr setMarkerText format ["Overwatch %1",_grp];
    _mkr = createMarker [format ["%1-kpos",_pos],_pos];_mkr setMarkerShape "ELLIPSE"; _mkr setMarkerSize [(triggerArea _killzone select 0),(triggerArea _killzone select 1)]; _mkr setMarkerDir (triggerArea _killzone select 2); _mkr setMarkerBrush "SOLIDBORDER";_mkr setMarkerColor "ColorRed";
};

true