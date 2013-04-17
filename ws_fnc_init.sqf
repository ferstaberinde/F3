//Global vars used by all functions
ws_debug = false; //Set this to true for debug markers and messages from all functions

// Create the functions module if it isn't present
if (isnil "bis_fnc_init") then {_fm = createGroup sideLogic;_fm createUnit ["FunctionsManager", [0,0,0], [],0,"NONE"];};

//Functions for all clients
ws_fnc_selectrandom = {_selection = _this select (floor (random (count _this)));_selection};
call compile preprocessfile "ws_fnc\ws_fnc_debug.sqf";

if !(isServer) exitWith {};

// This code can be removed if units from the corresponding side are already in the mission before the function is called the first time.
// (see http://community.bistudio.com/wiki/createCenter)
_sideHQWest = createCenter west;
_sideHQEast = createCenter east;
_sideHQRes  = createCenter resistance;

//Serverside functions
call compile preprocessfile "ws_fnc\ws_fnc_helper.sqf";
ws_fnc_getPos = compile preprocessfile "ws_fnc\ws_fnc_getPos.sqf";
ws_fnc_addWaypoint = compile preprocessfile "ws_fnc\ws_fnc_addWaypoint.sqf";
ws_fnc_taskDefend = compile preprocessfile "ws_fnc\ws_fnc_taskDefend.sqf";
ws_fnc_bettervehicle = compile preprocessfile "ws_fnc\ws_fnc_betterVehicle.sqf";
ws_fnc_createGroup = compile preprocessfile "ws_fnc\ws_fnc_createGroup.sqf";
ws_fnc_createVehicle = compile preprocessfile "ws_fnc\ws_fnc_createVehicle.sqf";

