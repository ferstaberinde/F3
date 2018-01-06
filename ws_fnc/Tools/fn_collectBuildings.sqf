/*ws_fnc_collectBuildings
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Collects all useable buildings (have building positions) in given radius

USAGE
Minimal
[center,radius] call ws_fnc_collectBuildings

Full
[center,radius,bool,bool] call ws_fnc_collectBuildings

PARAMETERS
1. Center from where to check - can be marker, object, location									| MANDATORY
2. Radius in which to check - number															| MANDATORY
3. Flag whether to ignore buildings without building positions									| OPTIONAL - default true
4. Flag whether to directly assign an array containing all building positions to the building	| OPTIONAL - default false

RETURNS
Array of useable buildings
*/

private ["_buildings","_bp"];

params [
	["_pos", objNull, ["", objNull, grpNull, locationNull, []]],
	["_radius", 0, [0]],
	["_flag1", true, [true]],
	["_flag2", false, [false]]
];

_pos = _pos call ws_fnc_getEPos;

_buildings = [];

//Fill buildings array with classes shared by both games
{
	_buildings append nearestObjects [_pos,[_x],_radius];
} forEach ["Fortress", "House","House_Small"];

//Add buildings specific to the game version
if !(ws_game_a3) then {
	{
		_buildings append nearestObjects [_pos,[_x],_radius];
	} forEach ["Church"];
} else

{
	{
	_buildings append nearestObjects [_pos,[_x],_radius];
	} forEach ["Ruins_F","BagBunker_base_F","Stall_base_F","Shelter_base_F"];
};

if (_flag1) then {
	{
		_bp = _x buildingPos 0;
 		if (str _bp == "[0,0,0]" || !(_bp isEqualType [])) then {_buildings = _buildings - [_x]};
	} forEach _buildings;
};

if (_flag2) then {
	{
		[_x] call ws_fnc_getBPos;
	} forEach _buildings;
};


_buildings
