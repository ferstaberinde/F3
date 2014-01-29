// F3 - Draw Nametag
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

_u = _this select 0;
_color = _this select 1;
_pos = _this select 2;
_suffix = if (count _this > 3) then {_this select 3} else {""};

_str = name _u + _suffix;

if (F_SHOWGROUP_NAMETAGS) then {_str = format ["%1 ",groupID (group _u)] + _str};
	drawIcon3D ["", _color, [_pos select 0,_pos select 1,(getPosATL _x select 2) + 2 + F_HEIGHT_NAMETAGS], 0, 0, 0, _str, 0,F_SIZE_NAMETAGS, F_FONT_NAMETAGS];


if (F_SHOWDISTANCE_NAMETAGS) then {
	_str = format ["%1 m",round (_pos distance player)];
	drawIcon3D ["", _color, [_pos select 0,_pos select 1,(getPosATL _x select 2) + 1.85 + F_HEIGHT_NAMETAGS], 0, 0, 0, _str, 0,F_SIZE_NAMETAGS - 0.15, F_FONT_NAMETAGS];
};

if (F_SHOWVEHICLE_NAMETAGS && !(typeOf (vehicle _u) isKindof "Man") && (assignedVehicleRole _u select 0 != "Cargo")) then {
	_str = format ["%1",getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayname")];
  drawIcon3D ["", _color, [_pos select 0,_pos select 1,(getPosATL _x select 2) + 1.75 + F_HEIGHT_NAMETAGS], 0, 0, 0, _str, 0,F_SIZE_NAMETAGS - 0.15, F_FONT_NAMETAGS];
};