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

private ["_pos","_radius","_flag1","_flag2","_buildings","_bp"];

_pos = (_this select 0) call ws_fnc_getEPos;
_radius = _this select 1;
_flag1 = if (count _this > 2) then {_this select 2} else {true};
_flag2 = if (count _this > 3) then {_this select 3} else {false};

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
 		if (str _bp == "[0,0,0]" || typeName _bp != typeName []) then {_buildings = _buildings - [_x]};
	} forEach _buildings;
};

if (_flag2) then {
	{
		[_x] call ws_fnc_getBPos;
	} forEach _buildings;
};


_buildings