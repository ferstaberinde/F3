// F3 - Draw Nametag
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

private ["_u","_pos","_suffix","_color","_str","_height","_showgroup","_showdis","_showveh","_veh"];

// Declare variables
_u = _this select 0;
_pos = _this select 1;
_height =
switch (stance _u) do {
    case "CROUCH": {
    	f_height_crouch_Nametags;
    };
    case "PRONE": {
		f_height_prone_Nametags;
	};
	default {f_height_standing_Nametags};
};
_suffix = if (count _this > 2) then {_this select 2} else {""};

_str = name _u + _suffix;

//If the unit is dead, exit.
if (!alive _u) exitWith {};

// Define the color of the nametag
_color = F_COLOR_NAMETAGS; // Default color
if (_suffix != "") then {_color = F_COLOR2_NAMETAGS};			// Mounted units
if(_x in units player) then { _color = f_groupColor_Nametags }; // Units of same group

// Check which tags to show
_showgroup = if (!isNil "F_SHOWGROUP_NAMETAGS") then [{F_SHOWGROUP_NAMETAGS},{false}];
_showdis = if (!isNil "F_SHOWDISTANCE_NAMETAGS") then [{F_SHOWDISTANCE_NAMETAGS},{false}];
_showveh = if (!isNil "f_showVehicle_Nametags") then [{f_showVehicle_Nametags},{false}];

// Show group name for other groups only
if (_showgroup && group _u != group player) then {_str = format ["%1 ",groupID (group _u)] + _str};

// Show distance for units in over 3m distance only
if (_showdis && {_pos distance player >= 3}) then {
	_str = _str + format [" - %1m",round (_pos distance player)];
	//drawIcon3D ["", _color, [_pos select 0,_pos select 1,(getPosATL _x select 2) - _height], 0, 0, 0, _str, F_SHADOW_NAMETAGS,(F_SIZE_NAMETAGS - 0.005), F_FONT_NAMETAGS];
};

drawIcon3D ["", _color, [_pos select 0,_pos select 1,(getPosATL _x select 2) + _height], 0, 0, 0, _str, F_SHADOW_NAMETAGS,F_SIZE_NAMETAGS, F_FONT_NAMETAGS];

// Show vehicle type only for vehicles the player is not crewing himself
if (_showveh && {!(typeOf (vehicle _u) isKindof "Man") && vehicle _u != vehicle player && ((_u == driver vehicle _u) || (_u == gunner vehicle _u))}) then {
  _str = format ["%1",getText (configFile >> "CfgVehicles" >> (typeOf vehicle _u) >> "displayname")];
  drawIcon3D ["", _color, [_pos select 0,_pos select 1,(getPosATL _x select 2) + _height - 0.2], 0, 0, 0, _str,F_SHADOW_NAMETAGS,F_SIZE_NAMETAGS,F_FONT_NAMETAGS];
};