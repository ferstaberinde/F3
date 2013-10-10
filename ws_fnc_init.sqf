// ws_fnc_init
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
//
/*
FEATURE
Compile all WS_fnc for Arma 2

USAGE (ARMA 2)
Use Call compile preprocess "ws_fnc\ws_fnc_init.sqf" from either the init.sqf or a unit init.

NOTE (ARMA 3)
This file only controls the debug for ws_fnc in ARMA 3. It is not necessary to call it if the description.ext is used.
*/

//DEBUG
 //Set this to true for debug markers and messages from all functions
_debug = true;

//Let's check if the functions are already compiled
if (isNil "ws_fnc_compiled") then {ws_fnc_compiled = false};
if (ws_fnc_compiled) exitWith {};

//Set the global debug flag according to user settings
if (isNil "ws_debug") then {
	ws_debug = _debug;
	publicVariable "ws_debug";
};

ws_fnc_gameCheck = call compile preprocessFile "ws_fnc\tools\ws_fnc_gamecheck.sqf";

if !(ws_game_a3) then {

	if (isnil "bis_fnc_init") then {_fm = createGroup sideLogic;_fm createUnit ["FunctionsManager", [0,0,0], [],0,"NONE"];};

	//Debug Functions
	ws_fnc_debugText = compile preprocessFile "ws_fnc\dbg\ws_fnc_debugText.sqf";
	ws_fnc_clipBoardCode = compile preprocessFile "ws_fnc\dbg\ws_fnc_clipBoardCode.sqf";
	ws_fnc_countUnits = compile preprocessFile "ws_fnc\dbg\ws_fnc_countUnits.sqf";
	ws_fnc_debugText = compile preprocessFile "ws_fnc\dbg\ws_fnc_debugText.sqf";
	ws_fnc_typecheck = compile preprocessFile "ws_fnc\dbg\ws_fnc_typecheck.sqf";
	call compile preprocessFile "ws_fnc\dbg\ws_fnc_debugTriggers.sqf";

	//Misc Functions
	ws_fnc_selectRandom = compile preprocessfile "ws_fnc\tools\ws_fnc_selectRandom.sqf";
	ws_fnc_switchLights = compile preprocessfile "ws_fnc\tools\ws_fnc_switchLights.sqf";
	ws_fnc_attachLight = compile preprocessfile "ws_fnc\tools\ws_fnc_attachLight.sqf";
	ws_fnc_loadGroups = compile preprocessfile "ws_fnc\tools\ws_fnc_loadGroups.sqf";

	//GetPos Functions
	ws_fnc_getPos = compile preprocessfile "ws_fnc\getPos\ws_fnc_getPos.sqf";
	ws_fnc_NearestRoadPos = compile preprocessfile "ws_fnc\getPos\ws_fnc_NearestRoadPos.sqf";
	ws_fnc_NearestRoadPos = compile preprocessfile "ws_fnc\getPos\ws_fnc_NearestLandPos.sqf";
	ws_fnc_getBPos = compile preprocessfile "ws_fnc\getPos\ws_fnc_getBPos.sqf";

	//AI Functions
	ws_fnc_enterBuilding = compile preprocessfile "ws_fnc\AI\ws_fnc_enterBuildings.sqf";
	ws_fnc_taskDefend = compile preprocessfile "ws_fnc\AI\ws_fnc_taskDefend.sqf";
	ws_fnc_taskCrew = compile preprocessfile "ws_fnc\AI\ws_fnc_taskCrew.sqf";
	ws_fnc_createGroup = compile preprocessfile "ws_fnc\AI\ws_fnc_createGroup.sqf";
	ws_fnc_createVehicle = compile preprocessfile "ws_fnc\AI\ws_fnc_createVehicle.sqf";
	ws_fnc_addWaypoint = compile preprocessfile "ws_fnc\AI\ws_fnc_addWaypoint.sqf";
	ws_fnc_bettervehicle = compile preprocessfile "ws_fnc\AI\ws_fnc_betterVehicle.sqf";
	ws_fnc_setAIMode = compile preprocessfile "ws_fnc\AI\ws_fnc_setAIMode.sqf";
};

ws_fnc_compiled = true; publicVariable "ws_fnc_compiled";
