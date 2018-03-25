//====================================================================================
//
//	f_nametagInit.sqf - Initializes values for WH nametags.
//
//	[] execVM "f\nametag\f_nametagInit.sqf";
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Initial setup.
//------------------------------------------------------------------------------------

//	Make sure this isn't a dedicated server or headless client.
if (!hasInterface) exitWith {};

//	Global variable that will be flipped on and off using the disableKey and CBA.
F_NT_NAMETAGS_ON = true;

//	Determine which mods are active.
#include "include\f_nametagCheckMods.sqf";


//------------------------------------------------------------------------------------
//	Configuration and settings import and setup.
//------------------------------------------------------------------------------------

//	Allows for missionmaker configuration of important settings.
#include "f_nametagCONFIG.sqf"

//	Allows for player (client) configuration of other settings.
#include "include\f_nametagSettings.sqf"


//------------------------------------------------------------------------------------
//	More preparation.
//------------------------------------------------------------------------------------

//	Let the player initialize properly.
waitUntil{!isNull player};
waitUntil{player == player};

// Don't run this for zeus and virtual spectators
if (side player isEqualto sideLogic) exitWith {};

//	Reset font spacing and size to (possibly) new conditions.
call f_fnc_nametagResetFont;

//	Setting up cursor cache and fader.
F_NT_CACHE_CURSOR = objNull;
F_NT_CACHE_CURSOR_DATA = [];
F_NT_CACHE_FADE = [[],[],[]];

//	Wait for player to get ingame.
waitUntil {!isNull (findDisplay 46)};

//	Setting up our disableKey (Default '+')
#include "include\f_nametagDisableKey.sqf"


//------------------------------------------------------------------------------------
//	Keep an updated cache of all tags to draw.
//------------------------------------------------------------------------------------

#include "include\f_nametagCacheLoop.sqf"


//------------------------------------------------------------------------------------
//	Render nametags from the cache every frame.
//------------------------------------------------------------------------------------

F_NT_EVENTHANDLER = addMissionEventHandler
["Draw3D",
{
	if F_NT_NAMETAGS_ON then
	{	call f_fnc_nametagUpdate	};
}];

//------------------------------------------------------------------------------------
//	Add briefing with configurable options.
//------------------------------------------------------------------------------------

#include "include\f_nametagBrief.sqf"
