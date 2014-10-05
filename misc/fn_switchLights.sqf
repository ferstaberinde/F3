// SwitchLights function
// v1 (17.06.2013)
// By Wolfenswan [FA]: wolfenswanarps@gmail.com | folkarps.com
//
// FEATURE
// Flip on/off streetlights in a given area
//
// USAGE
// [switch,center,radius] call ws_fnc_switchLights;
//
// PARAMETERS
// 1. Switch can be "ON" or "OFF"								| MANDATORY
// 2. Center can be markername, object or positional array		| MANDATORY
// 3. Radius has to be number		| MANDATORY
//
// EXAMPLES
// ["OFF",church,1000] call ws_fnc_switchLights; - turn off all lights in 1k radius around the object named "church"
// ["ON",player,20] call ws_fnc_switchLights; - turn on all lights in 20m radius around the player

_switch = _this select 0;
_pos = (_this select 1) call ws_fnc_getEPos;
_radius = _this select 2;

[_switch,["STRING"],"ws_fnc_getPos"] call ws_fnc_typecheck;
[_radius,["SCALAR"],"ws_fnc_getPos"] call ws_fnc_typecheck;


if !(ws_game_a3) then {
//ARMA 2
	{
		_lamps = _pos nearObjects [_x, _radius];
		sleep 0.1;
		{_x switchLight _switch} forEach _lamps;
	} forEach ["Land_PowLines_WoodL", "Land_PowLines_ConcL", "Land_lampa_ind_zebr", "Land_lampa_sidl_3", "Land_lampa_vysoka", "Land_lampa_ind", "Land_lampa_ind_b", "Land_lampa_sidl"];
}
else {
//ARMA 3
	{
		_lamps = _pos nearObjects [_x, _radius];
		sleep 0.1;
		{
			if (_switch == "OFF") then {
				_lamp setHit ["light_1_hitpoint", 0.97]; //off
			} else {
				_x setHit ["light_1_hitpoint", 0]; //on
			};
		} forEach _lamps;
	} forEach ["Lamps_Base_F", "PowerLines_base_F", "Land_PowerPoleWooden_L_F", "Land_PowerPoleWooden_F", "Land_LampHarbour_F", "Land_LampShabby_F", "Land_PowerPoleWooden_L_F", "Land_PowerPoleWooden_small_F", "Land_LampDecor_F", "Land_LampHalogen_F", "Land_LampSolar_F", "Land_LampStreet_small_F", "Land_LampStreet_F", "Land_LampAirport_F"];
};





