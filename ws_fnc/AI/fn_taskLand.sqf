/* ws_fnc_taskLand
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Based on a script made by Head

FEATURE
Prompts a Helicopter to land a certain location. It will ignore enemy fire as best as possible.
If it has units in cargo it'll wait until all are out, if it is empty,
it'll wait for the designated time or until all cargo seats are filled.
Afterwards it will move to the designated location.

RETURNS
true - after helicopter has taken off again

NOTE
Function should only be spawned where helicopter is local

USAGE
Minimal:
[helicopter,landing position] spawn ws_fnc_taskLand;
Full:
[helicopter,landing position,wait time,extract position] spawn ws_fnc_taskLand;

PARAMETERS
1. The helicopter                              | MANDATORY
2. The position to land on                     | MANDATORY - can be marker, object or positional array
3. The max. time to wait after touching ground | OPTIONAL - any number (default: 15s)
4. The position to move to after landing       | OPTIONAL - can be marker, object or positional array (default: helo starting position)

EXAMPLE
[VehAAF_H,"mkrLand"] spawn ws_fnc_taskLand; - would cause the helicopter named "VehAAF_H" to take off, fly towards the marker named "mkrLand" and move back to it's starting spot

nul = [vehicle (leader group this),position this,30,"mkrExtract"] spawn ws_fnc_taskLand; - in the on Act. Field of a WP would cause the helicopter to land at the WP's center, wait for up to 30s and then move to the marker named "mkrExtract". I'd suggest to give the WP an activation radius of at least 200.
*/

if !(ws_game_a3) exitWith {["ws_fnc_taskLand:",[]," Must be ARMA 3!"] call ws_fnc_debugtext};

private ["_debug","_helo","_pos","_wait","_extract","_pilot","_grp","_hp","_wp"];

// Debug. If ws_debug is globally defined it overrides _debug
_debug = false;  if !(isNil "ws_debug") then {_debug = ws_debug};

// Parse parameters
_helo = _this select 0;
_pos = (_this select 1) call ws_fnc_getEpos;
_wait = if (count _this > 2) then [{_this select 2},{15}];
_extract = if (count _this > 3) then [{_this select 3},{getPosATL _helo}];

{[_x,["OBJECT"],"ws_fnc_taskLand"] call ws_fnc_typecheck;} forEach [_helo];
{[_x,["SCALAR"],"ws_fnc_taskLand"] call ws_fnc_typecheck;} forEach [_wait];
{[_x,["ARRAY"],"ws_fnc_taskLand"] call ws_fnc_typecheck;} forEach [_pos];

if !(_helo isKindOf "Helicopter") exitWith {["ws_fnc_taskLand:",[_helo]," must be a helicopter!"] call ws_fnc_debugtext};

// Set other variables
_pilot = driver _helo;
_grp = group _pilot;

// Exit if the helicopter is called where it isn't local
if !(local _pilot) exitWith {
    if (_debug) then {["ws_fnc_taskLand: Helo ",[_helo]," is not local!"] call ws_fnc_debugtext};
};

// Get helicopter to move towards the position
_helo doMove _pos;

// Wait until the helo is within 150 m of the landing zone
while {canMove _helo  && (alive _helo ) && (getPosATL _helo) distance _pos > 150} do {
    sleep 1;
    if (_debug) then {["ws_fnc_taskLand: Waiting for ",[_helo]," to be in distance"] call ws_fnc_debugtext};
};

//If helo has been downed exit script, otherwise begin landing
if (!canMove _helo || !alive _helo || !alive _pilot) exitWith {
    if (_debug) then {["ws_fnc_taskLand: Helo or Pilot: ",[_helo,_pilot]," dead or immobile, exiting"] call ws_fnc_debugtext};
};

// Set up helicopter
// NOTE: experiment with dis-/enabling stuff here, to achieve the ideal landing w/o gimping AI too much
_pilot disableai "AUTOTARGET"; _pilot disableai "TARGET";
_grp enableAttack false;
//_pilot setBehaviour "CARELESS";
_pilot allowFleeing 0;

// Create an invisible helipad at a good location for the helicopter
_hp = "Land_HelipadEmpty_F" createVehicleLocal (_pos findEmptyPosition [0,100,typeOf _helo]);

// Begin landing
while {canMove _helo  && alive _helo && !(unitReady _helo)} do
{
   sleep 1;
   if (_debug) then {["ws_fnc_taskLand: Waiting for ",[_helo]," to be ready"] call ws_fnc_debugtext};
};

//If helo has been downed exit script, otherwise begin landing
if (!canMove _helo || !alive _helo || !alive _pilot) exitWith {
    if (_debug) then {["ws_fnc_taskLand: Helo or Pilot: ",[_helo,_pilot]," dead or immobile, exiting"] call ws_fnc_debugtext};
};

_helo land "GET IN";

if (_debug) then {["ws_fnc_taskLand:",[_helo]," landing."] call ws_fnc_debugtext};

waituntil {isTouchingGround _helo};
if (_debug) then {["ws_fnc_taskLand:",[_helo]," touched ground."] call ws_fnc_debugtext};

// If cargo is onboard wait until all are out
if (count (assignedCargo _helo) > 0) then {
    if (_debug) then {["ws_fnc_taskLand:",[_helo]," waiting for cargo to get out."] call ws_fnc_debugtext};

    {
        doGetOut  _x;
        unassignVehicle _x
    } foreach assignedCargo _helo;

    sleep 1;

    waituntil {_helo emptyPositions "Cargo" == (getNumber(configfile >> "CfgVehicles" >> typeof _helo >> "transportSoldier"))};

// Otherwise wait until the designated time or all seats are filled
} else {
    if (_debug) then {["ws_fnc_taskLand:",[_helo,_wait]," waiting designated time."] call ws_fnc_debugtext};
    for "_i" from 1 to _wait do {
        if (_helo  emptyPositions "Cargo" == 0) exitWith {};
        sleep 1;
    };
};

// Take off
if (_debug) then {["ws_fnc_taskLand:",[_helo]," taking off."] call ws_fnc_debugtext};

_helo land "NONE";
_wp = [_grp,_extract,["TR UNLOAD"]] call ws_fnc_addWayPoint;
_grp setCurrentWaypoint _wp;
deleteVehicle _hp;

// Re-Enable normal pilot behaviour
_pilot enableai "AUTOTARGET"; _pilot enableai "TARGET";
_grp enableAttack true;

true