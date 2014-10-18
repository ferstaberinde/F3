// F3 - Draw Nametag
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

private ["_u","_pos","_suffix","_color","_str","_height"];

// Declare variables
_u = _this select 0;
_pos = _this select 1;
_height = f_height_standing_Nametags;
switch (stance _u) do {
    case "CROUCH": {
    	_height = f_height_crouch_Nametags;
    };
    case "PRONE": {
		_height = f_height_prone_Nametags;
	};
};
_suffix = if (count _this > 2) then {_this select 2} else {""};

_str = name _u + _suffix;

//If the unit is dead, exit.
if (!alive _u) exitWith {};

// Define the color of the nametag
_color = F_COLOR_NAMETAGS; // Default color
if (_suffix != "") then {_color = F_COLOR2_NAMETAGS};						 // Mounted units
if(_x in units player) then { _color = f_groupColor_Nametags }; // Units of same group

if (F_SHOWGROUP_NAMETAGS) then {_str = format ["%1 ",groupID (group _u)] + _str};
	drawIcon3D ["", _color, [_pos select 0,_pos select 1,(getPosATL _x select 2) + _height], 0, 0, 0, _str, F_SHADOW_NAMETAGS,F_SIZE_NAMETAGS, F_FONT_NAMETAGS];

if (F_SHOWDISTANCE_NAMETAGS) then {
	_str = format ["%1 m",round (_pos distance player)];
	drawIcon3D ["", _color, [_pos select 0,_pos select 1,(getPosATL _x select 2) - 0.15 + _height], 0, 0, 0, _str, F_SHADOW_NAMETAGS,F_SIZE_NAMETAGS - 0.15, F_FONT_NAMETAGS];
};

if (F_SHOWVEHICLE_NAMETAGS && !(typeOf (vehicle _u) isKindof "Man") && (assignedVehicleRole _u select 0 != "Cargo")) then {
	_str = format ["%1",getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayname")];
  drawIcon3D ["", _color, [_pos select 0,_pos select 1,(getPosATL _x select 2) - 0.25 + _height], 0, 0, 0, _str, F_SHADOW_NAMETAGS,F_SIZE_NAMETAGS - 0.15, F_FONT_NAMETAGS];
};