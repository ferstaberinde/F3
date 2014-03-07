/* ws_fnc_taskAmbush
Latest: 07.03.2014
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Thanks to Black Mamba for the idea/concept

FEATURE
Group will move to a hiding spot overwatching the parsed position.
If enemy units enter the area around the parsed position (i.e. the killzone) or come too close to the hiding spot, the group will go active and engage.

USAGE
Minimal:
[group,position] call ws_fnc_taskAmbush;
Full:
[group,position, killzone (array), radius, minimal distance] call ws_fnc_taskAmbush;

PARAMETERS
1. The ambush group                                                                | MANDATORY
2. The position to be ambushed                                                     | MANDATORY - can be marker, object, group or positional array
3. The killzone in [x,y]around the position (if enemies enter, the group engages)  | OPTIONAL (default: [50,50])
4. The radius in which to find a spot overlooking the ambush site                  | OPTIONAL (default: 400)
5. The minimal distance the overwatch has to be from the ambush location           | OPTIONAL (default: 100)
*/

if !(ws_game_a3) exitWith {["ws_fnc_taskAmbush DBG:",[]," Must be ARMA 3!"] call ws_fnc_debugtext};

private ["_debug","_grp","_pos","_nPos","_killzone","_radius","_mindis","_side","_sidesEnemy","_wp","_mkr"];

// Debug. If ws_debug is globally defined it overrides _debug
_debug = if !(isNil "ws_debug") then {ws_debug} else {false};

_count = count _this;
_grp = _this select 0;
_pos = (_this select 1) call ws_fnc_getEpos;

_killzone = if (_count > 2) then {_this select 2} else {[50,50]};
_radius = if (_count > 3) then {_this select 3} else {400};
_mindis = if (_count > 4) then {_this select 4} else {100};

if (_mindis > _radius) then {_radius = _mindis * 4};

// Get enemy sides
_side = side _grp;
_sidesEnemy = _side call BIS_fnc_enemySides;

// Get a position overwatching the ambush point
_nPos = [_pos, _radius, _mindis, 10] call BIS_fnc_findOverwatch;


// Get group to move to overwatch position
_wp = [_grp,_nPos] call ws_fnc_addWaypoint;
_grp setCurrentWaypoint _wp;

// Set group to go stealth at overwatch position
_wp = [_grp,_nPos,["HOLD",0],["STEALTH","GREEN","NORMAL"]] call ws_fnc_addWaypoint;

// Create switch triggers for each enemy side and synch them to overwatch-hold waypoint
{
    _trg = createTrigger ["EmptyDetector", _pos];
    _trg setTriggerArea [_killzone select 0,_killzone select 1,0,false];
    _trg setTriggerActivation [str(_x), "PRESENT", false];
    _trg setTriggerStatements ["this", "", ""];
    _trg setTriggerType "SWITCH";
    _trg synchronizeTrigger [_wp];

    _trg = createTrigger ["EmptyDetector", _nPos];
    _trg setTriggerArea [25,25,0,false];
    _trg setTriggerActivation [str(_x), "PRESENT", false];
    _trg setTriggerStatements ["this", "", ""];
    _trg setTriggerType "SWITCH";
    _trg synchronizeTrigger [_wp];
} forEach _sidesEnemy;

// Create attack waypoint (becomes active once trigger flips)
// [_grp,_Pos,["SAD",0],["COMBAT","RED","FULL"]] call ws_fnc_addWaypoint;

// If debug's enabled, place markers
if (_debug) then {
    _mkr = createMarker [format ["%1-pos",_pos],_pos];_mkr setMarkerSize [0.5,0.5];_mkr setMarkerType "mil_ambush";_mkr setMarkerColor "ColorRed"; _mkr setMarkerText format ["Ambush %1",_grp];
    _mkr = createMarker [format ["%1-npos",_npos],_npos];_mkr setMarkerSize [0.5,0.5];_mkr setMarkerType "mil_flag";_mkr setMarkerColor "ColorRed"; _mkr setMarkerText format ["Overwatch %1",_grp];
    _mkr = createMarker [format ["%1-kpos",_pos],_pos];_mkr setMarkerShape "ELLIPSE"; _mkr setMarkerSize _killzone; _mkr setMarkerBrush "SOLIDBORDER";_mkr setMarkerColor "ColorRed";
};

true