//Don't use this file if you're initializing the scripts through the description.ext

ws_debug = true; //Set this to true for debug markers and messages from all functions

//Let's check if the functions are already compiled
if (isNil "ws_fnc_compiled") then {ws_fnc_compiled = false} else {exitWith {}};

//Let's check whether we're running A3 or A2:OA/CO
ws_fnc_gameCheck = compile preprocessFiles "ws_fnc\ws_fnc_gamecheck.sqf";

_game = [] call ws_fnc_gamecheck.sqf;
if (_game == "a2") then {
	compile preprocessFileLineNumbers "ws_fnc\BIS\bis_fnc_param";
	compile preprocessFileLineNumbers "ws_fnc\BIS\bis_fnc_error";

	if (isnil "bis_fnc_init") then {_fm = createGroup sideLogic;_fm createUnit ["FunctionsManager", [0,0,0], [],0,"NONE"];};
};

//Functions for all clients
ws_fnc_selectRandom = compile preprocessfile "ws_fnc\ws_fnc_selectRandom.sqf";
call compile preprocessfile "ws_fnc\ws_fnc_debug.sqf";

if !(isServer) exitWith {};

//Serverside functions
ws_fnc_enterBuilding = compile preprocessfile "ws_fnc\ws_fnc_enterBuildings.sqf";
ws_fnc_taskDefend = compile preprocessfile "ws_fnc\ws_fnc_taskDefend.sqf";
ws_fnc_getPos = compile preprocessfile "ws_fnc\ws_fnc_getPos.sqf";
ws_fnc_getBPos = compile preprocessfile "ws_fnc\ws_fnc_getBPos.sqf";
ws_fnc_addWaypoint = compile preprocessfile "ws_fnc\ws_fnc_addWaypoint.sqf";
ws_fnc_taskDefend = compile preprocessfile "ws_fnc\ws_fnc_taskDefend.sqf";
ws_fnc_bettervehicle = compile preprocessfile "ws_fnc\ws_fnc_betterVehicle.sqf";
ws_fnc_createGroup = compile preprocessfile "ws_fnc\ws_fnc_createGroup.sqf";
ws_fnc_createVehicle = compile preprocessfile "ws_fnc\ws_fnc_createVehicle.sqf";
ws_fnc_switchLights = compile preprocessfile "ws_fnc\ws_fnc_switchLights.sqf";

ws_fnc_compiled = true; publicVariable "ws_fnc_compiled";