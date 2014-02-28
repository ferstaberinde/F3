/* ws_fnc_taskLand
Latest: XX.02.2014
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
Thanks to Head Mamba for the concept

FEATURE
Prompts a Helicopter to land a certain location. It will ignore enemy fire as best as possible.
If it has units in cargo it'll wait until all are out, if it is empty,
it'll wait for the designated time or until all cargo seats are filled.

RETURNS
true - after helicopter has taken off again

USAGE
Minimal:
[helicopter,landing position,extract position] spawn ws_fnc_taskLand;
Full:
[helicopter,landing position,extract position,wait time] spawn ws_fnc_taskLand;

PARAMETERS
1. The helicopter                              | MANDATORY
2. The position to land on                     | MANDATORY - can be marker, object or positional array
3. The position to move to after landing       | MANDATORY - can be marker, object or positional array
4. The max. time to wait after touching ground | OPTIONAL - should be integer (default: 15s)

NOTE
If no extract if given and there's no WP in line, the helo will simply hover over the landing area.

EXAMPLE
[vehicle (leader group this),position this,"mkrExtract"] spawn ws_fnc_taskLand; - in the on Act. Field of a WP this would cause the helicopter to land at the WP's center and then move to the marker named "mkrExtract". It's suggested to give the WP an activation radius of at least 200.

TODO
use BIS_fnc_findSafePos to avoid slopes
Count remaining waypoints and set next one active
*/

if !(ws_game_a3) exitWith {["ws_fnc_taskLand DBG:",[]," Must be ARMA 3!"] call ws_fnc_debugtext};

private ["_debug","_helo","_pos","_wait","_pilot","_grp","_hp"];

// Debug. If ws_debug is globally defined it overrides _debug
_debug = false;  if !(isNil "ws_debug") then {_debug = ws_debug};

// Parse parameters
_helo = _this select 0;
_pos = (_this select 1) call ws_fnc_getEpos;
_extract = (_this select 2) call ws_fnc_getEPos;
_wait = if (count _this > 3) then {_this select 3} else {15};

{[_x,["OBJECT"],"ws_fnc_createGarrison"] call ws_fnc_typecheck;} forEach [_helo];
{[_x,["SCALAR"],"ws_fnc_createGarrison"] call ws_fnc_typecheck;} forEach [_wait];
{[_x,["ARRAY"],"ws_fnc_createGarrison"] call ws_fnc_typecheck;} forEach [_pos,_extract];

if !(_helo isKindOf "Helicopter") exitWith {["ws_fnc_taskLand DBG:",[_helo]," Must be a helicopter!"] call ws_fnc_debugtext};

// Set other variables
_pilot = driver _helo;
_grp = group _pilot;

// Create an invisible helipad at location
_hp = "Land_HelipadEmpty_F" createVehicle _pos;

// Get helicopter to move towards the position
_helo doMove _pos;

// Wait until the helo is within 150 m of the landing zone
while {(getPosATL _helo) distance _pos > 150} do {
    sleep 1;
    if (ws_debug) then {["ws_fnc_taskLand DBG: Waiting for ",[_helo]," to be in distance"] call ws_fnc_debugtext};
};

// Set up helicopter
// doStop _helo;
_pilot disableai "AUTOTARGET"; _pilot disableai "TARGET";
_pilot setCombatMode "BLUE"; _pilot setBehaviour "CARELESS";
_pilot allowFleeing 0;
_grp enableAttack false;

// Begin landing
while { ( (alive _helo ) && !(unitReady _helo ) ) } do
{
   sleep 1;
   if (ws_debug) then {["ws_fnc_taskLand DBG: Waiting for ",[_helo]," to be ready"] call ws_fnc_debugtext};
};
if (alive _helo ) then
{
  _helo land "GET OUT";
  if (ws_debug) then {["ws_fnc_taskLand DBG:",[_helo]," landing."] call ws_fnc_debugtext};
};

waituntil {isTouchingGround  _helo};
if (ws_debug) then {["ws_fnc_taskLand DBG:",[_helo]," touched ground."] call ws_fnc_debugtext};

// Prevent helo from taking off
//_pilot disableAI "move";

// If cargo is onboard wait until all are out
if (count (assignedCargo _helo) > 0) then {
    if (ws_debug) then {["ws_fnc_taskLand DBG:",[_helo]," waiting for cargo to get out."] call ws_fnc_debugtext};

    {
        doGetOut  _x;
        unassignVehicle _x
    } foreach assignedCargo _helo;

    sleep 1;

    waituntil {_helo emptyPositions "Cargo" == (getNumber(configfile >> "CfgVehicles" >> typeof _helo >> "transportSoldier"))};

// Otherwise wait until the designated time or all seats are filled
} else {
    if (ws_debug) then {["ws_fnc_taskLand DBG:",[_helo,_wait]," waiting designated time."] call ws_fnc_debugtext};
    for "_i" from 1 to _wait do {
        if (_helo  emptyPositions "Cargo" == 0) exitWith {};
        sleep 1;
    };
};

// Take off
if (ws_debug) then {["ws_fnc_taskLand DBG:",[_helo]," taking off."] call ws_fnc_debugtext};

//_pilot enableAI "move";
_helo land "NONE";
_helo doMove _extract;
_grp setSpeedMode "FULL";
deleteVehicle _hp;

true