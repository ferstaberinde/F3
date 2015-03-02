_colourType = _this select 0;

_r = profileNameSpace getVariable [_colourType + "_RGB_R", 0.8];
_g = profileNameSpace getVariable [_colourType + "_RGB_G", 0.5];
_b = profileNameSpace getVariable [_colourType + "_RGB_B", 0.0];
_a = profileNameSpace getVariable [_colourType + "_RGB_A", 0.8];

[_r, _g, _b, _a] call BIS_fnc_colorRGBAtoHTML