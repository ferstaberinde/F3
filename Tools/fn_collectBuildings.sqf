/*ws_fnc_collectBuildings
By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com

FEATURE
Collects all useable buildings in given radius

USAGE
[center,radius,bool] call ws_fnc_collectBuildings

PARAMETERS
1. Center from where to check - can be marker, object, location
2. Radius in which to check - integer
3. Flag whether to ignore buildings without building positions (defined in _badarray)

RETURNS
Array of useable buildings
*/

_pos = (_this select 0) call ws_fnc_getEPos;
_radius = _this select 1;
_flag = if (count _this > 2) then {_this select 2} else {true};

_buildings = [];

//Buildings always to exclude (e.g. lampposts etc.)
_badarray = ["Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_L_F","Land_spp_Transformer_F","Land_LampStreet_small_F","Land_PowerPoleWooden_L_F","Land_LampDecor_F","Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_L_F","Land_LampStreet_small_F","Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_L_F","Land_LampDecor_F","Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_L_F","Land_LampStreet_small_F","Land_LampDecor_F","Land_PowerPoleWooden_L_F","Land_TTowerBig_1_F","Land_PowerPoleWooden_L_F","Land_spp_Transformer_F","Land_Pier_Box_F","Land_LampHarbour_F","Land_LampHarbour_F","Land_LampHalogen_F","Land_PowerPoleWooden_L_F","Land_LampHarbour_F","Land_LampHarbour_F","Land_spp_Transformer_F","Land_LampStreet_small_F","Land_LampHalogen_F","Land_Shed_Big_F","Land_LampStreet_F","Land_PowerPoleWooden_L_F","Land_FuelStation_Feed_F","Land_FuelStation_Feed_F","Land_Shed_Big_F","Land_FuelStation_Feed_F","Land_dp_smallTank_F","Land_Shed_Big_F","Land_dp_smallFactory_F","Land_dp_smallTank_F","Land_Shed_Big_F","Land_LampHalogen_F","Land_LampHalogen_F","Land_spp_Transformer_F","Land_PowerPoleWooden_L_F","Land_LampShabby_F","Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_L_F","Land_Communication_anchor_F","Land_spp_Transformer_F","Land_Communication_anchor_F","Land_Communication_F","Land_LampShabby_F","Land_Communication_anchor_F","Land_Communication_anchor_F","Land_LampHalogen_F","Land_spp_Transformer_F","Land_Pier_addon","Land_LampHalogen_F","Land_Pier_addon","Land_Pier_addon","Land_spp_Transformer_F","Land_Shed_Small_F","Land_Pier_addon","Land_LampStreet_F","Land_Shed_Small_F","Land_spp_Transformer_F","Land_spp_Transformer_F","Land_dp_smallFactory_F","Land_Shed_Big_F","Land_Shed_Small_F","Land_LampHalogen_F","Land_Shed_Big_F","Land_Shed_Small_F","Land_Shed_Big_F","Land_Shed_Small_F","Land_Shed_Big_F","Land_spp_Transformer_F","Land_LampHalogen_F","Land_Shed_Big_F","Land_LampStreet_F","Land_spp_Transformer_F","Land_Shed_Big_F","Land_Shed_Small_F","Land_Shed_Small_F","Land_Shed_Big_F","Land_dp_smallFactory_F","Land_Shed_Small_F","Land_Obstacle_Climb_F","Land_LampHalogen_F","Land_dp_smallTank_F","Land_dp_smallFactory_F","Land_Pier_small_F"];

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

if (_flag) then {
	{
		if (typeOf _x in _badarray) then {_buildings = _buildings - [_x]};
	} forEach _buildings;
};


_buildings