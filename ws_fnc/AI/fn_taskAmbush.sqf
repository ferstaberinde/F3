/* ws_fnc_taskAmbush
Latest: 07.03.2014
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Thanks to Black Mamba for the idea/concept

FEATURE
Group will move to a hiding spot overwatching the parsed position.
If enemy units enter the area around the parsed position (i.e. the killzone) or come too close to the hiding spot, the group will go active and engage.

USAGE
Minimal:
[group,position] spawn ws_fnc_taskAmbush;
Full:
[group,position, killzone (array), overwatch radius (array)] spawn ws_fnc_taskAmbush;

PARAMETERS
1. The ambush group                                                 | MANDATORY
2. The position to be ambushed                                      | MANDATORY - can be marker, trigger, group or positional array
3. The killzone in [x,y,angle,rectangle(bool)] around the position  | OPTIONAL (default: If marker or trigger was passed as position use their area, otherwise [50,50,0,false])
4. The minimal distance and radius in which to find an overlook     | OPTIONAL (default: [100,300] - if left empty ([]) the group will stay where they are)

EXAMPLES
A) nul = [group this,TrgAmbush] spawn ws_fnc_taskAmbush in Waypoint onAct: group will ambush enemies entering killzone as indicated by Trigger named TrgAmbush and look for a decent overwatch spot
B) nul = [group this,RoadBlockObj,[],[]] spawn ws_fnc_taskAmbush in Waypoint onAct: group will ambush enemies nearing the object named RoadBlockObj within a radius of 50m. They will use the waypoint position as overwatch spot
C) nul = [MyGroup,MyGroup] spawn ws_fnc_taskAmbush: The group named MyGroup will ambush enemies nearing the position where they were spawned, using the default killzone size. They will find their own overwatch spot. This method can be useful for dynamically spawned groups.
*/

if !(ws_game_a3) exitWith {["ws_fnc_taskAmbush DBG:",[]," Must be ARMA 3!"] call ws_fnc_debugtext};

private ["_debug","_grp","_pos","_nPos","_killzone","_radius","_mindis","_sidesEnemy","_wp","_mkr","_count","_ambush","_owatch","_npos","_trg"];

// Debug. If ws_debug is globally defined it overrides _debug
_debug = if !(isNil "ws_debug") then {ws_debug} else {false};

// Interpret arguments
_count = count _this;
_grp = _this select 0;
_ambush = _this select 1;
_killzone = if (_count > 2) then [{_this select 2},{[]}];
_owatch = if (_count > 3) then [{_this select 3},{[100,300]}];

// Get positions for group and ambush location
_pos = _ambush call ws_fnc_getEPos;
_npos = _grp call ws_fnc_getEPos;

// If killzone is not forced, get values from ambush position
if (count _killzone == 0) then {
        _killzone =
        switch (typeName _ambush) do {
            // Trigger:
            case ("OBJECT"): {triggerarea _ambush};
            // Marker:
            case ("STRING"): {
                                private ["_form"];
                                _ambush setMarkerAlpha 0;
                                _form =
                                switch (MarkerShape _ambush) do {
                                    case "RECTANGLE": {true};
                                    case "ELLIPSE": {false};
                                    default {true};
                                };
                                [(getMarkerSize _ambush select 0),(getMarkerSize _ambush select 1),markerDir _ambush,_form];
                            };
            // Default:
            default {[50,50,0,false]};
    };
};

// If overwatch is enabled, get a good overwatch position
if (count _owatch > 0) then {
    _mindis = _owatch select 0;
    _radius = _owatch select 1;

    if (_mindis > _radius) then {_radius = _mindis * 4};

    // Get a position overwatching the ambush point
    _nPos = [_pos, _radius, _mindis, 10] call BIS_fnc_findOverwatch;
};

// Get group to move to overwatch position
_wp = _grp addWaypoint [_npos,0];
_grp setCurrentWaypoint _wp;

// Get enemy sides
_sidesEnemy = (side _grp) call BIS_fnc_enemySides;

// Set group to go stealth at overwatch position
_wp = [_grp,_nPos,["HOLD",0,10],["STEALTH","GREEN","NORMAL"]] call ws_fnc_addWaypoint;

// Create switch triggers for each enemy side and synch them to the overwatch waypoint
{
    _trg = createTrigger ["EmptyDetector", _pos];
    _trg setTriggerArea _killzone;
    _trg setTriggerActivation [str(_x), "PRESENT", false];
    _trg setTriggerStatements ["this", "{_grp reveal [_x,4]} forEach thisList", ""];
    _trg setTriggerType "SWITCH";
    _trg synchronizeTrigger [_wp];

    _trg = createTrigger ["EmptyDetector", _nPos];
    _trg setTriggerArea [25,25,0,false];
    _trg setTriggerActivation [str(_x), "PRESENT", false];
    _trg setTriggerStatements ["this", "{_grp reveal [_x,4]} forEach thisList", ""];
    _trg setTriggerType "SWITCH";
    _trg synchronizeTrigger [_wp];
} forEach _sidesEnemy;

// Create attack waypoint (becomes active once trigger flips)
(units _grp) doWatch _pos;
_wp = [_grp,_pos,["SAD",0],["AWARE","RED","FULL"]] call ws_fnc_addWaypoint;

// If debug's enabled, place markers
if (_debug) then {
    _mkr = createMarker [format ["%1-pos",_pos],_pos];_mkr setMarkerSize [0.5,0.5];_mkr setMarkerType "mil_ambush";_mkr setMarkerColor "ColorRed"; _mkr setMarkerText format ["Ambush %1",_grp];
    _mkr = createMarker [format ["%1-npos",_npos],_npos];_mkr setMarkerSize [0.5,0.5];_mkr setMarkerType "mil_flag";_mkr setMarkerColor "ColorRed"; _mkr setMarkerText format ["Overwatch %1",_grp];
    _mkr = createMarker [format ["%1-kpos",_pos],_pos];if (_killzone select 3) then [{_mkr setMarkerShape "RECTANGLE"},{_mkr setMarkerShape "ELLIPSE"}]; _mkr setMarkerSize [_killzone select 0,_killzone select 1]; _mkr setMarkerBrush "SOLIDBORDER";_mkr setMarkerColor "ColorRed"; _mkr setMarkerDir (_killzone select 2);
};

true