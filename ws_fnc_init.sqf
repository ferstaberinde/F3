/* ws_fnc_init
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Compile all WS_fnc for Arma 2

USAGE (ARMA 2)
Use Call compile preprocessFile "ws_fnc\fn_init.sqf" from either a unit or module init.

NOTE (ARMA 3)
In Arma3 This file only controls the global debug flag ws_debug. It is not necessary to call seperately.
*/

//Check if the functions are already compiled
if (isNil "ws_fnc_compiled") then {ws_fnc_compiled = false};
if (ws_fnc_compiled) exitWith {};

// DEBUG
// To enable debug mode either change false to true or put ws_debug = true in any unit init
ws_debug = missionNameSpace getVariable ["ws_debug",false];

// Check if A3 is running

if (isNil "ws_game_a3") then {
	ws_fnc_gameCheck = call compile preprocessFile "ws_fnc\tools\fn_gamecheck.sqf";
};

// Compile functions for Arma 2
if !(ws_game_a3) then {
	if (isnil "bis_fnc_init") then {_fm = createGroup sideLogic;_fm createUnit ["FunctionsManager", [0,0,0], [],0,"NONE"];};

	//Debug Functions
	ws_fnc_debugText = compile preprocessFile "ws_fnc\dbg\fn_debugText.sqf";
	ws_fnc_clipBoardCode = compile preprocessFile "ws_fnc\dbg\fn_clipBoardCode.sqf";
	ws_fnc_countUnits = compile preprocessFile "ws_fnc\dbg\fn_countUnits.sqf";
	ws_fnc_debugText = compile preprocessFile "ws_fnc\dbg\fn_debugText.sqf";
	ws_fnc_typecheck = compile preprocessFile "ws_fnc\dbg\fn_typecheck.sqf";
	call compile preprocessFile "ws_fnc\dbg\fn_debugTriggers.sqf";

	//Tool Functions
	ws_fnc_selectRandom = compile preprocessfile "ws_fnc\tools\fn_selectRandom.sqf";
	ws_fnc_collectMarkers =  compile preprocessfile "ws_fnc\tools\fn_collectMarkers.sqf";
	ws_fnc_collectObjects =  compile preprocessfile "ws_fnc\tools\fn_collectObjects.sqf";
	ws_fnc_collectObjectsNum =  compile preprocessfile "ws_fnc\tools\fn_collectObjectsNum.sqf";
	ws_fnc_collectBuildings =  compile preprocessfile "ws_fnc\tools\fn_collectBuildings.sqf";
	ws_fnc_loadVehicle = compile preprocessfile "ws_fnc\tools\fn_loadVehicle.sqf";
	ws_fnc_listPlayers = compile preprocessfile "ws_fnc\tools\fn_listPlayers.sqf";
	ws_fnc_nearPlayer = compile preprocessfile "ws_fnc\tools\fn_nearPlayer.sqf";
	ws_fnc_setGVar = compile preprocessfile "ws_fnc\tools\ws_fnc_setGVar";

	//Misc Functions
	ws_fnc_switchLights = compile preprocessfile "ws_fnc\misc\fn_switchLights.sqf";
	ws_fnc_attachLight = compile preprocessfile "ws_fnc\misc\fn_attachLight.sqf";

	//GetPos Functions
	ws_fnc_getPos = compile preprocessfile "ws_fnc\getPos\fn_getPos.sqf";
	ws_fnc_NearestRoadPos = compile preprocessfile "ws_fnc\getPos\fn_NearestRoadPos.sqf";
	ws_fnc_NearestLandPos = compile preprocessfile "ws_fnc\getPos\fn_NearestLandPos.sqf";
	ws_fnc_getPosInArea = compile preprocessfile "ws_fnc\getPos\fn_getPosInArea.sqf";
	ws_fnc_getBPos = compile preprocessfile "ws_fnc\getPos\fn_getBPos.sqf";
	ws_fnc_getEPos = compile preprocessfile "ws_fnc\getPos\fn_getEPos.sqf";

	//AI Functions
	ws_fnc_enterBuilding = compile preprocessfile "ws_fnc\AI\fn_enterBuilding.sqf";
	ws_fnc_taskDefend = compile preprocessfile "ws_fnc\AI\fn_taskDefend.sqf";
	ws_fnc_taskCrew = compile preprocessfile "ws_fnc\AI\fn_taskCrew.sqf";
	ws_fnc_createGroup = compile preprocessfile "ws_fnc\AI\fn_createGroup.sqf";
	ws_fnc_createVehicle = compile preprocessfile "ws_fnc\AI\fn_createVehicle.sqf";
	ws_fnc_createGarrison = compile preprocessfile "ws_fnc\AI\fn_createGarrison.sqf";
	ws_fnc_addWaypoint = compile preprocessfile "ws_fnc\AI\fn_addWaypoint.sqf";
	ws_fnc_bettervehicle = compile preprocessfile "ws_fnc\AI\fn_betterVehicle.sqf";
	ws_fnc_setAIMode = compile preprocessfile "ws_fnc\AI\fn_setAIMode.sqf";
};

ws_fnc_compiled = true;