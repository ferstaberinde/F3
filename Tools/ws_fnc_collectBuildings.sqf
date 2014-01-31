/*ws_fnc_collectBuildings
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Collects all buildings in given radius

USAGE
[center,radius] call ws_fnc_collectBuildings

RETURNS
Array of buildings
*/

_pos = (_this select 0) call ws_fnc_getEPos;
_radius = _this select 1;

_buildings = [];

//Fill buildings array with classes shared by both games
{
_buildings = _buildings + nearestObjects [_pos,[_x],_radius];
} forEach ["Fortress", "House","House_Small","RUINS"];

//Add buildings specific to the game version
if !(ws_game_a3) then {
	{
	_buildings = _buildings + nearestObjects [_pos,[_x],_radius];
	} forEach ["Church"];
};

if (ws_game_a3) then {
	{
	_buildings = _buildings + nearestObjects [_pos,[_x],_radius];
	} forEach ["BagBunker_base_F","Stall_base_F","Shelter_base_F"];
};

_buildings